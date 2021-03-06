package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;


public interface StuMapper {
	//学生管理
	
		/**
		 * 查询分页总条数
		 * @param fenye
		 * @return
		 */
		Integer selectStuCount(Fenye<Student> fenye);
	
		
		/**
		 * 查询所有学生
		 * @param fenye
		 * @return
		 */
		List<Student> selectStu(Fenye<Student> fenye);
		
		
		
		/**
		 * 修改学生信息
		 * @param student
		 * @return
		 */
		Integer updateStu(Student student);
		
		
		/**
		 * 添加学生
		 * @param student
		 * @return
		 */
		Integer addStu(Student student);
	
		
		/**
		 * 根据ID删除学生
		 * @param stu_id
		 * @return
		 */
		Integer delStu(Integer stu_id);
		
		
		/**
		 *  连表（学生表和用户表）查询所有的用户返回前台为json
		 * @return
		 */
		List<Usery> getU_loginName();

}
