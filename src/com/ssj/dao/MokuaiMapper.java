package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Rolemodules;
import com.ssj.entity.Roles;
import com.ssj.entity.RolesTree;

public interface MokuaiMapper {
	/**
	 * ��ѯ���н�ɫ
	 * @return
	 */
	List<Roles> selectRoles();
	/**
	 * ��ѯ��ɫ�µ�ģ��
	 * @param r_name
	 * @return
	 */
	List<Modules> selectModulesTree(String r_name);
	/**
	 * ��ѯ����ģ��
	 * @return
	 */
	List<Modules> modulesSelect();
	/**
	 * ������һ��ģ��
	 * @param modules
	 * @return
	 */
	Integer insertMod(Modules modules);
	/**
	 * ɾ��һ��ģ��
	 * @param m_id
	 * @return
	 */
	Integer deleteMod(Integer m_id);
	/**
	 * �޸�
	 * @param modules
	 * @return
	 */
	Integer updateMod(Modules modules);
	/**
	 * ��ɫ�µ�ģ��
	 * @param r_name
	 * @return
	 */
	List<Modules> selMo(String r_name);
	
	/**
	 * ����ɫ���ģ��
	 * @param rolemodules
	 * @return
	 */
	Integer insertMo(Rolemodules rolemodules);
	/**
	 * ɾ����ɫ�µ�ģ��
	 * @param rolemodules
	 * @return
	 */
	Integer deleteMo(Rolemodules rolemodules);
	/**
	 * �ж��Ƿ����ظ�
	 * @param rolemodules
	 * @return
	 */
	Integer MoCount(Rolemodules rolemodules);
}
