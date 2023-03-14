package org.example;


import io.swagger.annotations.ApiOperation;
import org.apache.dubbo.config.annotation.DubboReference;
import org.example.service.InterFaceService;
import org.example.service.RouteService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class Contraller {
    @DubboReference
    private InterFaceService interFaceService;

    @DubboReference
    private RouteService routeService;

    @GetMapping("/")
    @ApiOperation("远程方法")
    public String run(String message){
        String result = interFaceService.sayHelo(message);
        System.out.println("Receive result ======> " + result);
        return  result;
    }


    @GetMapping("/route")
    @ApiOperation("动态路由")
    public String route(){
        String a=routeService.getRouteDefinitions();
        System.out.println(a);
        return  a;
    }


}
