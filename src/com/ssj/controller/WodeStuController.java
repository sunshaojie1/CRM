package com.ssj.controller;

import java.util.List;

import javafx.scene.control.Cell;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.dao.WodeStuMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.service.WodeStuService;

@Controller
public class WodeStuController {
	@Autowired
	private Fenye<Student> fenye;
	@Autowired
	private WodeStuService wodeStuService;
	@RequestMapping(value="/selectStu",method=RequestMethod.POST)
	@ResponseBody
public Fenye<Student> selectStu(Integer page,Integer rows,String stu_name,String stu_phone,Integer stu_money,
		Integer stu_youXiao,Integer stu_huiFang,String stu_qq,String startstu_creatorTime,String eddstu_creatorTime){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setStu_name(stu_name);
	fenye.setStu_phone(stu_phone);
	fenye.setStu_money(stu_money);
	fenye.setStu_youXiao(stu_youXiao);
	System.out.println(stu_youXiao);
	fenye.setStu_huiFang(stu_huiFang);
	fenye.setStu_qq(stu_qq);
	fenye.setStartstu_creatorTime(startstu_creatorTime);
	fenye.setEddstu_creatorTime(eddstu_creatorTime);
	System.out.println(eddstu_creatorTime);
	fenye = wodeStuService.selectStu(fenye);
	return fenye;
	
}
	//ÐÞ¸Ä
	@RequestMapping(value="/updateStu",method=RequestMethod.POST)
	@ResponseBody
	public  Integer updateStu(Student student){
		Integer i = wodeStuService.updateStu(student);
		return i;
		
	}
	//É¾³ý
	@RequestMapping(value="/delStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Integer stu_id){
		return wodeStuService.delStu(stu_id);
		
	}

	//Ìí¼Ó
	@RequestMapping(value="/addStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Student student){
		
		return wodeStuService.addStu(student);
		
	}
	


 
}
