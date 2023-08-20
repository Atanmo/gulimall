package com.atanmo.gulimall.common.vaild.vaildator;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.system.oshi.OshiUtil;
import com.atanmo.gulimall.common.vaild.annotation.ListValue;
import lombok.extern.slf4j.Slf4j;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.HashSet;
import java.util.Set;

@Slf4j
public class ListValueConstraintVaildator implements ConstraintValidator<ListValue,Integer> {

    private Set<Integer> set = new HashSet<>();
    @Override
    public void initialize(ListValue constraintAnnotation) {
        //初始化校验器数据
        int[] vals = constraintAnnotation.vals();
        if (ObjectUtil.isNotEmpty(vals)){
            for (int val : vals) {
                set.add(val);
            }
        }
        log.info("=======校验是否显示时 values未给指定 请添加注解时进行指定=======");
    }

    @Override
    public boolean isValid(Integer integer, ConstraintValidatorContext constraintValidatorContext) {
        return set.contains(integer);
    }
}
