package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface WstuMapper {
	//��ѯ������	
	Integer selectWstuCount(Fenye fenye);
	//��ҳ��ѯ
	List<Student> selectWstu(Fenye fenye);

	//���
	Integer addWstu(Student student);
	//�޸�
	Integer updateWstu(Student student);	
	//ɾ��
	Integer delWstu(Integer stu_id);
	}
