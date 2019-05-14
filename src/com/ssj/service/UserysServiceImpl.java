package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.UserysMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;
@Service
public class UserysServiceImpl implements UserysService {

	@Autowired
	private UserysMapper userysMapper;
	

	@Override
	public Fenye<Usery> selUsery(Fenye<Usery> fenye) {
		Integer selUseryCount = userysMapper.selUseryCount(fenye);
		List<Usery> selUsery = userysMapper.selUsery(fenye);
		fenye.setRows(selUsery);
		fenye.setTotal(selUseryCount);
		
		return fenye;
	}
	
	@Override
	public Integer updateUsery(Usery usery) {
		// TODO Auto-generated method stub
		return userysMapper.updateUsery(usery);
	}

	@Override
	public Integer addUsery(Usery usery) {
		// TODO Auto-generated method stub
		return userysMapper.addUsery(usery);
	}

	@Override
	public Integer delUsery(Integer u_id) {
		// TODO Auto-generated method stub
		return userysMapper.delUsery(u_id);
	}


}
