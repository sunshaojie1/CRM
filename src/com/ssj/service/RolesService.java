package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Roles;

public interface RolesService {
 
		//��ҳ��ѯģ����ѯ
	Fenye<Roles> selectRoles(Fenye<Roles> fenye);

		//�޸�
		Integer updateRoles(Roles roles);
		//���
		Integer addRoles(Roles roles);
		//ɾ��
		Integer delRoles(Integer r_id);
}
