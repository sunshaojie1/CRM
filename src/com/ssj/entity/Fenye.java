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
	//学生表搜索
	private String stu_name;
	private String stu_phone;
	private Integer stu_money;
	private Integer stu_youXiao;
	private Integer stu_huiFang;
	private String stu_qq;
	private String startcreatorTime;
	private String endcreatorTime;
	
	//跟踪表搜索
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
	public void setEndt_finishTime(String endt_finishTime) {
		this.endt_finishTime = endt_finishTime;
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
	public void setT_fangShi(String t_fangShi) {
		this.t_fangShi = t_fangShi;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total="
				+ total + ", rows=" + rows + ", usery=" + usery
				+ ", u_loginName=" + u_loginName + ", u_isLockout="
				+ u_isLockout + ", stu_name=" + stu_name + ", stu_phone="
				+ stu_phone + ", stu_money=" + stu_money + ", stu_youXiao="
				+ stu_youXiao + ", stu_huiFang=" + stu_huiFang + ", stu_qq="
				+ stu_qq + ", startcreatorTime=" + startcreatorTime
				+ ", endcreatorTime=" + endcreatorTime + ", sname=" + sname
				+ ", t_huiFang=" + t_huiFang + ", t_fangShi=" + t_fangShi
				+ ", startt_beginTime=" + startt_beginTime
				+ ", endt_beginTime=" + endt_beginTime + ", startt_finishTime="
				+ startt_finishTime + ", endt_finishTime=" + endt_finishTime
				+ "]";
	}
	
	
	
	
	

}
