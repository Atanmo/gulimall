package com.atanmo.gulimall.thirdparty.config.oss;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("alibabaProperty")
@Data
public class AlibabaProperty {

    @Value("${spring.cloud.alicloud.access-key}")
    private String accessKey;

    @Value("${spring.cloud.alicloud.secret-key}")
    private String secretKey;

    @Value("${spring.cloud.alicloud.oss.endpoint}")
    private String endpoint;

    @Value("${spring.cloud.alicloud.oss.bucket}")
    private String bucket;




}
