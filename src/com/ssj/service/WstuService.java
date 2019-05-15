package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface WstuService {
//·ÖÒ³²éÑ¯	
Fenye<Student> selectWstu(Fenye<Student> fenye); 
//É¾³ı
Integer delWstu(Integer stu_id);

//ĞŞ¸Ä
Integer updateWstu(Student student);
}
