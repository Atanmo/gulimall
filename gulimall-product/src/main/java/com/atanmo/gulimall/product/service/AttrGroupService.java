package com.atanmo.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.product.entity.AttrGroupEntity;

import java.util.Map;

/**
 * 属性分组
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
public interface AttrGroupService extends IService<AttrGroupEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPage(Map<String, Object> params, Long catelogId);

}

