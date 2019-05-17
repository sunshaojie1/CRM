package com.ssj.service;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.Usery;

public interface UseryService {
	/**
	 * ��ѯ�û�
	 * @param usery
	 * @return
	 */
	List<Usery> selectUsery(Usery usery);
/**
 * ��ѯ�û���ɫ
 * @param u_loginName
 * @return
 */
	List<Roles> selectRoles(String u_loginName);
	/**
	 * ��ѯ�û���ɫģ��
	 * @param r_name
	 * @return
	 */
	List<Modules> selectModules(String r_name);
	/**
	 * ��������
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	public Integer updateCz(Usery usery);
	/**
	 * �޸�����
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	Integer updateXiugai(Usery usery);
}
