package com.atanmo.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.common.utils.Query;

import com.atanmo.gulimall.product.dao.BrandDao;
import com.atanmo.gulimall.product.entity.BrandEntity;
import com.atanmo.gulimall.product.service.BrandService;


@Service("brandService")
public class BrandServiceImpl extends ServiceImpl<BrandDao, BrandEntity> implements BrandService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<BrandEntity> page = this.page(
                new Query<BrandEntity>().getPage(params),
                new QueryWrapper<BrandEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 修改品牌显示状态
     * @param brand 品牌ID和显示状态
     */
    @Override
    public void updateStatus(BrandEntity brand) {
        LambdaUpdateWrapper<BrandEntity> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.set(BrandEntity::getShowStatus,brand.getShowStatus());
        lambdaUpdateWrapper.eq(BrandEntity::getBrandId,brand.getBrandId());
        update(lambdaUpdateWrapper);
    }

}
