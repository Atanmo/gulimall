package com.atanmo.gulimall.member.dao;

import com.atanmo.gulimall.member.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员
 * 
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-06 15:22:25
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {
	
}
