package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Modules {
	private Integer m_id;//编号
	private String m_name;//名称
	private Integer m_treeid;//tree的id
	private String m_str;//备用String类型
	private Integer m_sum;//数量用来排序
	public Modules() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Modules(Integer m_id, String m_name, Integer m_treeid, String m_str, Integer m_sum) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_treeid = m_treeid;
		this.m_str = m_str;
		this.m_sum = m_sum;
	}
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Integer getM_treeid() {
		return m_treeid;
	}
	public void setM_treeid(Integer m_treeid) {
		this.m_treeid = m_treeid;
	}
	public String getM_str() {
		return m_str;
	}
	public void setM_str(String m_str) {
		this.m_str = m_str;
	}
	public Integer getM_sum() {
		return m_sum;
	}
	public void setM_sum(Integer m_sum) {
		this.m_sum = m_sum;
	}
	@Override
	public String toString() {
		return "Modules [m_id=" + m_id + ", m_name=" + m_name + ", m_treeid=" + m_treeid + ", m_str=" + m_str
				+ ", m_sum=" + m_sum + "]";
	}
	
}
