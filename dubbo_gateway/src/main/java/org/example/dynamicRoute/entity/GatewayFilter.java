package org.example.dynamicRoute.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(description = "gateway_filter")
@Data
@TableName(value = "gateway_filter")
public class GatewayFilter {
    public static final String COL_PARAM_TYPE = "param_type";
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value = "")
    private Integer id;

    /**
     * 路由id
     */
    @TableField(value = "rId")
    @ApiModelProperty(value = "路由id")
    private Integer rid;

    /**
     * 过滤器名字
     */
    @TableField(value = "`name`")
    @ApiModelProperty(value = "过滤器名字")
    private String name;

    /**
     * 参数1
     */
    @TableField(value = "param_one")
    @ApiModelProperty(value = "参数1")
    private String paramOne;

    /**
     * 参数2
     */
    @TableField(value = "param_two")
    @ApiModelProperty(value = "参数2")
    private String paramTwo;

    public static final String COL_ID = "id";

    public static final String COL_RID = "rId";

    public static final String COL_NAME = "name";

    public static final String COL_PARAM_ONE = "param_one";

    public static final String COL_PARAM_TWO = "param_two";
}