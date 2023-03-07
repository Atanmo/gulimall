package com.atanmo.gulimall.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.coupon.entity.SeckillSkuNoticeEntity;

import java.util.Map;

/**
 * 秒杀商品通知订阅
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 14:45:13
 */
public interface SeckillSkuNoticeService extends IService<SeckillSkuNoticeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

