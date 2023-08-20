package com.atanmo.gulimall.common.vaild.annotation;


import com.atanmo.gulimall.common.vaild.vaildator.ListValueConstraintVaildator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = {ListValueConstraintVaildator.class})
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.PARAMETER, ElementType.TYPE_USE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ListValue {


    String message() default "{com.atanmo.common.valid.ListValue.message}";

    Class<?>[] groups() default {};

    int[] vals() default {};

}
