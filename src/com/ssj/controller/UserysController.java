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
	 
	 
	 @RequestMapping(value="/selUsery",method=RequestMethod.POST)
	 @ResponseBody
	 public Fenye<Usery> selUsery(Integer page,Integer rows,String u_loginName){
		 fenye.setPage((page-1)*rows);
		 fenye.setPageSize(rows);
		 fenye.setU_loginName(u_loginName);
		
		 
		 fenye=userysService.selUsery(fenye);
		 
		 return fenye;
		 
	 }

}
