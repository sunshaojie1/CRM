package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;

public interface RolesService {
 
		//分页查询模糊查询
	Fenye<Roles> selectRoles(Fenye<Roles> fenye);

		//修改
		Integer updateRoles(Roles roles);
		//添加
		Integer addRoles(Roles roles);
		//删除
		Integer delRoles(Integer r_id);
}
