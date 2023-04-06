package org.example.dynamicRoute.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dynamicRoute.entity.FilterType;
import org.example.dynamicRoute.mapper.FilterTypeMapper;
import org.example.dynamicRoute.service.FilterTypeService;
import org.springframework.stereotype.Service;

@Service
public class FilterTypeServiceImpl extends ServiceImpl<FilterTypeMapper, FilterType> implements FilterTypeService {

}
