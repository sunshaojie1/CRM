package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface WstuMapper {
	//查询总条数	
	Integer selectWstuCount(Fenye fenye);
	//分页查询
	List<Student> selectWstu(Fenye fenye);

	//添加
	Integer addWstu(Student student);
	//修改
	Integer updateWstu(Student student);	
	//删除
	Integer delWstu(Integer stu_id);
	}
