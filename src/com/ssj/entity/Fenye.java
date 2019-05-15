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
	private String u_isQianDao;
	private String u_clockinTime;//打卡上班
	private String u_clockoutTime;//打卡下班 
	
	public String getU_isQianDao() {
		return u_isQianDao;
	}
	public void setU_isQianDao(String u_isQianDao) {
		this.u_isQianDao = u_isQianDao;
	}
	public String getU_clockinTime() {
		return u_clockinTime;
	}
	public void setU_clockinTime(String u_clockinTime) {
		this.u_clockinTime = u_clockinTime;
	}
	public String getU_clockoutTime() {
		return u_clockoutTime;
	}
	public void setU_clockoutTime(String u_clockoutTime) {
		this.u_clockoutTime = u_clockoutTime;
	}
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
				+ u_isLockout + ", u_isQianDao=" + u_isQianDao
				+ ", u_clockinTime=" + u_clockinTime + ", u_clockoutTime="
				+ u_clockoutTime + "]";
	}
	

}
