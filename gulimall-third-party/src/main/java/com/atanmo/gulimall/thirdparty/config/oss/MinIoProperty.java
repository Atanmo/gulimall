package com.atanmo.gulimall.thirdparty.config.oss;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component("minIoProperty")
@ConfigurationProperties(prefix = "minio")
public class MinIoProperty {

    private String url;

    private String accessKey;

    private String secretKey;

    private String bucketName;
}
