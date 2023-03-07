package com.atanmo.gulimall.gulimallproduct;

import com.atanmo.gulimall.product.entity.BrandEntity;
import com.atanmo.gulimall.product.service.BrandService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest(classes = com.atanmo.gulimall.product.GulimallProductApplication.class)
class GulimallProductApplicationTests {

	@Resource
	private BrandService brandService;

	@Test
	void contextLoads() {
//		BrandEntity brandEntity = new BrandEntity();
//		brandEntity.setName("Realme");
//		brandService.save(brandEntity);
//		System.out.println("保存成功");
		BrandEntity brandEnti = brandService.getOne(new LambdaQueryWrapper<BrandEntity>().eq(BrandEntity::getName, "Realme"));
		System.out.println(brandEnti.getName());
	}

}
