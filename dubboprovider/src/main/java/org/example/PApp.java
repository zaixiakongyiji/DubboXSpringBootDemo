package org.example;


import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@EnableDubbo
public class PApp
{
    public static void main( String[] args )
    {
        SpringApplication.run(PApp.class,args);

    }
}
