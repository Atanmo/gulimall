package com.atanmo.gulimall.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.order.entity.OmsOrderSettingEntity;

import java.util.Map;

/**
 * 订单配置信息
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 11:39:10
 */
public interface OmsOrderSettingService extends IService<OmsOrderSettingEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

