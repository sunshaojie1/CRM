package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.MokuaiMapper;
import com.ssj.entity.Modules;
import com.ssj.entity.Rolemodules;
import com.ssj.entity.Roles;
@Service
public class ModulesServiceImpl implements ModulesService {
	@Autowired
	private MokuaiMapper mokuaiMapper;
	@Override
//查询所有角色
	public List<Roles> selectRoles() {
		// TODO Auto-generated method stub
		return mokuaiMapper.selectRoles();
	}
//根据角色查询模块
	@Override
	public List<Modules> selectModulesTree(String r_name) {
		// TODO Auto-generated method stub
		return mokuaiMapper.selectModulesTree(r_name);
	}
//查询所有模块
	@Override
	public List<Modules> modulesSelect() {
		// TODO Auto-generated method stub
		return mokuaiMapper.modulesSelect();
	}
	@Override
	public List<Modules> selMo(String r_name) {
		// TODO Auto-generated method stub
		return mokuaiMapper.selMo(r_name);
	}
	@Override
	public Integer insertMo(Rolemodules rolemodules) {
		// TODO Auto-generated method stub
		return mokuaiMapper.insertMo(rolemodules);
	}
	@Override
	public Integer deleteMo(Rolemodules rolemodules) {
		// TODO Auto-generated method stub
		return mokuaiMapper.deleteMo(rolemodules);
	}
	@Override
	public Integer MoCount(Rolemodules rolemodules) {
		// TODO Auto-generated method stub
		return mokuaiMapper.MoCount(rolemodules);
	}
	@Override
	public Integer insertMod(Modules modules) {
		// TODO Auto-generated method stub
		return mokuaiMapper.insertMod(modules);
	}
	@Override
	public Integer deleteMod(Integer m_id) {
		// TODO Auto-generated method stub
		return mokuaiMapper.deleteMod(m_id);
	}
	@Override
	public Integer updateMod(Modules modules) {
		// TODO Auto-generated method stub
		return mokuaiMapper.updateMod(modules);
	}

}
