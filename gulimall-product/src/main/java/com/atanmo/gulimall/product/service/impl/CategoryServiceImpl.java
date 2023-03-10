package com.atanmo.gulimall.product.service.impl;

import com.atanmo.gulimall.common.utils.BeanCopyUtils;
import com.atanmo.gulimall.product.entity.vo.CategoryVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.common.utils.Query;

import com.atanmo.gulimall.product.dao.CategoryDao;
import com.atanmo.gulimall.product.entity.CategoryEntity;
import com.atanmo.gulimall.product.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

    /**
     * 返回三级树形菜单分类列表
     *
     * @return List<CategoryEntity>
     */
    @Override
    public List<CategoryVo> listWithTree() {
        //查出全部的分类数据 并转换为分类VO
        List<CategoryVo> all = BeanCopyUtils.copyBeanList(list(), CategoryVo.class);
        //过滤出全部的root父级数据
        all.stream().filter(categoryVo -> categoryVo.getParentCid() == 0)
                .map(categoryVo -> categoryVo.setChildren(getChildrens(categoryVo,all)))



        return null;
    }

    private List<CategoryVo> getChildrens(CategoryVo categoryVo, List<CategoryVo> all) {

        return null;
    }

}