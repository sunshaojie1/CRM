package com.ssj.service;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.Usery;

public interface UseryService {
	/**
	 * 查询用户
	 * @param usery
	 * @return
	 */
	List<Usery> selectUsery(Usery usery);
/**
 * 查询用户角色
 * @param u_loginName
 * @return
 */
	List<Roles> selectRoles(String u_loginName);
	/**
	 * 查询用户角色模块
	 * @param r_name
	 * @return
	 */
	List<Modules> selectModules(String r_name);
	/**
	 * 重置密码
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	public Integer updateCz(Usery usery);
	/**
	 * 修改密码
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	Integer updateXiugai(Usery usery);
}
