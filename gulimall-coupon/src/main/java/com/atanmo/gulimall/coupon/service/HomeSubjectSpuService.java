package com.atanmo.gulimall.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.coupon.entity.HomeSubjectSpuEntity;

import java.util.Map;

/**
 * δΈι’εε
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 14:45:13
 */
public interface HomeSubjectSpuService extends IService<HomeSubjectSpuEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

