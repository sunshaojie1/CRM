package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface StuMapper {
	//分页查询总条数
		Integer selectStuCount(Fenye<Student> fenye);
		//分页查询模糊查询
		List<Student> selectStu(Fenye<Student> fenye);
		//修改
		Integer updateStu(Student student);
		//添加
		Integer addStu(Student student);
		//删除
		Integer delStu(Integer stu_id);

}
