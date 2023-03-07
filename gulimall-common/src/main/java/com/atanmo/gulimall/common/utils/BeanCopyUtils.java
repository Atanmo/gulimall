package com.atanmo.gulimall.common.utils;

import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

public class BeanCopyUtils {

    private BeanCopyUtils(){}

    /**
     * 通过原bean复制到vo字段中 其属性名必须一致
     * @param source
     * @param clazz
     * @param <V>
     * @return
     */
    public static <V> V copyBean(Object source,Class<V> clazz){
        V v = null;
        try {
            //创建要复制的类型
            v = clazz.newInstance();
            //复制对象字段
            BeanUtils.copyProperties(source,v);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }

    /**
     * 通过原集合内到数据 复制到VO对象List集合中
     * @param <V>
     * @param sourceList
     * @param clazz
     * @return
     */
    public static <L,V> List<V> copyBeanList(List<L> sourceList, Class<V> clazz){
        return sourceList.stream()
                .map(o -> copyBean(o,clazz))
                .collect(Collectors.toList());
    }

}
