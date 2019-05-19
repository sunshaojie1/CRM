package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;

public interface UserMapper {
	/**
	 * ��ҳ��ѯ�û�
	 * @param fenyea
	 * @return
	 */
	List<Usery> selectUsery(Fenyea<Usery> fenyea);
	/**
	 * ��ѯ������
	 * @return
	 */
	Integer selectUseruCount(Fenyea<Usery> fenyea);
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
