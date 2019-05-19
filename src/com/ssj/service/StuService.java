package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Usery;

public interface StuService {
	//ѧ������
	
	
		/**
		 * ��ѯ����ѧ����Ϣ
		 * @param fenye
		 * @return
		 */
		Fenye<Student> selectStu(Fenye<Student>fenye);
		
		
		/**
		 * �޸�ѧ����Ϣ
		 * @param student
		 * @return
		 */
		Integer updateStu(Student student);
		
		
		/**
		 * ���ѧ��
		 * @param student
		 * @return
		 */
		Integer addStu(Student student);
	
		
		/**
		 * ����IDɾ��ѧ��
		 * @param stu_id
		 * @return
		 */
		Integer delStu(Integer stu_id);
		
		
		/**
		 * ����ѧ������û�����ѯ���е��û�����ǰ̨Ϊjson
		 * @return
		 */
		List<Usery> getU_loginName();


}
