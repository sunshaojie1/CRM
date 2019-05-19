package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;

public interface UserService {
	/**
	 * ��ҳ��ѯ
	 * @param fenyea
	 * @return
	 */
	Fenyea<Usery> selectUsery(Fenyea<Usery> fenyea); 
	/**
	 * ɾ��
	 * @param u_id
	 * @return
	 */
	Integer delUsery(Integer u_id);
	/**
	 * ���
	 * @param usery
	 * @return
	 */
	Integer insertUser(Usery usery);
	/**
	 * �޸�
	 * @param usery
	 * @return
	 */
	Integer updateUser(Usery usery);
}
