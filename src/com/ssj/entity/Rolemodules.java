package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Rolemodules {
	private Integer id;//���
	private Integer role_id;//��ɫ��ţ����ӽ�ɫ��
	private Integer module_id;//ģ���ţ�����ģ���
	public Rolemodules() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rolemodules(Integer id, Integer role_id, Integer module_id) {
		super();
		this.id = id;
		this.role_id = role_id;
		this.module_id = module_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getModule_id() {
		return module_id;
	}
	public void setModule_id(Integer module_id) {
		this.module_id = module_id;
	}
	@Override
	public String toString() {
		return "Rolemodules [id=" + id + ", role_id=" + role_id + ", module_id=" + module_id + "]";
	}
	
}
