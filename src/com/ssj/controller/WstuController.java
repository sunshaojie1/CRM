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
@RequestMapping(value = "/showStu2", method = RequestMethod.POST)
@ResponseBody
public Fenye<Student> showWstu(Integer page,Integer rows,String stu_name,String stu_phone,Integer stu_money,
		Integer stu_youXiao,Integer stu_huiFang,String stu_qq,String endcreatorTime,String startcreatorTime){
	
   System.out.println(stu_youXiao);	
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setStu_name(stu_name);
	fenye.setStu_phone(stu_phone);
	fenye.setStu_money(stu_money);
	fenye.setStu_qq(stu_qq);
	fenye.setStu_huiFang(stu_huiFang);
	fenye.setStu_qq(stu_qq);
	fenye.setStartcreatorTime(startcreatorTime);
	fenye.setEndcreatorTime(endcreatorTime);
	fenye=wstuService.selectWstu(fenye);
	System.out.println(fenye);
	return fenye;
	
}
//删除
@RequestMapping(value = "/delStu2", method = RequestMethod.POST)
@ResponseBody
public Integer delStu(Integer stu_id){
	return wstuService.delWstu(stu_id); 
}
//修改
@RequestMapping(value = "/updateStu2", method = RequestMethod.POST)
@ResponseBody
public Integer updateWstu(Student student){
	return wstuService.updateWstu(student);
}
}