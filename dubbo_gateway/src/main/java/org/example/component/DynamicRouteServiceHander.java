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
     *启动的时候运行这个方法
     * @param args incoming main method arguments
     * @throws Exception
     */
    @Override
    public void run(String... args) throws Exception {
        this.getRouteDefinitions();
    }

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
            /**
             * 通知GatewayAutoConfiguration里面的routeRefreshListener自己去刷新路由
             * 原来 new RefreshRoutesEvent(new RefreshRoutesEvent( xx)) 里面装的是 this 不知道为啥报空指针
             * 但是这个里面的object好像不是很重要 我就搞了这么个在里面
             */
            publisher.publishEvent(new RefreshRoutesEvent("刷新路由"));
        });
        return "success";
    }

}
