package com.ssj.service;


import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;



public interface UserysService {
	/**
	 * ��ѯ��������
	 * @param fenye
	 * @return
	 */
	Fenye<Usery> selUsery(Fenye<Usery> fenye);
	
	/**
	 * �޸�Ա����Ϣ
	 * @param Usery
	 * @return
	 */
	Integer updateUsery(Usery usery);
	
	
	/**
	 * ���Ա��
	 * @param Usery
	 * @return
	 */
	Integer addUsery(Usery usery);
	
	
	
	
	/**
	 * ����ɾ��Ա��
	 * @param id
	 * @return
	 */
	Integer delUsery(Integer u_id);
	

}
