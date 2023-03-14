package org.example.dynamicRoute.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.dynamicRoute.entity.FilterType;
import org.example.dynamicRoute.mapper.FilterTypeMapper;
import org.example.dynamicRoute.service.FilterTypeService;
@Service
public class FilterTypeServiceImpl extends ServiceImpl<FilterTypeMapper, FilterType> implements FilterTypeService{

}
