package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;

public interface StuService {
	//��ҳ��ѯ
		Fenye<Student> selectStu(Fenye<Student>fenye);
		
		//�޸�
		Integer updateStu(Student student);
		//ɾ��
		Integer delStu(Integer stu_id);
//		//���
		Integer addStu(Student student);
		
		
		List<Usery> getU_loginName();


}
