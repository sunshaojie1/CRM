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
	 * 查询每个角色对应的模块
	 * @return
	 */
	@RequestMapping(value="/rolesTree",method=RequestMethod.POST)
	@ResponseBody
	public List<RolesTree> rolesTree(){
		//查询所有角色
			List<Roles> selectRoles = modulesService.selectRoles();
		//查看数据
			//System.out.println("selectRoles"+selectRoles);
		//创建一个符合规则的角色list
			List<RolesTree> rolestree=new ArrayList<RolesTree>();
		//循环查询角色下的模块
			for(int i=0;i<selectRoles.size();i++){
				//创建一个符合规则的角色list
					List<ModulesTree> modulesTree=new ArrayList<ModulesTree>();
				//循环查询
					List<Modules> selectModules = modulesService.selectModulesTree(selectRoles.get(i).getR_name());
				//输出测试
					//System.out.println("selectModules"+selectModules);
					for(int j=0;j<selectModules.size();j++){
						modulesTree.add(new ModulesTree(selectModules.get(j).getM_id(),selectModules.get(j).getM_name()));
					}
				//存入rolestree
					rolestree.add(new RolesTree(selectRoles.get(i).getR_id(),selectRoles.get(i).getR_name(),modulesTree));
			}
		//输出
			//System.out.println(rolestree);
		return rolestree;
	}
	/**
	 * 查询所有模块
	 * @return
	 */
	@RequestMapping(value="/modulesSelect",method=RequestMethod.POST)
	@ResponseBody
	public List<Modules> modulesSelect(){
		
		return modulesService.modulesSelect();
	}
	/**
	 * 角色下的模块
	 * @param r_name
	 * @return
	 */
	@RequestMapping(value="/selMo",method=RequestMethod.POST)
	@ResponseBody
	public List<Modules> selMo(String r_name){
		return modulesService.selMo(r_name);
	}
	/**
	 * 给角色添加模块
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
	 * 移除角色的模块
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
	 * 添加
	 * @param modules
	 * @return
	 */
	@RequestMapping(value="/insertMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertMod(Modules modules) {
		
		return modulesService.insertMod(modules);
	}
	/**
	 * 删除
	 * @param m_id
	 * @return
	 */
	@RequestMapping(value="/deleteMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteMod(Integer m_id) {
		
		return modulesService.deleteMod(m_id);
	}
	/**
	 * 修改
	 * @param modules
	 * @return
	 */
	@RequestMapping(value="/updateMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateMod(Modules modules) {
		
		return modulesService.updateMod(modules);
	}
}
