package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface StuService {
	//��ҳ��ѯ
		Fenye<Student> selectStu(Fenye<Student>fenye);
		
		//�޸�
		Integer updateStu(Student student);
		//ɾ��
		Integer delStu(Integer stu_id);
//		//���
		Integer addStu(Student student);


}
