package com.atanmo.gulimall.thirdparty.utils.oss;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.atanmo.gulimall.common.utils.R;
import com.atanmo.gulimall.thirdparty.config.oss.MinIoProperty;
import com.atanmo.gulimall.thirdparty.config.oss.MinioClientConfig;
import io.minio.*;

import io.minio.http.Method;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Slf4j
@Component
public class MinioUtil {

    @Resource
    private MinIoProperty minIoProperty;

    /**
     * Minio文件上传
     *
     * @param file       文件实体
     * @param fileName   修饰过的文件名 非源文件名
     * @param bucketName 所存文件夹（桶名）
     * @return
     */
    public R minioUpload(MultipartFile file, String fileName, String bucketName) {
        try {
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            // fileName为空，说明要使用源文件名上传
            if (fileName == null) {
                fileName = file.getOriginalFilename();
                fileName = fileName.replaceAll(" ", "_");
            }
            InputStream inputStream = file.getInputStream();
            PutObjectArgs objectArgs = PutObjectArgs.builder().bucket(bucketName).object(fileName)
                    .stream(inputStream, file.getSize(), -1).contentType(file.getContentType()).build();
            //文件名称相同会覆盖
            minioClient.putObject(objectArgs);
            return R.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 检查存储桶是否存在
     *
     * @param bucketName 存储桶名称
     * @return
     */
    public boolean bucketExists(String bucketName) {
        boolean flag = false;
        try {
            flag = MinioClientConfig.bucketExists(bucketName);
            if (flag) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    /**
     * 获取文件流
     *
     * @param fileName   文件名
     * @param bucketName 桶名（文件夹）
     * @return
     */
    public InputStream getFileInputStream(String fileName, String bucketName) {
        try {
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            return minioClient.getObject(GetObjectArgs.builder().bucket(bucketName).object(fileName).build());
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
        return null;
    }


    /**
     * @param bucketName:
     * @author
     * @description: 创建桶
     * @date 2022/8/16 14:36
     */
    public void createBucketName(String bucketName) {
        try {
            if (StringUtils.isBlank(bucketName)) {
                return;
            }
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            boolean isExist = MinioClientConfig.bucketExists(bucketName);
            if (isExist) {
                log.info("Bucket {} already exists.", bucketName);
            } else {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
    }
    /**
     * 下载文件
     *
     * @param originalName 文件路径
     */
    public InputStream downloadFile(String bucketName, String originalName, HttpServletResponse response) {
        try {
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            InputStream file = minioClient.getObject(GetObjectArgs.builder().bucket(bucketName).object(originalName).build());
            String filename = new String(originalName.getBytes("ISO8859-1"), StandardCharsets.UTF_8);
            if (StringUtils.isNotBlank(originalName)) {
                filename = originalName;
            }
            response.setHeader("Content-Disposition", "attachment;filename=" + filename);
            ServletOutputStream servletOutputStream = response.getOutputStream();
            int len;
            byte[] buffer = new byte[1024];
            while ((len = file.read(buffer)) > 0) {
                servletOutputStream.write(buffer, 0, len);
            }
            servletOutputStream.flush();
            file.close();
            servletOutputStream.close();
            return file;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param bucketName:
     * @description: 删除桶
     * @date 2022/8/16 14:36
     */
    public void deleteBucketName(String bucketName) {
        try {
            if (StringUtils.isBlank(bucketName)) {
                return;
            }
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            boolean isExist = MinioClientConfig.bucketExists(bucketName);
            if (isExist) {
                minioClient.removeBucket(RemoveBucketArgs.builder().bucket(bucketName).build());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
    }
    /**
     * @param bucketName:
     * @description: 删除桶下面所有文件
     * @date 2022/8/16 14:36
     */
    public void deleteBucketFile(String bucketName) {
        try {
            if (StringUtils.isBlank(bucketName)) {
                return;
            }
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            boolean isExist = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (isExist) {
                minioClient.deleteBucketEncryption(DeleteBucketEncryptionArgs.builder().bucket(bucketName).build());
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }
    }

    /**
     * 根据文件路径得到预览文件绝对地址
     *
     * @param bucketName
     * @param fileName
     * @return
     */
    public String getPreviewFileUrl(String bucketName, String fileName,Method method) {
        try {
            MinioClient minioClient = MinioClientConfig.getMinioClient();
            return minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder().bucket(bucketName).object(fileName).method(method).build());
        } catch (Exception e) {
            e.printStackTrace();
            return "文件网络地址获取失败";
        }
    }


    /**
     * 根据原始文件名生成随机化文件名，并散列到日期目录中
     * @param dir 上传到bucket哪个目录，开头不要加/
     * @param originFileName 原始文件名
     * @return 最终生成的文件在bucket中的路径
     */
    private String generateFilePath(String dir, String originFileName) {
        // 随机化文件名
        String uuid = UUID.randomUUID().toString();
        String fileName = StrUtil.addPrefixIfNot(originFileName, uuid);
        String rootPath;
        if (StrUtil.isEmpty(dir)) {
            rootPath = "";
        }else {
            rootPath = dir.endsWith("/") ? dir : dir + "/";
        }
        // 将文件散列到日期目录
        return rootPath + DateUtil.format(new Date(), "yyyy-MM-dd") + "/" + fileName;
    }

    public Map<String, String> getPolicyFromDataToMap(String fileName) throws Exception {
        MinioClient minioClient = MinioClientConfig.getMinioClient();
        String filePath = this.generateFilePath("", fileName);
        // 给指定bucket创建一个上传策略，超时时间为3分钟
        PostPolicy policy = new PostPolicy(minIoProperty.getBucketName(), ZonedDateTime.now().plusSeconds(600));
        // 设置一个参数key，值为上传对象的名称
        policy.addEqualsCondition("key", filePath);
        // 添加Content-Type以"image/"开头，表示只能上传照片
        // policy.addStartsWithCondition("Content-Type", "image/");
        // 设置上传文件的大小 64kiB to 10MiB.
        // policy.addContentLengthRangeCondition(64 * 1024, 10 * 1024 * 1024);
        Map<String, String> map = minioClient.getPresignedPostFormData(policy);
        // 将文件在bucket中的最终路径回传给前端
        map.put("key", filePath);
        return map;
    }

}
