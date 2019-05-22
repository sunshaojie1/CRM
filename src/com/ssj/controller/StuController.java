package com.ssj.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;
import com.ssj.service.StuService;

@Controller
public class StuController {
	
	//学生管理
	
	@Autowired
	private Fenye<Student> fenye;
	@Autowired
	private StuService stuService;
	
	/**
	 * 查询所有学生
	 * @param fenye
	 * @return
	 */	
	@RequestMapping(value="/selectStu1",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectStu(Integer page,Integer rows,Student stu,String startTime,String endTime){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setStudent(stu);
	fenye.setStartTime(startTime);
	fenye.setEndTime(endTime);
	fenye = stuService.selectStu(fenye);
	return fenye;
	
}
	
	/**
	 * 修改学生信息
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/updateStu1",method=RequestMethod.POST)
	@ResponseBody
	public  Integer updateStu(Student student){
	
		return stuService.updateStu(student);
		
	}
	
	/**
	 * 根据ID删除学生
	 * @param stu_id
	 * @return
	 */
	@RequestMapping(value="/delStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Integer stu_id){
		return stuService.delStu(stu_id);
		
	}
	
	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/addStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer addStu(Student student){
		
		return stuService.addStu(student);
		
	}
	
	/**
	 *  连表（学生表和用户表）查询所有的用户返回前台为json
	 * @return
	 */
	@RequestMapping(value="/getU_loginName",method=RequestMethod.POST)
	@ResponseBody
	public List<Usery> getU_loginName(){
	
		return stuService.getU_loginName();
		
	}
	

}
