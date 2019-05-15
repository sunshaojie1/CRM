package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface StuService {
	//分页查询
		Fenye<Student> selectStu(Fenye<Student>fenye);
		
		//修改
		Integer updateStu(Student student);
		//删除
		Integer delStu(Integer stu_id);
//		//添加
		Integer addStu(Student student);


}
