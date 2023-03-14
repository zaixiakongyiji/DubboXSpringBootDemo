package org.example;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@EnableDubbo
@MapperScan(basePackages = "org.example.dynamicRoute.mapper")
public class GateAwayApp
{
    public static void main( String[] args )
    {
        SpringApplication.run(GateAwayApp.class,args);
    }
}
