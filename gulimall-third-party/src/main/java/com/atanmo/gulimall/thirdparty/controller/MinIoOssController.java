package com.atanmo.gulimall.thirdparty.controller;


import com.atanmo.gulimall.common.utils.R;
import com.atanmo.gulimall.thirdparty.utils.oss.MinioUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@Slf4j
@RestController
public class MinIoOssController {

    @Resource
    private MinioUtil minioUtil;



    @GetMapping("/oss/minio/policy")
    public R getPolicy(String fileName) throws Exception {
        Map<String, String> policySignatureInfo = minioUtil.getPolicyFromDataToMap(fileName);
        return R.ok().put("data",policySignatureInfo);
    }
}
