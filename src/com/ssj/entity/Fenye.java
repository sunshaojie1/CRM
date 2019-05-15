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
	
	private String stu_name;
	private String stu_phone;
	//private String stu_name;
	private Integer stu_money;
	private Integer stu_youXiao;
	private Integer stu_huiFang;
	private String stu_qq;
	private String stu_creatorTime;
	
	
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
	
//我的学生
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public Integer getStu_money() {
		return stu_money;
	}
	public void setStu_money(Integer stu_money) {
		this.stu_money = stu_money;
	}
	public Integer getStu_youXiao() {
		return stu_youXiao;
	}
	public void setStu_youXiao(Integer stu_youXiao) {
		this.stu_youXiao = stu_youXiao;
	}
	public Integer getStu_huiFang() {
		return stu_huiFang;
	}
	public void setStu_huiFang(Integer stu_huiFang) {
		this.stu_huiFang = stu_huiFang;
	}
	public String getStu_qq() {
		return stu_qq;
	}
	public void setStu_qq(String stu_qq) {
		this.stu_qq = stu_qq;
	}
	public String getStu_creatorTime() {
		return stu_creatorTime;
	}
	public void setStu_creatorTime(String stu_creatorTime) {
		this.stu_creatorTime = stu_creatorTime;
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
