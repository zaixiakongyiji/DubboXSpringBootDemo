package org.example.serviceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import org.example.service.InterFaceService;
import org.springframework.stereotype.Component;

@Service
@Component
public class InterFaceServiceImpl implements InterFaceService {
    @Override
    public String sayHelo(String message) {
        System.out.println("out:"+message);
        return message;
    }
}
