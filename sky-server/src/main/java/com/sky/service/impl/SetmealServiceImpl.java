package com.sky.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sky.constant.MessageConstant;
import com.sky.constant.StatusConstant;
import com.sky.dto.SetmealDTO;
import com.sky.dto.SetmealPageQueryDTO;
import com.sky.entity.Category;
import com.sky.entity.Dish;
import com.sky.entity.Setmeal;
import com.sky.entity.SetmealDish;
import com.sky.exception.DeletionNotAllowedException;
import com.sky.exception.SetmealEnableFailedException;
import com.sky.mapper.CategoryMapper;
import com.sky.mapper.DishMapper;
import com.sky.mapper.SetmealDishMapper;
import com.sky.mapper.SetmealMapper;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.SetmealService;
import com.sky.vo.DishItemVO;
import com.sky.vo.SetmealDishVO;
import com.sky.vo.SetmealVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SetmealServiceImpl implements SetmealService {
    @Autowired
    private SetmealMapper setmealMapper;
    @Autowired
    private SetmealDishMapper setmealDishMapper;
    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private DishMapper dishMapper;

    /**
     * 插入菜品数据
     * @param setmealDTO
     */
    @Transactional
    public void insert(SetmealDTO setmealDTO) {
        //首先插入套餐的基本信息,再插入关联的菜品信息
        //1.插入套餐的基本信息
        Setmeal setmeal = new Setmeal();
        BeanUtils.copyProperties(setmealDTO,setmeal);
        setmealMapper.insert(setmeal);

        //2.插入关联的菜品信息
        Long setmealId = setmeal.getId();
        List<SetmealDish> setmealDishes = setmealDTO.getSetmealDishes();
        //对关联的菜品集合进行判断,如果有数据就插入
        if (setmealDishes != null && setmealDishes.size() >0){
            for (SetmealDish setmealDish : setmealDishes) {
                setmealDish.setSetmealId(setmealId);

            }
            //根据套餐id,批量插入
            setmealDishMapper.insertBatch(setmealDishes);
        }


    }

    /**
     * 套餐分页查询
     * @param setmealPageQueryDTO
     * @return
     */
    public PageResult pageQuery(SetmealPageQueryDTO setmealPageQueryDTO) {
        PageHelper.startPage(setmealPageQueryDTO.getPage(), setmealPageQueryDTO.getPageSize());
        Page<SetmealVO> page = setmealMapper.pageQuery(setmealPageQueryDTO);
        return new PageResult(page.getTotal(),page.getResult()) ;
    }

    /**
     * 根据id查询套餐
     *
     * @param id
     * @return
     */
    public SetmealVO getById(Long id) {
        //根据id查询套餐的基本信息
        Setmeal setmeal = setmealMapper.getById(id);
        if (setmeal == null) {
            return null;
        }
        Long setmealId = setmeal.getId();

        //再根据套餐id在套餐_菜品表里查关联的菜品数据
        List<SetmealDishVO> setmealDishList = setmealDishMapper.getDishBySetmealId(setmealId);

        //组合套餐的基本信息和关联的菜品
        SetmealVO setmealVO = new SetmealVO();
        BeanUtils.copyProperties(setmeal,setmealVO);

        setmealVO.setSetmealDishes(setmealDishList);

        Category category = categoryMapper.getById(setmeal.getCategoryId());
        if(category != null){
            setmealVO.setCategoryName(category.getName());
        }
        return setmealVO;
    }

    /**
     * 修改套餐
     *
     * @param setmealDTO
     * @return
     */
    @Transactional
    public void update(SetmealDTO setmealDTO) {
        //先修改套餐的基本信息
        Long setmealId = setmealDTO.getId();
        Setmeal setmeal = new Setmeal();
        BeanUtils.copyProperties(setmealDTO,setmeal);
        setmealMapper.update(setmeal);

        //根据套餐id删除关联的菜品数据
        setmealDishMapper.delete(setmealId);

        //再拿到新的菜品数据集合,重新对其赋上新的套餐id
        List<SetmealDish> setmealDishes = setmealDTO.getSetmealDishes();
        if (setmealDishes != null && setmealDishes.size() > 0) {
            for (SetmealDish setmealDish : setmealDishes) {
                setmealDish.setSetmealId(setmealId);
            }
            //插入新的菜品关联数据
            setmealDishMapper.insertBatch(setmealDishes);
        }
    }

    /**
     * 启售停售套餐
     * @param status
     * @param id
     * @return
     */
    public void startOrStop(Integer status, Long id) {
        //判断操作类型,启售还是停售
        //如果是启售,判断当前套餐所关联的菜品是否全部为启售,有停售的菜品时不能启售套餐
        Dish dish1 = new Dish();
        if (StatusConstant.ENABLE.equals(status)){
            //根据套餐id查询关联的菜品信息
            List<SetmealDishVO> dishs = setmealDishMapper.getDishBySetmealId(id);
            for (SetmealDishVO dish : dishs) {
                Long id1 = dish.getId();
                dish1.setId(id1);
                //根据菜品id查询菜品的售卖状态
                Integer dishStatus = dishMapper.getById(id1).getStatus();
                if (StatusConstant.DISABLE == dishStatus){
                    throw new SetmealEnableFailedException(MessageConstant.SETMEAL_ENABLE_FAILED);
                }
            }

        }
        Setmeal setmeal = Setmeal.builder()
                .id(id)
                .status(status)
                .build();
        //停售操作
        setmealMapper.update(setmeal);
    }

    /**
     * 批量删除套餐
     * @param ids
     * @return
     */
    @Transactional
    public void deleteBatch(List<Long> ids) {
        for (Long id : ids) {
            //要求:启售中的套餐不能删除,删除套餐必须删除关联表的数据
            //1.判断套餐的售卖状态
            Setmeal setmeal = setmealMapper.getById(id);
            if(StatusConstant.ENABLE.equals(setmeal.getStatus())){
                throw new DeletionNotAllowedException(MessageConstant.SETMEAL_ON_SALE);
            }
        }
        //开始删除
        //先删除套餐的基本信息
        setmealMapper.deleteBatch(ids);
        //再删除套餐_菜品中间表的数据
        setmealDishMapper.deleteBySetmealIds(ids);
    }

    /**
     * 条件查询
     * @param setmeal
     * @return
     */
    public List<Setmeal> list(Setmeal setmeal) {
        List<Setmeal> list = setmealMapper.list(setmeal);
        return list;
    }

    /**
     * 根据id查询菜品选项
     * @param id
     * @return
     */
    public List<DishItemVO> getDishItemById(Long id) {
        return setmealMapper.getDishItemBySetmealId(id);
    }


}
