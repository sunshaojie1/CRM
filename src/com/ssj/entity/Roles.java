package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {
	private Integer r_id;//角色id
	private String r_name;//角色名称
	private Integer exit1;//备用int
	private String exit2;//备用String
	
	public Roles() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Roles(Integer r_id, String r_name, Integer exit1, String exit2) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.exit1 = exit1;
		this.exit2 = exit2;
	}
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	@Override
	public String toString() {
		return "Roles [r_id=" + r_id + ", r_name=" + r_name + "]";
	}
	
	 
	
}
