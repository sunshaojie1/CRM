package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.UseryMapper;
import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.Usery;

@Service
public class UseryServiceImpl implements UseryService {
	
	@Autowired
	private UseryMapper useryMapper;

	@Override
	public List<Usery> selectUsery(Usery usery) {
		// TODO Auto-generated method stub
		return useryMapper.selectUsery(usery);
	}
/**
 * 查询用户角色
 */
	@Override
	public List<Roles> selectRoles(String u_loginName) {
		// TODO Auto-generated method stub
		return useryMapper.selectRoles(u_loginName);
	}
/**
 * 查询用户角色模块
 */
	@Override
	public List<Modules> selectModules(String r_name) {
		// TODO Auto-generated method stub
		return useryMapper.selectModules(r_name);
	}
	/**
	 * 重置密码
	 */
@Override
public Integer updateCz(Usery usery) {
	// TODO Auto-generated method stub
	return useryMapper.updateCz(usery);
}

	
}
