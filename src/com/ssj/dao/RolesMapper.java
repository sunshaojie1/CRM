package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Roles;
import com.ssj.entity.Userroles;

public interface RolesMapper {
	
	/**
	 * 查询所有用户角色
	 * @return
	 */
	List<Roles> selectRoles(Roles roles);
	/**
	 * 查询用户下的所有角色
	 * @param u_name
	 * @return
	 */
	List<Roles> selectUsery(String u_name);
	/**
	 * 给用户加角色
	 * @param userroles
	 * @return
	 */
	Integer inserRoles(Userroles userroles);
	/**
	 * 判断.
	 * @param userroles
	 * @return
	 */
	Integer RolesCount(Userroles userroles);
	/**
	 * 删除
	 * @param userroles
	 * @return
	 */
	Integer delRoles(Userroles userroles);
	/**
	 * 删除一个角色
	 * @param r_id
	 * @return
	 */
	Integer delro(Integer r_id);
	/**
	 * 添加
	 * @param roles
	 * @return
	 */
	Integer insertro(Roles roles);
	/**
	 * 修改
	 * @param roles
	 * @return
	 */
	Integer updro(Roles roles);
	
}
