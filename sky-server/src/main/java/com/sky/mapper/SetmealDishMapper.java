package com.sky.mapper;

import com.sky.entity.SetmealDish;
import com.sky.vo.SetmealDishVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SetmealDishMapper {
    /**
     * 根据菜品id查询套餐id
     * @param dishIds
     * @return
     */
    //select setmeal_id from setmeal_dish where dish_id in(1,2,3)
    List<Long> getSetmealIdsByDishIds(List<Long> dishIds);

    /**
     * 根据单个菜品id查询套餐id
     * @param id
     * @return
     */
    //@Select("select setmeal_id from setmeal_dish where dish_id =#{id}")
    List<Long> getSetmealIdsByDishId(Long id);

    /**
     * 根据套餐id批量插入关联的菜品数据到setmeal_dish表
     * @param setmealDishes
     */
    //这里插入的是集合数据,不能加@Autofill注解
    void insertBatch(List<SetmealDish> setmealDishes);


    List<SetmealDishVO> getDishBySetmealId(Long setmealId);

    /**
     * 根据套餐id删除关联的菜品数据
     * @param setmealId
     */
    @Delete("delete from setmeal_dish where setmeal_id = #{id};")
    void delete(Long setmealId);

    /**
     * 根据套餐id批量删除套餐_菜品中间表中的菜品数据
     * @param ids
     */
    void deleteBySetmealIds(@Param("ids") List<Long> ids);
}
