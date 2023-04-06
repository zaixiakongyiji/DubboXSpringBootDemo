package org.example.dynamicRoute.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dynamicRoute.entity.PredicateType;
import org.example.dynamicRoute.mapper.PredicateTypeMapper;
import org.example.dynamicRoute.service.PredicateTypeService;
import org.springframework.stereotype.Service;

@Service
public class PredicateTypeServiceImpl extends ServiceImpl<PredicateTypeMapper, PredicateType> implements PredicateTypeService {
}
