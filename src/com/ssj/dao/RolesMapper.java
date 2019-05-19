package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Roles;
import com.ssj.entity.Userroles;

public interface RolesMapper {
	
	/**
	 * ��ѯ�����û���ɫ
	 * @return
	 */
	List<Roles> selectRoles(Roles roles);
	/**
	 * ��ѯ�û��µ����н�ɫ
	 * @param u_name
	 * @return
	 */
	List<Roles> selectUsery(String u_name);
	/**
	 * ���û��ӽ�ɫ
	 * @param userroles
	 * @return
	 */
	Integer inserRoles(Userroles userroles);
	/**
	 * �ж�.
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
