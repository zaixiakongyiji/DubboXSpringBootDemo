package org.example;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Hello world!
 */
@SpringBootApplication
@EnableDubbo
public class CApp {
    private static Logger logger = LoggerFactory.getLogger(CApp.class);

    public static void main(String[] args) throws UnknownHostException {


        SpringApplication app = new SpringApplication(CApp.class);
        ConfigurableApplicationContext application = app.run(args);
        //ConfigurableApplicationContext application=SpringApplication.run(Knife4jSpringBootDemoApplication.class, args);
        Environment env = application.getEnvironment();
        logger.info("\n----------------------------------------------------------\n\t" +
                        "{} 启动成功!:\n\t" +
                        "本地地址: \thttp://localhost:{}\n\t" +
                        "外部地址: \thttp://{}:{}\n\t" +
                        "文档地址: \thttp://{}:{}/doc.html#/home\n" +
                        "----------------------------------------------------------",
                env.getProperty("spring.application.name"),
                env.getProperty("server.port"),
                InetAddress.getLocalHost().getHostAddress(),
                env.getProperty("server.port"),
                InetAddress.getLocalHost().getHostAddress(),
                env.getProperty("server.port"));
    }
}
