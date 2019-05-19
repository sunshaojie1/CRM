package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Rolemodules;
import com.ssj.entity.Roles;
import com.ssj.entity.RolesTree;

public interface MokuaiMapper {
	/**
	 * 查询所有角色
	 * @return
	 */
	List<Roles> selectRoles();
	/**
	 * 查询角色下的模块
	 * @param r_name
	 * @return
	 */
	List<Modules> selectModulesTree(String r_name);
	/**
	 * 查询所有模块
	 * @return
	 */
	List<Modules> modulesSelect();
	/**
	 * 新增加一个模块
	 * @param modules
	 * @return
	 */
	Integer insertMod(Modules modules);
	/**
	 * 删除一个模块
	 * @param m_id
	 * @return
	 */
	Integer deleteMod(Integer m_id);
	/**
	 * 修改
	 * @param modules
	 * @return
	 */
	Integer updateMod(Modules modules);
	/**
	 * 角色下的模块
	 * @param r_name
	 * @return
	 */
	List<Modules> selMo(String r_name);
	
	/**
	 * 给角色添加模块
	 * @param rolemodules
	 * @return
	 */
	Integer insertMo(Rolemodules rolemodules);
	/**
	 * 删除角色下的模块
	 * @param rolemodules
	 * @return
	 */
	Integer deleteMo(Rolemodules rolemodules);
	/**
	 * 判断是否有重复
	 * @param rolemodules
	 * @return
	 */
	Integer MoCount(Rolemodules rolemodules);
}
