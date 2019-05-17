package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;

public interface StuService {
	//分页查询
		Fenye<Student> selectStu(Fenye<Student>fenye);
		
		//修改
		Integer updateStu(Student student);
		//删除
		Integer delStu(Integer stu_id);
//		//添加
		Integer addStu(Student student);
		
		
		List<Usery> getU_loginName();


}
