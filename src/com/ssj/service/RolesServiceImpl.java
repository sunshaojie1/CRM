package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.RolesMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;
@Service
public class RolesServiceImpl implements RolesService{
	@Autowired
	private RolesMapper rolesMapper;
	 
	@Override
	public Fenye<Roles> selectRoles(Fenye<Roles> fenye) {
		List<Roles> selectRoles = rolesMapper.selectRoles(fenye);
		Integer count = rolesMapper.selectRolesCount(fenye);
		fenye.setTotal(count);
		fenye.setRows(selectRoles);
		return fenye;
	}

	@Override
	public Integer updateRoles(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}

	@Override
	public Integer addRoles(Roles roles) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delRoles(Integer r_id) {
		// TODO Auto-generated method stub
		return null;
	}

	

 

	

}
