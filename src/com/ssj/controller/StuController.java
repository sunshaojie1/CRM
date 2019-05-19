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
	
	//ѧ������
	
	@Autowired
	private Fenye<Student> fenye;
	@Autowired
	private StuService stuService;
	
	/**
	 * ��ѯ����ѧ��
	 * @param fenye
	 * @return
	 */	
	@RequestMapping(value="/selectStu1",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectStu(Integer page,Integer rows,Student stu){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setStudent(stu);
	fenye = stuService.selectStu(fenye);
	return fenye;
	
}
	
	/**
	 * �޸�ѧ����Ϣ
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/updateStu1",method=RequestMethod.POST)
	@ResponseBody
	public  Integer updateStu(Student student){
		System.out.println(student);
		return stuService.updateStu(student);
		
	}
	
	/**
	 * ����IDɾ��ѧ��
	 * @param stu_id
	 * @return
	 */
	@RequestMapping(value="/delStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Integer stu_id){
		return stuService.delStu(stu_id);
		
	}
	
	/**
	 * ���ѧ��
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/addStu1",method=RequestMethod.POST)
	@ResponseBody
	public Integer addStu(Student student){
		
		return stuService.addStu(student);
		
	}
	
	/**
	 *  ����ѧ������û�����ѯ���е��û�����ǰ̨Ϊjson
	 * @return
	 */
	@RequestMapping(value="/getU_loginName",method=RequestMethod.POST)
	@ResponseBody
	public List<Usery> getU_loginName(){
		
		return stuService.getU_loginName();
		
	}
	

}
