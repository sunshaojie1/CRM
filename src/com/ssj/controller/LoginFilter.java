package com.ssj.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Modules;
import com.ssj.entity.ModulesTree;
import com.ssj.entity.Roles;
import com.ssj.entity.RolesTree;
import com.ssj.entity.Usery;
import com.ssj.service.UseryService;

@Controller
public class LoginFilter {

	@Autowired
	private UseryService useryService;

	// true: ���session���ڣ��򷵻ظ�session�����򴴽�һ���µ�session��
	// false: ���session���ڣ��򷵻ظ�session�����򷵻�null.
	// session = request.getSession(true);
	/**
	 * ��¼
	 * 
	 * @param session
	 * @param u
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Integer login(HttpSession session, Usery u) {
		List<Usery> su = useryService.selectUsery(u);// ����һ��
		if (su.size() > 0 && su != null) {// ��ѯ����������û������
			if (u.getU_password().equals(su.get(0).getU_password())) {
				if (su.get(0).getU_isLockout() == 0) {
					session.setAttribute("uname", u.getU_loginName());
					// System.out.println("�ɹ�");
					return 1;
				} else if (su.get(0).getU_isLockout() == 1) {
					// System.out.println("����");
					return 2;
				}
			} else {
				// System.out.println("�������");
				return 3;
			}
		} else {
			 System.out.println("�˺Ŵ���");
			return 4;
		}
		return 0;
	}

	/**
	 * ��ѯ�û�����¼�Ľ�ɫ��Ӧ��tree
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/selectRoles", method = RequestMethod.POST)
	@ResponseBody
	public List<RolesTree> selectRoles(HttpSession session) {
		String u_loginName = (String) session.getAttribute("uname");
		// ��ѯ�û���ɫ -- �����û�������ѯ���û�����Ľ�ɫ
		List<Roles> selectRoles = useryService.selectRoles(u_loginName);
		// �Ѳ�ѯ������tree�浽�̶���ʽ��tree����
		List<RolesTree> rt = new ArrayList<RolesTree>();// ��ɫtree
		Integer rolesid = 1;// ��ɫtree��id
		Integer modules = 100;// ģ��tree��id
		for (int i = 0; i < selectRoles.size(); i++) {
			List<ModulesTree> mt = new ArrayList<ModulesTree>();// ģ��tree
			// ��ѯ�û���ɫģ��--���ݽ�ɫ������ѯ�ý�ɫ�����ģ��
			List<Modules> selectModules = useryService.selectModules(selectRoles.get(i).getR_name());
			for (int j = 0; j < selectModules.size(); j++) {
				mt.add(new ModulesTree(selectModules.get(j).getM_treeid(), selectModules.get(j).getM_name()));
				// System.out.println(mt);
			}
			// System.out.println(mt);
			rt.add(new RolesTree(rolesid++, selectRoles.get(i).getR_name(), mt));
		}
		// System.out.println(rt);
		return rt;
	}

	/**
	 * �˳�
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("uname");
		return "login";
	}

	/**
	 * ��������
	 * 
	 * @param CzName
	 * @param CzPhone
	 * @return
	 */
	@RequestMapping(value = "/updateCz", method = RequestMethod.POST)
	@ResponseBody()
	public Integer updateCz(String CzName, String CzPhone) {
		Usery u = new Usery();
		u.setU_loginName(CzName);
		u.setU_phone(CzPhone);
		List<Usery> usCz = useryService.selectUsery(u);// �Ƿ��и��û�
		if (usCz.size() > 0 && usCz != null) {
			System.out.println(123);
			if (CzPhone.equals(usCz.get(0).getU_phone())) {
				// System.out.println("�绰����ȷ");
				if (usCz.get(0).getU_isLockout() == 0) {
					// System.out.println("���óɹ�");
					Integer i = useryService.updateCz(u);// ���û����绰����ȷ��ʱ��
					// System.out.println(i);
					return i;
				} else if (usCz.get(0).getU_isLockout() == 1) {
					// System.out.println("����������������");
					return -1;
				}
			} else {
				// System.out.println("�绰�Ų���ȷ");
				return -2;
			}
		} else {
			// System.out.println("�û�������ȷ");
			return -3;
		}
		return 0;
	}
}
