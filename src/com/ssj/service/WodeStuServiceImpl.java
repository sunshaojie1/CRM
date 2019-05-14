package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.WodeStuMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
@Service
public class WodeStuServiceImpl implements WodeStuService{
	@Autowired
private WodeStuMapper wodeStuMapper;
	@Override
	//∑÷“≥≤È—Ø
	public Fenye<Student> selectStu(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		List<Student> stu = wodeStuMapper.selectStu(fenye);
		Integer count = wodeStuMapper.selectStuCount(fenye);
		fenye.setRows(stu);
		fenye.setTotal(count);
		return fenye;
	}
	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return wodeStuMapper.updateStu(student);
	}
	@Override
	public Integer delStu(Integer stu_id) {
		// TODO Auto-generated method stub
		return wodeStuMapper.delStu(stu_id);
	}
	 
	 

}
