package com.ssj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Roles;
import com.ssj.entity.Userroles;
import com.ssj.service.RolesService;

@Controller
public class RolesController {
	@Autowired
	private RolesService rolesService;
	
	/**
	   * ��ѯ���н�ɫ
	 * @return
	 */
	@RequestMapping(value="/selectRol",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRol(Roles roles){
		return rolesService.selectRol(roles);
	}
	/**
	 * ��ѯ�û��µĽ�ɫ
	 * @param u_name ��ѯ�������û���
	 * @return
	 */
	@RequestMapping(value="/userRoles",method=RequestMethod.POST)
	@ResponseBody
	public List<Roles> userRoles(String u_name){
		return rolesService.selectUser(u_name);
	}
	/**
	 * ���û���ӽ�ɫ
	 * @param u_id
	 * @param r_id
	 * @return
	 */
	@RequestMapping(value="/inserRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer inserRoles(Userroles userroles){
		//�ж�
			Integer a = rolesService.RolesCount(userroles);
			if(a!=0){
				return -1;
			}else{
				Integer b = rolesService.inserRoles(userroles);
				return b;
			}
	}
	/**
	 * ɾ���û��Ľ�ɫ
	 * @param userroles
	 * @return
	 */
	@RequestMapping(value="/delRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer delRoles(Userroles userroles){
		return rolesService.delRoles(userroles);
	}
	/**
	 * ɾ��
	 * @param r_id
	 * @return
	 */
	@RequestMapping(value="/delro",method=RequestMethod.POST)
	@ResponseBody
	public Integer delro(Integer r_id) {
		
		return rolesService.delro(r_id);
	}
	/**
	 * ���
	 * @param roles
	 * @return
	 */
	@RequestMapping(value="/insertro",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertro(Roles roles) {
		
		return rolesService.insertro(roles);
	}
	/**
	 * �޸�
	 * @param roles
	 * @return
	 */
	@RequestMapping(value="/updro",method=RequestMethod.POST)
	@ResponseBody
	public Integer updro(Roles roles) {
		
		return rolesService.updro(roles);
	}
	
}
