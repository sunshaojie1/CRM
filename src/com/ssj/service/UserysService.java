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
	 * �޸�
	 * @param Usery
	 * @return
	 */
	Integer updateUsery(Usery usery);
	
	
	/**
	 * ���
	 * @param Usery
	 * @return
	 */
	Integer addUsery(Usery usery);
	
	
	
	
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
	Integer delUsery(Integer u_id);
	

}
