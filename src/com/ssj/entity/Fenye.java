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
	private Integer stu_money;
	private Integer stu_youXiao;
	private Integer stu_huiFang;
	private String stu_qq;

	private String stu_creatorTime;
	private String startTime;
	private String endTime;

	private String startstu_creatorTime;
	private String eddstu_creatorTime;

	
	
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	private String u_loginName;
	private String u_isLockout;
	private String u_isQianDao;
	private String u_clockinTime;//´ò¿¨ÉÏ°à
	private String u_clockoutTime;//´ò¿¨ÏÂ°à 
	
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

	private String startcreatorTime;
	private String endcreatorTime;
	
	//¸ú×Ù±íËÑË÷
	private String sname;
	private String t_huiFang;
	private String t_fangShi;
	private String startt_beginTime;
	private String endt_beginTime;
	private String startt_finishTime;
	private String endt_finishTime;
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getT_huiFang() {
		return t_huiFang;
	}
	public void setT_huiFang(String t_huiFang) {
		this.t_huiFang = t_huiFang;
	}
	public String getStartt_beginTime() {
		return startt_beginTime;
	}
	public void setStartt_beginTime(String startt_beginTime) {
		this.startt_beginTime = startt_beginTime;
	}
	public String getEndt_beginTime() {
		return endt_beginTime;
	}
	public void setEndt_beginTime(String endt_beginTime) {
		this.endt_beginTime = endt_beginTime;
	}
	public String getStartt_finishTime() {
		return startt_finishTime;
	}
	public void setStartt_finishTime(String startt_finishTime) {
		this.startt_finishTime = startt_finishTime;
	}
	public String getEndt_finishTime() {
		return endt_finishTime;
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
 
	public String getStartstu_creatorTime() {
		return startstu_creatorTime;
	}
	public void setStartstu_creatorTime(String startstu_creatorTime) {
		this.startstu_creatorTime = startstu_creatorTime;
	}
	public String getEddstu_creatorTime() {
		return eddstu_creatorTime;
	}
	 
	public String getStartcreatorTime() {
		return startcreatorTime;
	}
	public void setStartcreatorTime(String startcreatorTime) {
		this.startcreatorTime = startcreatorTime;
	}
	public String getEndcreatorTime() {
		return endcreatorTime;
	}
	public void setEndcreatorTime(String endcreatorTime) {
		this.endcreatorTime = endcreatorTime;
	}
	public String getT_fangShi() {
		return t_fangShi;
	}

}
