package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.WstuMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
@Service
public class WstuServiceImpl implements WstuService {
@Autowired	
private WstuMapper wstuMapper;
	public Fenye<Student> selectWstu(Fenye<Student> fenye) {
		Integer selectWstuCount = wstuMapper.selectWstuCount(fenye);
		List<Student> selectWstu = wstuMapper.selectWstu(fenye);
		
		fenye.setTotal(selectWstuCount);
		fenye.setRows(selectWstu);
		return fenye;
	}
	@Override
	public Integer delWstu(Integer stu_id) {
		// TODO Auto-generated method stub
		return wstuMapper.delWstu(stu_id);
	}
	@Override
	public Integer updateWstu(Student student) {
		// TODO Auto-generated method stub
		return wstuMapper.updateWstu(student);
	}
	

}
