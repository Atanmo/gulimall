package com.atanmo.gulimall.product.dao;

import com.atanmo.gulimall.product.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品三级分类
 * 
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}
