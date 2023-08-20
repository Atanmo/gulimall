package com.atanmo.gulimall.product.service.impl;

import com.atanmo.gulimall.common.utils.BeanCopyUtils;
import com.atanmo.gulimall.product.entity.vo.CategoryVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
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
@Slf4j
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
        return all.stream().filter(categoryVo -> categoryVo.getParentCid() == 0)
                .map(categoryVo -> {
                    categoryVo.setChildren(getChildrens(categoryVo, all));
                    return categoryVo;
                })
                .sorted((menu1, menu2) -> (menu1.getSort() == null ? 0 : menu1.getSort()) - (menu2.getSort() == null ? 0 : menu2.getSort()))
                .collect(Collectors.toList());
    }

    /**
     * 查询分类的完整id 父/子/孙
     * @param categoryId
     * @return Long[]
     */
    @Override
    public Long[] findCateLogPath(Long categoryId) {
        List<Long> path = new ArrayList<>();
        //调用递归返回完整的分类Id 三级路径
        List<Long> parentPath = this.findParentPath(categoryId, path);
        //进行逆序排列分类编号
        Collections.reverse(parentPath);

        return path.toArray(new Long[path.size()]);
    }

    private List<Long> findParentPath(Long categoryId,List<Long> path){
        //集合收集当前节点
        path.add(categoryId);
        Long parentCid = this.getById(categoryId).getParentCid();
        if (parentCid != 0){
            //说明有父节点id,那么继续递归查询收集节点
            this.findParentPath(parentCid,path);
        }
        return path;
    }

    private List<CategoryVo> getChildrens(CategoryVo root, List<CategoryVo> all) {

        List<CategoryVo> children = all.stream()
                .filter(categoryVo -> categoryVo.getParentCid() == root.getCatId())
                //1、找到子菜单
                .map(categoryVo -> {
                    categoryVo.setChildren(getChildrens(categoryVo,all));
                    categoryVo.setParentName(root.getName());
                    return categoryVo;
                })
                .sorted((menu1,menu2)-> (menu1.getSort()==null?0:menu1.getSort()) - (menu2.getSort()==null?0:menu2.getSort()))
                .collect(Collectors.toList());

        return children;
    }

}
