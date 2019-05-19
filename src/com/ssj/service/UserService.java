package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;

public interface UserService {
	/**
	 * 分页查询
	 * @param fenyea
	 * @return
	 */
	Fenyea<Usery> selectUsery(Fenyea<Usery> fenyea); 
	/**
	 * 删除
	 * @param u_id
	 * @return
	 */
	Integer delUsery(Integer u_id);
	/**
	 * 添加
	 * @param usery
	 * @return
	 */
	Integer insertUser(Usery usery);
	/**
	 * 修改
	 * @param usery
	 * @return
	 */
	Integer updateUser(Usery usery);
}
