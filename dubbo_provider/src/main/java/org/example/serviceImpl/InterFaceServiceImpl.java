package org.example.serviceImpl;

import org.apache.dubbo.config.annotation.DubboService;
import org.example.service.InterFaceService;
import org.springframework.stereotype.Component;

@DubboService
@Component
public class InterFaceServiceImpl implements InterFaceService {
    @Override
    public String sayHelo(String message) {
        System.out.println("out:" + message);
        return message;
    }
}
