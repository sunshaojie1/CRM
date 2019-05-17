package com.ssj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;
import com.ssj.service.UseryService;
import com.ssj.service.UserysService;

@Controller
public class UserCONtroller {
	
	@Autowired
	private Fenye<Usery> fenye;
	 @Autowired
	private UseryService useryService;
	 @RequestMapping(value="/selectUseryes",method=RequestMethod.POST)
	 @ResponseBody
	 public List<Usery> selectUsery(Usery usery) {
		 
		return useryService.selectUsery(usery);
		
	}
	 
	 @RequestMapping(value="/updateXiugai",method=RequestMethod.POST)
	 @ResponseBody
	 public Integer updateXiugai(Usery usery){
		 System.out.println(useryService.updateXiugai(usery));
		return useryService.updateXiugai(usery);
	 
	 }
}
