package com.ssj.entity;

public class ModulesTree {
	private Integer id;
	private String text;
	public ModulesTree() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ModulesTree(Integer id, String text) {
		super();
		this.id = id;
		this.text = text;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "ModulesTree [id=" + id + ", text=" + text + "]";
	}
	
}
