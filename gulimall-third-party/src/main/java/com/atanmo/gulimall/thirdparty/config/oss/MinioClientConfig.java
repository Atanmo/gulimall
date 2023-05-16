package com.atanmo.gulimall.thirdparty.config.oss;

import io.minio.BucketExistsArgs;
import io.minio.MinioClient;
import io.minio.messages.Bucket;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;


@Slf4j
@Component
@Configuration
public class MinioClientConfig {

    @Resource
    private MinIoProperty minIoProperty;

    private static MinioClient minioClient;


    /**
     * @description: 获取minioClient
     * @date 2023/5/10 16:55
     * @return io.minio.MinioClient
     */
    public static MinioClient getMinioClient(){
        return minioClient;
    }

    /**
     * 判断 bucket是否存在
     *
     * @param bucketName:
     *            桶名
     * @return: boolean
     * @date : 2023/5/10 16:55
     */
    @SneakyThrows(Exception.class)
    public static boolean bucketExists(String bucketName) {
        return minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
    }


    /**
     * 获取全部bucket
     *
     * @param :
     * @return: java.util.List<io.minio.messages.Bucket>
     * @date : 2023/5/10 16:55
     */
    @SneakyThrows(Exception.class)
    public static List<Bucket> getAllBuckets() {
        return minioClient.listBuckets();
    }

    /**
     * 初始化minio配置
     *
     * @param :
     * @return: void
     * @date : 2023/5/10 16:55
     */
    @PostConstruct
    public void init() {
        try {
            minioClient = MinioClient.builder()
                    .endpoint(minIoProperty.getUrl())
                    .credentials(minIoProperty.getAccessKey(), minIoProperty.getSecretKey())
                    .build();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("初始化minio配置异常: 【{}】", e.fillInStackTrace());
        }
    }

}
