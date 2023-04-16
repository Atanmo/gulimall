package com.atanmo.gulimall.getway.conf;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

@Configuration
public class GulimallCorsConfiguration {


    @Bean
    public CorsWebFilter corsWebFilter(){

        UrlBasedCorsConfigurationSource configurationSource = new UrlBasedCorsConfigurationSource();

        //配置跨域
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedHeader("*");
        corsConfiguration.addAllowedMethod("*");
        corsConfiguration.addAllowedOriginPattern("*");
        corsConfiguration.setAllowCredentials(true);

        configurationSource.registerCorsConfiguration("/**",corsConfiguration);



        return new CorsWebFilter(configurationSource);
    }


}
