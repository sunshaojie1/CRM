package com.ssj.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;
import com.ssj.entity.Student;
import com.ssj.service.RolesService;
import com.ssj.service.WodeStuService;
@Controller
public class RolesController {
	@Autowired
	private Fenye<Roles> fenye;
	@Autowired
	private RolesService rolesService;
	@RequestMapping(value="/selectRoleser",method=RequestMethod.POST)
	@ResponseBody
		 public Fenye<Roles> selectRoles(Integer page,Integer rows,String r_name){
		 fenye.setPage((page-1)*rows);
		 fenye.setPageSize(rows);
		 fenye.setStu_name(r_name);
		 fenye = rolesService.selectRoles(fenye);
		return fenye;
		
	}
	@RequestMapping(value="/updateRoleser",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRoles(Roles roles){
		Integer i = rolesService.updateRoles(roles);
		System.out.println(i);
		return i;
		
	}
}
