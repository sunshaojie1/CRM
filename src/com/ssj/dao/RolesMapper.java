package com.ssj.dao;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;

public interface RolesMapper {
	//��ҳ��ѯ������
	Integer selectRolesCount(Fenye<Roles> fenye);
	//��ҳ��ѯģ����ѯ
	List<Roles> selectRoles(Fenye<Roles> fenye);
	//�޸�
	Integer updateRoles(Roles roles);
	//���
	Integer addRoles(Roles roles);
	//ɾ��
	Integer delRoles(Integer r_id);
}
