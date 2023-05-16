package com.atanmo.gulimall.product.entity.vo;

import com.atanmo.gulimall.product.entity.CategoryEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class CategoryVo extends CategoryEntity {

    @Accessors(chain = true)
    private List<CategoryVo> children;

}
