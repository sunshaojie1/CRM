package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
//���ٱ�
public class Tracker {
	private Integer t_id;//
	private String t_useryId;//������id
	private String t_stuId;//������ѧ��id
	private String t_beginTime;//���ٿ�ʼʱ��
	private String t_finishTime;//���ٽ���ʱ��
	private String t_huiFang;//�ط����
	private String t_fangShi;//���ٷ�ʽ
	private Student student;
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getT_useryId() {
		return t_useryId;
	}
	public void setT_useryId(String t_useryId) {
		this.t_useryId = t_useryId;
	}
	public String getT_stuId() {
		return t_stuId;
	}
	public void setT_stuId(String t_stuId) {
		this.t_stuId = t_stuId;
	}
	public String getT_beginTime() {
		return t_beginTime;
	}
	public void setT_beginTime(String t_beginTime) {
		this.t_beginTime = t_beginTime;
	}
	public String getT_finishTime() {
		return t_finishTime;
	}
	public void setT_finishTime(String t_finishTime) {
		this.t_finishTime = t_finishTime;
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
	public void setT_fangShi(String t_fangShi) {
		this.t_fangShi = t_fangShi;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	@Override
	public String toString() {
		return "Tracker [t_id=" + t_id + ", t_useryId=" + t_useryId
				+ ", t_stuId=" + t_stuId + ", t_beginTime=" + t_beginTime
				+ ", t_finishTime=" + t_finishTime + ", t_huiFang=" + t_huiFang
				+ ", t_fangShi=" + t_fangShi + ", student=" + student + "]";
	}
	
	
	
	
}
