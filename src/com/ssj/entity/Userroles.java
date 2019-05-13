package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Userroles {
	private Integer id;//编号
	private Integer user_id;//用户编号，连接用户表
	private Integer roles_id;//角色编号、连接角色表
	public Userroles() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Userroles(Integer id, Integer user_id, Integer roles_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.roles_id = roles_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getRoles_id() {
		return roles_id;
	}
	public void setRoles_id(Integer roles_id) {
		this.roles_id = roles_id;
	}
	@Override
	public String toString() {
		return "Userroles [id=" + id + ", user_id=" + user_id + ", roles_id=" + roles_id + "]";
	}
	
}
