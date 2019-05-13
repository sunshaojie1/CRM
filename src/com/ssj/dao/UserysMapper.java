package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;

public interface UserysMapper {
	//员工页面显示数据
	
		/**
		 * 显示分页总条数
		 * @param fenye
		 * @return
		 */
		Integer selUseryCount(Fenye<Usery> fenye);
		
		/**
		 * 显示员工数据
		 * @param fenye
		 * @return
		 */
		List<Usery> selUsery(Fenye<Usery> fenye);
		
		
		/**
		 * 修改员工信息
		 * @param usery
		 * @return
		 */
		Integer updateUsery(Usery usery);
		
		
		/**
		 * 添加员工
		 * @param usery
		 * @return
		 */
		Integer addUsery(Usery usery);
		
		
		/**
		 * 删除员工
		 * @param u_id
		 * @return
		 */
		Integer delUsery(Integer u_id);
		
		

}
