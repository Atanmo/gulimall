package com.atanmo.gulimall.thirdparty;

import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.MinioException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@SpringBootTest
class GulimallThirdPartyApplicationTests {

	@Test
	void contextLoads() {
	}

	@Test
	void ossTest() throws IOException, NoSuchAlgorithmException, InvalidKeyException {
		try {
			// 创建一个包含 MinIO 服务器操场、其访问密钥和密钥的 minioClient。
			MinioClient minioClient =
					MinioClient.builder()
							.endpoint("http://server.atidea.cn:9000")
							.credentials("minio", "at123123")
							.build();

			// 如果不存在，创建桶。
			boolean found =
					minioClient.bucketExists(BucketExistsArgs.builder().bucket("gulimall").build());
			if (!found) {
				// 创建一个gulimall的桶
				minioClient.makeBucket(MakeBucketArgs.builder().bucket("gulimall").build());
			} else {
				System.out.println("Bucket 'gulimall' 已经存在.");
			}

			//上传文件到gulimall 桶
			minioClient.uploadObject(
					UploadObjectArgs.builder()
							.bucket("gulimall")
							.object("head.png")
							.filename("/Users/wuwei/Documents/head.png")
							.build());
			System.out.println(
					"'/Users/wuwei/Documents/head.png' is successfully uploaded as "
							+ "object 'gulimall-head.png' to bucket 'gulimall'.");
		} catch (MinioException e) {
			System.out.println("Error occurred: " + e);
			System.out.println("HTTP trace: " + e.httpTrace());
		}
	}

}

