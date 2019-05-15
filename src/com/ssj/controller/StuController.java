package com.ssj.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.service.StuService;

@Controller
public class StuController {
	@Autowired
	private Fenye<Student> fenye;
	@Autowired
	private StuService stuService;
	
	@RequestMapping(value="/selectStu1",method=RequestMethod.POST)
	@ResponseBody
public Fenye<Student> selectStu(Integer page,Integer rows,String stu_name,String stu_phone,Integer stu_money,
		Integer stu_youXiao,Integer stu_huiFang,String stu_qq,String stu_creatorTime){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setStu_name(stu_name);
	fenye.setStu_phone(stu_phone);
	fenye.setStu_money(stu_money);
	fenye.setStu_youXiao(stu_youXiao);
	fenye.setStu_huiFang(stu_huiFang);
	fenye.setStu_qq(stu_qq);
	fenye.setStu_creatorTime(stu_creatorTime);
	
	fenye = stuService.selectStu(fenye);
	return fenye;
	
}
	//ÐÞ¸Ä
	@RequestMapping(value="/updateStu1",method=RequestMethod.POST)
	@ResponseBody
	public  Integer updateStu(Student student){
		System.out.println(student);
		return stuService.updateStu(student);
		
	}
	//É¾³ý
	@RequestMapping(value="/delStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Integer stu_id){
		return stuService.delStu(stu_id);
		
	}
	//Ìí¼Ó
	@RequestMapping(value="/addStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer addStu(Student student){
		
		return stuService.addStu(student);
		
	}
	

}
