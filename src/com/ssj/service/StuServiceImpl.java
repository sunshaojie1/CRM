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
	
	
	/**
	 * 查询所有学生信息
	 * @param fenye
	 * @return
	 */	
	@Override
	public Fenye<Student> selectStu(Fenye<Student> fenye) {
		// TODO Auto-generated method stub
		List<Student> stu = stuMapper.selectStu(fenye);
		Integer count = stuMapper.selectStuCount(fenye);
		fenye.setRows(stu);
		fenye.setTotal(count);
		return fenye;
	}

	/**
	 * 修改学生信息
	 * @param student
	 * @return
	 */
	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return stuMapper.updateStu(student);
	}

	/**
	 * 根据ID删除学生
	 * @param stu_id
	 * @return
	 */
	@Override
	public Integer delStu(Integer stu_id) {
		// TODO Auto-generated method stub
		return stuMapper.delStu(stu_id);
	}

	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	@Override
	public Integer addStu(Student student) {
		// TODO Auto-generated method stub
		return stuMapper.addStu(student);
	}

	/**
	 * 连表查询（学生表和用户表）
	 * @return
	 */
	@Override
	public List<Usery> getU_loginName() {
		// TODO Auto-generated method stub
		return stuMapper.getU_loginName()
				;
	}

}
