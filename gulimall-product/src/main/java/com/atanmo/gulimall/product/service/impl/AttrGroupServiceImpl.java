package com.atanmo.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.common.utils.Query;

import com.atanmo.gulimall.product.dao.AttrGroupDao;
import com.atanmo.gulimall.product.entity.AttrGroupEntity;
import com.atanmo.gulimall.product.service.AttrGroupService;
import org.springframework.util.StringUtils;


@Service("attrGroupService")
public class AttrGroupServiceImpl extends ServiceImpl<AttrGroupDao, AttrGroupEntity> implements AttrGroupService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrGroupEntity> page = this.page(
                new Query<AttrGroupEntity>().getPage(params),
                new QueryWrapper<AttrGroupEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Long catelogId) {
        //如果是分类为0，就默认查出全部数据
        if (catelogId == 0){
            this.page(new Query<AttrGroupEntity>().getPage(params),
                    new QueryWrapper<AttrGroupEntity>());
        }
        String key = (String) params.get("key");
        LambdaQueryWrapper<AttrGroupEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(AttrGroupEntity::getCatelogId,catelogId);
        if (StringUtils.hasLength(key)){
            //检索有可能是id  也有可能是组名
            lambdaQueryWrapper.and(wrapper -> wrapper.eq(AttrGroupEntity::getAttrGroupId, key)
                    .or().like(AttrGroupEntity::getAttrGroupName, key));
        }
        IPage<AttrGroupEntity> page = this.page(new Query<AttrGroupEntity>().getPage(params), lambdaQueryWrapper);
        return new PageUtils(page);
    }

}
