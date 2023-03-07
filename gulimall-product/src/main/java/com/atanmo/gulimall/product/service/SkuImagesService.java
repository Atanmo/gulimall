package com.atanmo.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.product.entity.SkuImagesEntity;
import com.atanmo.gulimall.common.utils.PageUtils;

import java.util.Map;

/**
 * sku图片
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
public interface SkuImagesService extends IService<SkuImagesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

