package com.atanmo.gulimall.product.entity;

import com.atanmo.gulimall.common.vaild.annotation.ListValue;
import com.atanmo.gulimall.common.vaild.groups.AddGroup;
import com.atanmo.gulimall.common.vaild.groups.UpdateGroup;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.*;
import java.io.Serializable;

/**
 * 品牌
 *
 * @author WuWei
 * @email 877705308@qq.com
 * @date 2023-03-03 13:49:28
 */
@Data
@TableName("pms_brand")
public class BrandEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 品牌id
	 */
	@TableId
	@NotNull(message = "修改必须指定品牌id",groups = {UpdateGroup.class})
	@Null(message = "新增不需要指定品牌id",groups = {AddGroup.class})
	private Long brandId;
	/**
	 * 品牌名
	 */
	@NotBlank(message = "品牌名必须提交",groups = {AddGroup.class, UpdateGroup.class})
	private String name;
	/**
	 * 品牌logo地址
	 */
	@URL(message = "必须是一个合法的Url地址",groups = {UpdateGroup.class, AddGroup.class})
	@NotBlank(message = "logo地址不能为空",groups = {AddGroup.class})
	private String logo;
	/**
	 * 介绍
	 */
	private String descript;
	/**
	 * 显示状态[0-不显示；1-显示]
	 */

	@NotNull(message = "显示状态必须指定",groups = {AddGroup.class,UpdateGroup.class})
	@ListValue(vals = {0,1},groups = {AddGroup.class,UpdateGroup.class})
	private Integer showStatus;
	/**
	 * 检索首字母
	 */
	@NotEmpty(message = "新增必须指定检索首字母",groups = {AddGroup.class})
	@Pattern(regexp = "^[a-zA-Z]${1}",message = "检索首字母必须是一个字母")
	private String firstLetter;
	/**
	 * 排序
	 */

	@NotNull(message = "新增必须指定排序号",groups = {AddGroup.class})
	@Min(message = "排序必须大于等于0",value = 0,groups = {AddGroup.class, UpdateGroup.class})
	private Integer sort;

}
