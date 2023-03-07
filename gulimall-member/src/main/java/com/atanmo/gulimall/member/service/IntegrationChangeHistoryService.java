package com.atanmo.gulimall.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.member.entity.IntegrationChangeHistoryEntity;

import java.util.Map;

/**
 * 积分变化历史记录
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 15:22:25
 */
public interface IntegrationChangeHistoryService extends IService<IntegrationChangeHistoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

