package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface StuMapper {
	//��ҳ��ѯ������
		Integer selectStuCount(Fenye<Student> fenye);
		//��ҳ��ѯģ����ѯ
		List<Student> selectStu(Fenye<Student> fenye);
		//�޸�
		Integer updateStu(Student student);
		//���
		Integer addStu(Student student);
		//ɾ��
		Integer delStu(Integer stu_id);

}
