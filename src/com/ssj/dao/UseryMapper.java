package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.Usery;

public interface UseryMapper {
	
	/**
	 * �û���¼�����˺��Ƿ����
	 * @param usery
	 * @return
	 */
	List<Usery> selectUsery(Usery usery);
	
	/**
	 * ��ѯ�û��Ľ�ɫ
	 * @param u_loginName
	 * @return
	 */
	List<Roles> selectRoles(String u_loginName);
	/**
	 * ��ѯ�û���ɫģ��
	 * @param rid
	 * @return
	 */
	List<Modules> selectModules(String r_name);
	
	/**
	 * ��������
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	Integer updateCz(Usery usery);
	
	
	
	
	
}
