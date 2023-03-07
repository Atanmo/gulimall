package com.atanmo.gulimall.coupon.dao;

import com.atanmo.gulimall.coupon.entity.CouponEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 优惠券信息
 * 
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 14:45:13
 */
@Mapper
public interface CouponDao extends BaseMapper<CouponEntity> {
	
}
