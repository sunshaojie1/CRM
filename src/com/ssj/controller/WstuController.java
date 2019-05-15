package com.ssj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.service.WstuService;
@Controller
public class WstuController {
@Autowired	
private Fenye<Student> fenye;
@Autowired
private WstuService wstuService;
@RequestMapping(value = "/showStu", method = RequestMethod.POST)
@ResponseBody
public Fenye<Student> showWstu(Integer page,Integer rows){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	/*fenye.setSname(Sname);*/
	fenye=wstuService.selectWstu(fenye);
	System.out.println(fenye);
	return fenye;
	
}
//É¾³ý
@RequestMapping(value = "/delStu", method = RequestMethod.POST)
@ResponseBody
public Integer delStu(Integer stu_id){
	return wstuService.delWstu(stu_id); 
}
//ÐÞ¸Ä
@RequestMapping(value = "/updateWstu", method = RequestMethod.POST)
@ResponseBody
public Integer updateWstu(Student student){
	return wstuService.updateWstu(student);
}
}
