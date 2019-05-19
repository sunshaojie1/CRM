package com.ssj.service;

import java.util.List;

import com.ssj.entity.Roles;
import com.ssj.entity.Userroles;

public interface RolesService {
	/**
	 * ��ѯ���н�ɫ
	 * @return
	 */
	List<Roles> selectRol(Roles roles);
	/**
	 * ��ѯ�û��µĽ�ɫ
	 * @param u_name
	 * @return
	 */
	List<Roles> selectUser(String u_name);
	/**
	 * ���û���ӽ�ɫ
	 * @param userroles
	 * @return
	 */
	Integer inserRoles(Userroles userroles);
	/**
	 * �ж�
	 * @param userroles
	 * @return
	 */
	Integer RolesCount(Userroles userroles);
	
	/**
	 * ɾ��
	 * @param userroles
	 * @return
	 */
	Integer delRoles(Userroles userroles);
	
	/**
	 * ɾ��һ����ɫ
	 * @param r_id
	 * @return
	 */
	Integer delro(Integer r_id);
	/**
	 * ���
	 * @param roles
	 * @return
	 */
	Integer insertro(Roles roles);
	/**
	 * �޸�
	 * @param roles
	 * @return
	 */
	Integer updro(Roles roles);
}
