package com.ssj.entity;

import java.util.List;

public class RolesTree {
	private Integer id;
	private String text;
	private List<ModulesTree> children;
	public RolesTree() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RolesTree(Integer id, String text, List<ModulesTree> children) {
		super();
		this.id = id;
		this.text = text;
		this.children = children;
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
	public List<ModulesTree> getChildren() {
		return children;
	}
	public void setChildren(List<ModulesTree> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "RolesTree [id=" + id + ", text=" + text + ", children=" + children + "]";
	}

}
