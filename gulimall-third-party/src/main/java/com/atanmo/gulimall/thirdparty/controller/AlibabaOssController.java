package com.atanmo.gulimall.thirdparty.controller;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;
import com.atanmo.gulimall.common.utils.R;
import com.atanmo.gulimall.thirdparty.config.oss.AlibabaProperty;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@RestController
public class AlibabaOssController {

    @Resource
    private OSS ossClient;

    @Resource
    private AlibabaProperty alibabaProperty;

    /**
     * 签名直传oss,获取签名信息
     * @return
     * @throws Exception
     */
    @RequestMapping("/oss/policy")
    public R policy() throws Exception {
        Map<String, String> respMap = null;
        String host = "https://"+alibabaProperty.getBucket()+"."+alibabaProperty.getEndpoint();
        //设置按照日期去存储文件
        String dir = new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"/";

        try {
            long expireTime = 30;
            long expireEndTime = System.currentTimeMillis() + expireTime * 1000;
            Date expiration = new Date(expireEndTime);
            PolicyConditions policyConds = new PolicyConditions();
            policyConds.addConditionItem(PolicyConditions.COND_CONTENT_LENGTH_RANGE, 0, 1048576000);
            policyConds.addConditionItem(MatchMode.StartWith, PolicyConditions.COND_KEY, dir);

            String postPolicy = ossClient.generatePostPolicy(expiration, policyConds);
            byte[] binaryData = postPolicy.getBytes("utf-8");
            String encodedPolicy = BinaryUtil.toBase64String(binaryData);
            String postSignature = ossClient.calculatePostSignature(postPolicy);

            respMap= new LinkedHashMap<String, String>();
            respMap.put("accessid", alibabaProperty.getAccessKey());
            respMap.put("policy", encodedPolicy);
            respMap.put("signature", postSignature);
            respMap.put("dir", dir);
            respMap.put("host", host);
            respMap.put("expire", String.valueOf(expireEndTime / 1000));

        } catch (Exception e) {
            // Assert.fail(e.getMessage());
            System.out.println(e.getMessage());
        }
        return R.ok().put("data",respMap);
    }

}
