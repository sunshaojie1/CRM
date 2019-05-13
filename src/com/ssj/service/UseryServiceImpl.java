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
 * ��ѯ�û���ɫ
 */
	@Override
	public List<Roles> selectRoles(String u_loginName) {
		// TODO Auto-generated method stub
		return useryMapper.selectRoles(u_loginName);
	}
/**
 * ��ѯ�û���ɫģ��
 */
	@Override
	public List<Modules> selectModules(String r_name) {
		// TODO Auto-generated method stub
		return useryMapper.selectModules(r_name);
	}
	/**
	 * ��������
	 */
@Override
public Integer updateCz(Usery usery) {
	// TODO Auto-generated method stub
	return useryMapper.updateCz(usery);
}

	
}
