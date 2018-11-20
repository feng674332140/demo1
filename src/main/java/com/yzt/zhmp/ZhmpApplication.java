package com.yzt.zhmp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author wangyinglong
 */
@SpringBootApplication
@EnableCaching
@EnableScheduling
public class ZhmpApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ZhmpApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ZhmpApplication.class, args);
    }

}
