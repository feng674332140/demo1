package com.yzt.zhmp.utils;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

/**
 * 自定义配置拦截器配置
 *
 * @author wang
 */
@Configuration
public class MyWebMvcConfigurerAdapter implements WebMvcConfigurer {

    /**
     * 配置静态资源
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/control/**").addResourceLocations("classpath:/control/");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");

    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(new LoginInterceptor());
        interceptorRegistration.addPathPatterns("/control/*");
        interceptorRegistration.excludePathPatterns("/control/index");
        interceptorRegistration.excludePathPatterns("/system");

        interceptorRegistration.excludePathPatterns("/control/login");
    }

    /**
     * 配置全局跨域访问
     * @param registry
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**");
    }
}
