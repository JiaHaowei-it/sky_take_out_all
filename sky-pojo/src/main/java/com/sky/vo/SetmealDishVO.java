package com.sky.vo;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class SetmealDishVO {
    private Long id;
    private Long setmealId;
    private Long dishId;
    private Integer copies;
    private String name;
    private BigDecimal price;
}
