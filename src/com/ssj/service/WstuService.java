package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface WstuService {
//��ҳ��ѯ	
Fenye<Student> selectWstu(Fenye<Student> fenye); 
//ɾ��
Integer delWstu(Integer stu_id);

//�޸�
Integer updateWstu(Student student);
}
