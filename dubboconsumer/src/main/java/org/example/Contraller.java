package org.example;


import io.swagger.annotations.ApiOperation;
import org.apache.dubbo.config.annotation.DubboReference;
import org.example.service.InterFaceService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class Contraller {
    @DubboReference
    private InterFaceService interFaceService;

    @GetMapping("/")
    @ApiOperation("远程方法")
    public String run(String message){
        String result = interFaceService.sayHelo(message);
        System.out.println("Receive result ======> " + result);
        return  result;
    }


}
