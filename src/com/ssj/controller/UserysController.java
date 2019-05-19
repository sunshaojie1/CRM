package com.ssj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;
import com.ssj.service.UserysService;

@Controller
public class UserysController {
	
	@Autowired
	private Fenye<Usery> fenye;
	 @Autowired
	private UserysService userysService;
	 
	 	/**
		 * 显示员工所有数据
		 * @param fenye
		 * @return
		 */
	 @RequestMapping(value="/selUsery",method=RequestMethod.POST)
	 @ResponseBody
	 public Fenye<Usery> selUsery(Integer page,Integer rows,String u_loginName,String u_isLockout,String u_isQianDao
			 						,String startTime,String endTime){
		 fenye.setPage((page-1)*rows);
		 fenye.setPageSize(rows);
		 fenye.setU_loginName(u_loginName);
		 fenye.setU_isLockout(u_isLockout);
		 fenye.setU_isQianDao(u_isQianDao);
		 
		 fenye.setStartTime(startTime);
		 fenye.setEndTime(endTime);
		 
		 fenye=userysService.selUsery(fenye);
		 
		 return fenye;
		 
	 }
	
	 	/**
		 * 修改员工信息
		 * @param usery
		 * @return
		 */
		@RequestMapping(value="/updateUsery",method=RequestMethod.POST)
		@ResponseBody
		public Integer updateUsery(Usery usery){
		
			
			return userysService.updateUsery(usery);
		}
		
		
		/**
		 * 添加员工
		 * @param usery
		 * @return
		 */
		@RequestMapping(value="/addUsery",method=RequestMethod.POST)
		@ResponseBody
		public Integer addUsery(Usery usery){
			
			
			return userysService.addUsery(usery);
		}
		
		
		/**
		 * 根据ID删除员工
		 * @param u_id
		 * @return
		 */
		@RequestMapping(value="/delUsery",method=RequestMethod.POST)
		@ResponseBody
		public Integer delUsery( Integer u_id){
		
			return userysService.delUsery(u_id);
		}
		

}
