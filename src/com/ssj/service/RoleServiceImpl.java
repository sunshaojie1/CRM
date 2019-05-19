package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.RolesMapper;
import com.ssj.entity.Roles;
import com.ssj.entity.Userroles;
@Service
public class RoleServiceImpl implements RolesService {
	@Autowired
	private RolesMapper rolesMapper;
	
	public List<Roles> selectRol(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.selectRoles(roles);
	}

	@Override
	public List<Roles> selectUser(String u_name) {
		// TODO Auto-generated method stub
		return rolesMapper.selectUsery(u_name);
	}

	@Override
	public Integer inserRoles(Userroles userroles) {
		// TODO Auto-generated method stub
		return rolesMapper.inserRoles(userroles);
	}

	@Override
	public Integer RolesCount(Userroles userroles) {
		// TODO Auto-generated method stub
		return rolesMapper.RolesCount(userroles);
	}

	@Override
	public Integer delRoles(Userroles userroles) {
		// TODO Auto-generated method stub
		return rolesMapper.delRoles(userroles);
	}

	@Override
	public Integer delro(Integer r_id) {
		// TODO Auto-generated method stub
		return rolesMapper.delro(r_id);
	}

	@Override
	public Integer insertro(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertro(roles);
	}

	@Override
	public Integer updro(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updro(roles);
	}

}
