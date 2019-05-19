package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;

public interface UserMapper {
	/**
	 * 分页查询用户
	 * @param fenyea
	 * @return
	 */
	List<Usery> selectUsery(Fenyea<Usery> fenyea);
	/**
	 * 查询总条数
	 * @return
	 */
	Integer selectUseruCount(Fenyea<Usery> fenyea);
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
