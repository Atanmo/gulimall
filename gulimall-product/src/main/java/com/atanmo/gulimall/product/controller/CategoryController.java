package com.atanmo.gulimall.product.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.atanmo.gulimall.product.entity.vo.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.atanmo.gulimall.product.entity.CategoryEntity;
import com.atanmo.gulimall.product.service.CategoryService;
import com.atanmo.gulimall.common.utils.PageUtils;
import com.atanmo.gulimall.common.utils.R;

import javax.annotation.Resource;


/**
 * 商品三级分类
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
@RestController
@RequestMapping("product/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;


    /**
     * 列表
     */
    @RequestMapping("/list/tree")
    public R list(@RequestParam Map<String, Object> params){
        List<CategoryVo> treeList = categoryService.listWithTree();
        return R.ok().put("data", treeList);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{catId}")
    public R info(@PathVariable("catId") Long catId){
		CategoryEntity category = categoryService.getById(catId);

        return R.ok().put("category", category);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CategoryEntity category){
		categoryService.save(category);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CategoryEntity category){
		categoryService.updateById(category);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] catIds){
		categoryService.removeByIds(Arrays.asList(catIds));
        return R.ok();
    }

}
