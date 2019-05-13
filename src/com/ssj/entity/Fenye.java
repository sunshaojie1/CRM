package com.ssj.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye<T> {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	private Usery usery;
	
	private String u_loginName;
	private String u_isLockout;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public Usery getUsery() {
		return usery;
	}
	public void setUsery(Usery usery) {
		this.usery = usery;
	}
	public String getU_loginName() {
		return u_loginName;
	}
	public void setU_loginName(String u_loginName) {
		this.u_loginName = u_loginName;
	}
	public String getU_isLockout() {
		return u_isLockout;
	}
	public void setU_isLockout(String u_isLockout) {
		this.u_isLockout = u_isLockout;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total="
				+ total + ", rows=" + rows + ", usery=" + usery
				+ ", u_loginName=" + u_loginName + ", u_isLockout="
				+ u_isLockout + "]";
	}
	

}
