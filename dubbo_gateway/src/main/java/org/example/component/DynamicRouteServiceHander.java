package org.example.component;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.apache.dubbo.config.annotation.DubboService;
import org.example.dynamicRoute.entity.GatewayFilter;
import org.example.dynamicRoute.entity.GatewayPredicate;
import org.example.dynamicRoute.entity.GatewayRoute;
import org.example.dynamicRoute.service.GatewayFilterService;
import org.example.dynamicRoute.service.GatewayPredicateService;
import org.example.dynamicRoute.service.GatewayRouteService;
import org.example.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.cloud.gateway.event.RefreshRoutesEvent;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.util.*;

@Component
//@Service
@DubboService
public class DynamicRouteServiceHander implements RouteService,ApplicationEventPublisherAware, CommandLineRunner {

    @Autowired
    GatewayFilterService filterService;
    @Autowired
    GatewayRouteService routeService;
    @Autowired
    GatewayPredicateService predicateService;
    ApplicationEventPublisher publisher;

    @Override
    public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
        this.publisher = applicationEventPublisher;
    }


    @Autowired
    RedisRouteDefinitionRepository routeDefinitionWriter;


    /**
     * 后期可以采用数据库存储方式或者其他可以变更的存储方式
     **/
    @Override
    public String getRouteDefinitions() {
        List<GatewayRoute> routes = routeService.list();
        routes.forEach(route -> {
            RouteDefinition definition = new RouteDefinition();
            definition.setId(route.getName());
            definition.setUri(URI.create(route.getUri()));
            List<GatewayPredicate> predicates = predicateService.list(Wrappers.<GatewayPredicate>lambdaQuery()
                    .eq(GatewayPredicate::getRid, route.getId()));
            if (StringUtils.checkValNotNull(predicates)) {
                Map<String, String> predicateParams = new HashMap<>(4);
                List<PredicateDefinition> predicateList = new ArrayList<>();
                predicates.forEach(p -> {
                    PredicateDefinition predicate = new PredicateDefinition();
                    predicate.setName(p.getName());
                    predicateParams.put(p.getParamsType(), p.getParamsOne() + (p.getParamsTwo() == null ? "" : ("," + p.getParamsTwo())));
                    predicate.setArgs(predicateParams);
                    predicateList.add(predicate);
                });
                definition.setPredicates(predicateList);
            }
            List<GatewayFilter> filters = filterService.list(Wrappers.<GatewayFilter>lambdaQuery().eq(
                    GatewayFilter::getRid, route.getId()));
            if (StringUtils.checkValNotNull(filters)) {
                Map<String, String> filterParams = new HashMap<>(8);
                List<FilterDefinition> filterList = new ArrayList<>();
                filters.forEach(f -> {
                    //定义Filter
                    FilterDefinition filter = new FilterDefinition();
                    filter.setName(f.getName());
                    filterParams.put(f.getParamType(), f.getParamOne() + (f.getParamTwo() == null ? "" : ("," + f.getParamTwo())));
                    filter.setArgs(filterParams);
                    filterList.add(filter);
                });
                definition.setFilters(filterList);
            }
            routeDefinitionWriter.save(Mono.just(definition)).subscribe();
            publisher.publishEvent(new RefreshRoutesEvent("刷新路由"));
        });
        return "success";
    }


    @Override
    public void run(String... args) throws Exception {
        this.getRouteDefinitions();
    }
}
