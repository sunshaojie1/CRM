package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.StuMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;

@Service
public class StuServiceImpl implements StuService{
	
	@Autowired
	private StuMapper stuMapper;

	@Override
	public Fenye<Student> selectStu(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		List<Student> stu = stuMapper.selectStu(fenye);
		Integer count = stuMapper.selectStuCount(fenye);
		fenye.setRows(stu);
		fenye.setTotal(count);
		return fenye;
	}

	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return stuMapper.updateStu(student);
	}

	@Override
	public Integer delStu(Integer stu_id) {
		// TODO Auto-generated method stub
		return stuMapper.delStu(stu_id);
	}

	@Override
	public Integer addStu(Student student) {
		// TODO Auto-generated method stub
		return stuMapper.addStu(student);
	}

	@Override
	public List<Usery> getU_loginName() {
		// TODO Auto-generated method stub
		return stuMapper.getU_loginName()
				;
	}

}
