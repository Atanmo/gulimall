package com.atanmo.gulimall.getway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class GulimallGetwayApplication {

	public static void main(String[] args) {
		SpringApplication.run(GulimallGetwayApplication.class, args);
	}

}
