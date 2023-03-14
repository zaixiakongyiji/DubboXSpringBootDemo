package org.example.dynamicRoute.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.dynamicRoute.entity.GatewayRoute;

@Mapper
public interface GatewayRouteMapper extends BaseMapper<GatewayRoute> {
}