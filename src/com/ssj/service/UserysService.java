package com.ssj.service;


import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;



public interface UserysService {
	/**
	 * 查询所有数据
	 * @param fenye
	 * @return
	 */
	Fenye<Usery> selUsery(Fenye<Usery> fenye);
	
	/**
	 * 修改
	 * @param Usery
	 * @return
	 */
	Integer updateUsery(Usery usery);
	
	
	/**
	 * 添加
	 * @param Usery
	 * @return
	 */
	Integer addUsery(Usery usery);
	
	
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	Integer delUsery(Integer u_id);
	

}
