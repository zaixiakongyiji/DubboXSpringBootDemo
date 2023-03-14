package org.example.dynamicRoute.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@ApiModel(description="filter_type")
@Data
@TableName(value = "filter_type")
public class FilterType {
    @TableId(value = "id", type = IdType.AUTO)
    @ApiModelProperty(value="")
    private Integer id;

    @TableField(value = "`name`")
    @ApiModelProperty(value="")
    private String name;

    @TableField(value = "name_key_one")
    @ApiModelProperty(value="")
    private String nameKeyOne;

    @TableField(value = "name_key_two")
    @ApiModelProperty(value="")
    private String nameKeyTwo;

    public static final String COL_ID = "id";

    public static final String COL_NAME = "name";

    public static final String COL_NAME_KEY_ONE = "name_key_one";

    public static final String COL_NAME_KEY_TWO = "name_key_two";
}