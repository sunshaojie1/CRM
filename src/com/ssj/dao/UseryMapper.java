package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.Usery;

public interface UseryMapper {
	
	/**
	 * 用户登录——账号是否存在
	 * @param usery
	 * @return
	 */
	List<Usery> selectUsery(Usery usery);
	
	/**
	 * 查询用户的角色
	 * @param u_loginName
	 * @return
	 */
	List<Roles> selectRoles(String u_loginName);
	/**
	 * 查询用户角色模块
	 * @param rid
	 * @return
	 */
	List<Modules> selectModules(String r_name);
	
	/**
	 * 重置密码
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	Integer updateCz(Usery usery);
	
	
	
	
	
}
