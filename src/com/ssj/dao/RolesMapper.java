package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;

public interface RolesMapper {
	//分页查询总条数
	Integer selectRolesCount(Fenye<Roles> fenye);
	//分页查询模糊查询
	List<Roles> selectRoles(Fenye<Roles> fenye);
	//修改
	Integer updateRoles(Roles roles);
	//添加
	Integer addRoles(Roles roles);
	//删除
	Integer delRoles(Integer r_id);
}
