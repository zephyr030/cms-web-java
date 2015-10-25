package com.trunk.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 方法描述:用户管理业务逻辑处理
 *
 * @author 小刘
 * @version v1.0
 * @date 2015/10/24
 */
@Service
public class UserService extends BaseService{

    //用户列表
    public List<Map<String,Object>> userList(){
        String sql = "select * from t_sys_user";
        return jdbcTemplate.queryForList(sql);
    }

    //增加用户角色
    public void addRole(String name,String roleKey,int status,String description){
        String sql = "insert into t_sys_role (name,roleKey,status,description) values (?,?,?,?)";
        jdbcTemplate.update(sql,new Object[]{name,roleKey,status,description});
    }
}
