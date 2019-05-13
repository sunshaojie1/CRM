package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Usery;

public interface UserysMapper {
	//Ա��ҳ����ʾ����
	
		/**
		 * ��ʾ��ҳ������
		 * @param fenye
		 * @return
		 */
		Integer selUseryCount(Fenye<Usery> fenye);
		
		/**
		 * ��ʾԱ������
		 * @param fenye
		 * @return
		 */
		List<Usery> selUsery(Fenye<Usery> fenye);
		
		
		/**
		 * �޸�Ա����Ϣ
		 * @param usery
		 * @return
		 */
		Integer updateUsery(Usery usery);
		
		
		/**
		 * ���Ա��
		 * @param usery
		 * @return
		 */
		Integer addUsery(Usery usery);
		
		
		/**
		 * ɾ��Ա��
		 * @param u_id
		 * @return
		 */
		Integer delUsery(Integer u_id);
		
		

}
