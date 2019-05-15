package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Usery {
	private Integer u_id;//
	private String u_loginName;//登录账户
	private String u_password;//登录密码
	private Integer u_isLockout;//是否锁定
	private String u_loginTime;//登录时间
	private String u_logoutTime;//退出时间
	private String u_isQianDao;//是否签到
	private String u_clockinTime;//打卡上班
	private String u_clockoutTime;//打卡下班
	private String u_creationTime;//创建时间
	private String u_email;//邮箱
	private String u_phone;//手机号
	
	
	
	public String getU_isQianDao() {
		return u_isQianDao;
	}
	public void setU_isQianDao(String u_isQianDao) {
		this.u_isQianDao = u_isQianDao;
	}
	public Usery(Integer u_id, String u_loginName, String u_password, Integer u_isLockout, String u_loginTime,
			String u_logoutTime, String u_clockinTime, String u_clockoutTime, String u_creationTime, String u_email,
			String u_phone) {
		super();
		this.u_id = u_id;
		this.u_loginName = u_loginName;
		this.u_password = u_password;
		this.u_isLockout = u_isLockout;
		this.u_loginTime = u_loginTime;
		this.u_logoutTime = u_logoutTime;
		this.u_clockinTime = u_clockinTime;
		this.u_clockoutTime = u_clockoutTime;
		this.u_creationTime = u_creationTime;
		this.u_email = u_email;
		this.u_phone = u_phone;
	}
	public Usery() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_loginName() {
		return u_loginName;
	}
	public void setU_loginName(String u_loginName) {
		this.u_loginName = u_loginName;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public Integer getU_isLockout() {
		return u_isLockout;
	}
	public void setU_isLockout(Integer u_isLockout) {
		this.u_isLockout = u_isLockout;
	}
	public String getU_loginTime() {
		return u_loginTime;
	}
	public void setU_loginTime(String u_loginTime) {
		this.u_loginTime = u_loginTime;
	}
	public String getU_logoutTime() {
		return u_logoutTime;
	}
	public void setU_logoutTime(String u_logoutTime) {
		this.u_logoutTime = u_logoutTime;
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
	public String getU_creationTime() {
		return u_creationTime;
	}
	public void setU_creationTime(String u_creationTime) {
		this.u_creationTime = u_creationTime;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	@Override
	public String toString() {
		return "Usery [u_id=" + u_id + ", u_loginName=" + u_loginName
				+ ", u_password=" + u_password + ", u_isLockout=" + u_isLockout
				+ ", u_loginTime=" + u_loginTime + ", u_logoutTime="
				+ u_logoutTime + ", u_isQianDao=" + u_isQianDao
				+ ", u_clockinTime=" + u_clockinTime + ", u_clockoutTime="
				+ u_clockoutTime + ", u_creationTime=" + u_creationTime
				+ ", u_email=" + u_email + ", u_phone=" + u_phone + "]";
	}
	
}
