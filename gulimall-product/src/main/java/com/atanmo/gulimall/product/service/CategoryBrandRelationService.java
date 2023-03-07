package com.atanmo.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.product.entity.CategoryBrandRelationEntity;
import com.atanmo.gulimall.common.utils.PageUtils;
import java.util.Map;

/**
 * 品牌分类关联
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

