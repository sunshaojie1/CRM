package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;

public interface WodeStuService {
	//·ÖÒ³²éÑ¯
	Fenye<Student> selectStu(Fenye<Student>fenye);
	
	//ĞŞ¸Ä
	Integer updateStu(Student student);
	//É¾³ı
	Integer delStu(Integer stu_id);

}
