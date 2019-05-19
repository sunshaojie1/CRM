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
	private Student student; 
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
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

	private String u_loginName;
	private String u_isLockout;

	private String u_isQianDao;
	private String u_clockinTime;//´ò¿¨ÉÏ°à
	private String u_clockoutTime;//´ò¿¨ÏÂ°à 
	


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
	
	public Fenye() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getStartstu_creatorTime() {
		return startstu_creatorTime;
	}
	public void setStartstu_creatorTime(String startstu_creatorTime) {
		this.startstu_creatorTime = startstu_creatorTime;
	}
	public String getEddstu_creatorTime() {
		return eddstu_creatorTime;
	}
	public void setEddstu_creatorTime(String eddstu_creatorTime) {
		this.eddstu_creatorTime = eddstu_creatorTime;
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
	public String getT_fangShi() {
		return t_fangShi;
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
	public void setT_fangShi(String t_fangShi) {
		this.t_fangShi = t_fangShi;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total="
				+ total + ", rows=" + rows + ", usery=" + usery + ", student="
				+ student + ", stu_name=" + stu_name + ", stu_phone="
				+ stu_phone + ", stu_money=" + stu_money + ", stu_youXiao="
				+ stu_youXiao + ", stu_huiFang=" + stu_huiFang + ", stu_qq="
				+ stu_qq + ", stu_creatorTime=" + stu_creatorTime
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", startstu_creatorTime=" + startstu_creatorTime
				+ ", eddstu_creatorTime=" + eddstu_creatorTime
				+ ", u_loginName=" + u_loginName + ", u_isLockout="
				+ u_isLockout + ", u_isQianDao=" + u_isQianDao
				+ ", u_clockinTime=" + u_clockinTime + ", u_clockoutTime="
				+ u_clockoutTime + ", startcreatorTime=" + startcreatorTime
				+ ", endcreatorTime=" + endcreatorTime + ", sname=" + sname
				+ ", t_huiFang=" + t_huiFang + ", t_fangShi=" + t_fangShi
				+ ", startt_beginTime=" + startt_beginTime
				+ ", endt_beginTime=" + endt_beginTime + ", startt_finishTime="
				+ startt_finishTime + ", endt_finishTime=" + endt_finishTime
				+ "]";
	}
	


}
