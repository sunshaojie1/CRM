package com.ssj.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Rolemodules;
import com.ssj.entity.Roles;
import com.ssj.entity.RolesTree;
import com.ssj.service.ModulesService;

@Controller
public class MokuaiConller {
	
	@Autowired
	private ModulesService modulesService;
	
	/**
	 * ��ѯÿ����ɫ��Ӧ��ģ��
	 * @return
	 */
	@RequestMapping(value="/rolesTree",method=RequestMethod.POST)
	@ResponseBody
	public List<RolesTree> rolesTree(){
		//��ѯ���н�ɫ
			List<Roles> selectRoles = modulesService.selectRoles();
		//�鿴����
			//System.out.println("selectRoles"+selectRoles);
		//����һ�����Ϲ���Ľ�ɫlist
			List<RolesTree> rolestree=new ArrayList<RolesTree>();
		//ѭ����ѯ��ɫ�µ�ģ��
			for(int i=0;i<selectRoles.size();i++){
				//����һ�����Ϲ���Ľ�ɫlist
					List<ModulesTree> modulesTree=new ArrayList<ModulesTree>();
				//ѭ����ѯ
					List<Modules> selectModules = modulesService.selectModulesTree(selectRoles.get(i).getR_name());
				//�������
					//System.out.println("selectModules"+selectModules);
					for(int j=0;j<selectModules.size();j++){
						modulesTree.add(new ModulesTree(selectModules.get(j).getM_id(),selectModules.get(j).getM_name()));
					}
				//����rolestree
					rolestree.add(new RolesTree(selectRoles.get(i).getR_id(),selectRoles.get(i).getR_name(),modulesTree));
			}
		//���
			//System.out.println(rolestree);
		return rolestree;
	}
	/**
	 * ��ѯ����ģ��
	 * @return
	 */
	@RequestMapping(value="/modulesSelect",method=RequestMethod.POST)
	@ResponseBody
	public List<Modules> modulesSelect(){
		
		return modulesService.modulesSelect();
	}
	/**
	 * ��ɫ�µ�ģ��
	 * @param r_name
	 * @return
	 */
	@RequestMapping(value="/selMo",method=RequestMethod.POST)
	@ResponseBody
	public List<Modules> selMo(String r_name){
		return modulesService.selMo(r_name);
	}
	/**
	 * ����ɫ���ģ��
	 * @param rolemodules
	 * @return
	 */
	@RequestMapping(value="/insertMo",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertMo(Rolemodules rolemodules){
		Integer count = modulesService.MoCount(rolemodules);
		if(count!=0) {
			return -1;
		}else {
			return modulesService.insertMo(rolemodules);
		}
	}
	/**
	 * �Ƴ���ɫ��ģ��
	 * @param rolemodules
	 * @return
	 */
	@RequestMapping(value="/delMMM",method=RequestMethod.POST)
	@ResponseBody
	public Integer delMMM(Rolemodules rolemodules){
		if(modulesService.deleteMo(rolemodules)>0) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	
	
	
	/**
	 * ���
	 * @param modules
	 * @return
	 */
	@RequestMapping(value="/insertMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertMod(Modules modules) {
		
		return modulesService.insertMod(modules);
	}
	/**
	 * ɾ��
	 * @param m_id
	 * @return
	 */
	@RequestMapping(value="/deleteMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteMod(Integer m_id) {
		
		return modulesService.deleteMod(m_id);
	}
	/**
	 * �޸�
	 * @param modules
	 * @return
	 */
	@RequestMapping(value="/updateMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateMod(Modules modules) {
		
		return modulesService.updateMod(modules);
	}
}
