package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.UserMapper;
import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Override
	public Fenyea selectUsery(Fenyea<Usery> fenyea) {
		fenyea.setRows(userMapper.selectUsery(fenyea));
		fenyea.setTotal(userMapper.selectUseruCount(fenyea));
		return fenyea;
	}
	@Override
	public Integer delUsery(Integer u_id) {
		
		return userMapper.delUsery(u_id);
	}
	@Override
	public Integer insertUser(Usery usery) {
		// TODO Auto-generated method stub
		return userMapper.insertUser(usery);
	}
	@Override
	public Integer updateUser(Usery usery) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(usery);
	}

}
