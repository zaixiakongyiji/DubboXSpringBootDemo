package org.example.dynamicRoute.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dynamicRoute.entity.GatewayFilter;
import org.example.dynamicRoute.mapper.GatewayFilterMapper;
import org.example.dynamicRoute.service.GatewayFilterService;
import org.springframework.stereotype.Service;

@Service
public class GatewayFilterServiceImpl extends ServiceImpl<GatewayFilterMapper, GatewayFilter> implements GatewayFilterService {

}
