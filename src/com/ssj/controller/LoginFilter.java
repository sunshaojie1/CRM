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

	// true: 如果session存在，则返回该session，否则创建一个新的session；
	// false: 如果session存在，则返回该session，否则返回null.
	// session = request.getSession(true);
	/**
	 * 登录
	 * 
	 * @param session
	 * @param u
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Integer login(HttpSession session, Usery u) {
		List<Usery> su = useryService.selectUsery(u);// 数据一条
		if (su.size() > 0 && su != null) {// 查询集合里面有没有数据
			if (u.getU_password().equals(su.get(0).getU_password())) {
				if (su.get(0).getU_isLockout() == 0) {
					session.setAttribute("uname", u.getU_loginName());
					// System.out.println("成功");
					return 1;
				} else if (su.get(0).getU_isLockout() == 1) {
					// System.out.println("锁定");
					return 2;
				}
			} else {
				// System.out.println("密码错误");
				return 3;
			}
		} else {
			 System.out.println("账号错误");
			return 4;
		}
		return 0;
	}

	/**
	 * 查询用户所登录的角色对应的tree
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/selectRoles", method = RequestMethod.POST)
	@ResponseBody
	public List<RolesTree> selectRoles(HttpSession session) {
		String u_loginName = (String) session.getAttribute("uname");
		// 查询用户角色 -- 根据用户名来查询该用户下面的角色
		List<Roles> selectRoles = useryService.selectRoles(u_loginName);
		// 把查询出来的tree存到固定格式的tree类中
		List<RolesTree> rt = new ArrayList<RolesTree>();// 角色tree
		Integer rolesid = 1;// 角色tree的id
		Integer modules = 100;// 模块tree的id
		for (int i = 0; i < selectRoles.size(); i++) {
			List<ModulesTree> mt = new ArrayList<ModulesTree>();// 模块tree
			// 查询用户角色模块--根据角色名来查询该角色下面的模块
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
	 * 退出
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
	 * 重置密码
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
		List<Usery> usCz = useryService.selectUsery(u);// 是否有该用户
		if (usCz.size() > 0 && usCz != null) {
			System.out.println(123);
			if (CzPhone.equals(usCz.get(0).getU_phone())) {
				// System.out.println("电话号正确");
				if (usCz.get(0).getU_isLockout() == 0) {
					// System.out.println("重置成功");
					Integer i = useryService.updateCz(u);// 当用户名电话都正确的时候
					// System.out.println(i);
					return i;
				} else if (usCz.get(0).getU_isLockout() == 1) {
					// System.out.println("锁定不能重置密码");
					return -1;
				}
			} else {
				// System.out.println("电话号不正确");
				return -2;
			}
		} else {
			// System.out.println("用户名不正确");
			return -3;
		}
		return 0;
	}
}
