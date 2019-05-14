package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
	private Integer stu_id;//学生id
	private String stu_name;//学生姓名
	private Integer stu_sex;//性别
	private Integer stu_age;//年龄
	private String stu_phone;//电话
	private String stu_state;//个人状态
	private String stu_xueLi;//学历=下拉框
	private String stu_quDao;//来源渠道,下拉框
	private String stu_wangZhan;//来源网站,下拉框
	private String stu_guanZhu;//学员关注-下拉框
	private String stu_guanJian;//来源关键词
	private String stu_wx;//微信号
	private String stu_qq;//QQ号
	private String stu_baoBei;//是否报备下拉框
	private String stu_beiZhu;//在线备注
	private String stu_useryId;//员工id
	private Integer stu_youXiao;//是否有效
	private String stu_wuXiaoYuanYin;//无效原因
	private Integer stu_huiFang;//是否回访
	private String stu_creatorTime;//创建时间
	private Integer stu_visit;//是否上门
	private String stu_visitTime;//上门时间
	private String stu_payTime;//首次回访时间
	private Integer stu_money;//是否缴费
	private String stu_moneyTime;//缴费时间
	private Integer stu_jinE;//缴费金额
	private Integer stu_tui;//是否退费
	private String stu_tuiYin;//退费原因
	private Integer stu_dingJinE;//定金金额
	private String stu_dingTime;//定金时间
	private Integer stu_class;//是否进班
	private String stu_classTime;//进班时间
	private String stu_classBeiZhu;//进班备注
	private String stu_ziXun;//咨询姓名
	private String stu_ziXunBeiZhu;//咨询师备注
	private String stu_quYu;//所在区域
	private String stu_buMen;//来源部门
	private String stu_keCheng;//课程方向
	private String stu_daFen;//打分
	private String stu_luRu;//录入人 
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public Integer getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(Integer stu_sex) {
		this.stu_sex = stu_sex;
	}
	public Integer getStu_age() {
		return stu_age;
	}
	public void setStu_age(Integer stu_age) {
		this.stu_age = stu_age;
	}
	public String getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public String getStu_state() {
		return stu_state;
	}
	public void setStu_state(String stu_state) {
		this.stu_state = stu_state;
	}
	public String getStu_xueLi() {
		return stu_xueLi;
	}
	public void setStu_xueLi(String stu_xueLi) {
		this.stu_xueLi = stu_xueLi;
	}
	public String getStu_quDao() {
		return stu_quDao;
	}
	public void setStu_quDao(String stu_quDao) {
		this.stu_quDao = stu_quDao;
	}
	public String getStu_wangZhan() {
		return stu_wangZhan;
	}
	public void setStu_wangZhan(String stu_wangZhan) {
		this.stu_wangZhan = stu_wangZhan;
	}
	public String getStu_guanZhu() {
		return stu_guanZhu;
	}
	public void setStu_guanZhu(String stu_guanZhu) {
		this.stu_guanZhu = stu_guanZhu;
	}
	public String getStu_guanJian() {
		return stu_guanJian;
	}
	public void setStu_guanJian(String stu_guanJian) {
		this.stu_guanJian = stu_guanJian;
	}
	public String getStu_wx() {
		return stu_wx;
	}
	public void setStu_wx(String stu_wx) {
		this.stu_wx = stu_wx;
	}
	public String getStu_qq() {
		return stu_qq;
	}
	public void setStu_qq(String stu_qq) {
		this.stu_qq = stu_qq;
	}
	public String getStu_baoBei() {
		return stu_baoBei;
	}
	public void setStu_baoBei(String stu_baoBei) {
		this.stu_baoBei = stu_baoBei;
	}
	public String getStu_beiZhu() {
		return stu_beiZhu;
	}
	public void setStu_beiZhu(String stu_beiZhu) {
		this.stu_beiZhu = stu_beiZhu;
	}
	public String getStu_useryId() {
		return stu_useryId;
	}
	public void setStu_useryId(String stu_useryId) {
		this.stu_useryId = stu_useryId;
	}
	public Integer getStu_youXiao() {
		return stu_youXiao;
	}
	public void setStu_youXiao(Integer stu_youXiao) {
		this.stu_youXiao = stu_youXiao;
	}
	public String getStu_wuXiaoYuanYin() {
		return stu_wuXiaoYuanYin;
	}
	public void setStu_wuXiaoYuanYin(String stu_wuXiaoYuanYin) {
		this.stu_wuXiaoYuanYin = stu_wuXiaoYuanYin;
	}
	public Integer getStu_huiFang() {
		return stu_huiFang;
	}
	public void setStu_huiFang(Integer stu_huiFang) {
		this.stu_huiFang = stu_huiFang;
	}
	public String getStu_creatorTime() {
		return stu_creatorTime;
	}
	public void setStu_creatorTime(String stu_creatorTime) {
		this.stu_creatorTime = stu_creatorTime;
	}
	public Integer getStu_visit() {
		return stu_visit;
	}
	public void setStu_visit(Integer stu_visit) {
		this.stu_visit = stu_visit;
	}
	public String getStu_visitTime() {
		return stu_visitTime;
	}
	public void setStu_visitTime(String stu_visitTime) {
		this.stu_visitTime = stu_visitTime;
	}
	public String getStu_payTime() {
		return stu_payTime;
	}
	public void setStu_payTime(String stu_payTime) {
		this.stu_payTime = stu_payTime;
	}
	public Integer getStu_money() {
		return stu_money;
	}
	public void setStu_money(Integer stu_money) {
		this.stu_money = stu_money;
	}
	public String getStu_moneyTime() {
		return stu_moneyTime;
	}
	public void setStu_moneyTime(String stu_moneyTime) {
		this.stu_moneyTime = stu_moneyTime;
	}
	public Integer getStu_jinE() {
		return stu_jinE;
	}
	public void setStu_jinE(Integer stu_jinE) {
		this.stu_jinE = stu_jinE;
	}
	public Integer getStu_tui() {
		return stu_tui;
	}
	public void setStu_tui(Integer stu_tui) {
		this.stu_tui = stu_tui;
	}
	public String getStu_tuiYin() {
		return stu_tuiYin;
	}
	public void setStu_tuiYin(String stu_tuiYin) {
		this.stu_tuiYin = stu_tuiYin;
	}
	public Integer getStu_dingJinE() {
		return stu_dingJinE;
	}
	public void setStu_dingJinE(Integer stu_dingJinE) {
		this.stu_dingJinE = stu_dingJinE;
	}
	public String getStu_dingTime() {
		return stu_dingTime;
	}
	public void setStu_dingTime(String stu_dingTime) {
		this.stu_dingTime = stu_dingTime;
	}
	public Integer getStu_class() {
		return stu_class;
	}
	public void setStu_class(Integer stu_class) {
		this.stu_class = stu_class;
	}
	public String getStu_classTime() {
		return stu_classTime;
	}
	public void setStu_classTime(String stu_classTime) {
		this.stu_classTime = stu_classTime;
	}
	public String getStu_classBeiZhu() {
		return stu_classBeiZhu;
	}
	public void setStu_classBeiZhu(String stu_classBeiZhu) {
		this.stu_classBeiZhu = stu_classBeiZhu;
	}
	public String getStu_ziXun() {
		return stu_ziXun;
	}
	public void setStu_ziXun(String stu_ziXun) {
		this.stu_ziXun = stu_ziXun;
	}
	public String getStu_ziXunBeiZhu() {
		return stu_ziXunBeiZhu;
	}
	public void setStu_ziXunBeiZhu(String stu_ziXunBeiZhu) {
		this.stu_ziXunBeiZhu = stu_ziXunBeiZhu;
	}
	public String getStu_quYu() {
		return stu_quYu;
	}
	public void setStu_quYu(String stu_quYu) {
		this.stu_quYu = stu_quYu;
	}
	public String getStu_buMen() {
		return stu_buMen;
	}
	public void setStu_buMen(String stu_buMen) {
		this.stu_buMen = stu_buMen;
	}
	public String getStu_keCheng() {
		return stu_keCheng;
	}
	public void setStu_keCheng(String stu_keCheng) {
		this.stu_keCheng = stu_keCheng;
	}
	public String getStu_daFen() {
		return stu_daFen;
	}
	public void setStu_daFen(String stu_daFen) {
		this.stu_daFen = stu_daFen;
	}
	public String getStu_luRu() {
		return stu_luRu;
	}
	public void setStu_luRu(String stu_luRu) {
		this.stu_luRu = stu_luRu;
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_name=" + stu_name
				+ ", stu_sex=" + stu_sex + ", stu_age=" + stu_age
				+ ", stu_phone=" + stu_phone + ", stu_state=" + stu_state
				+ ", stu_xueLi=" + stu_xueLi + ", stu_quDao=" + stu_quDao
				+ ", stu_wangZhan=" + stu_wangZhan + ", stu_guanZhu="
				+ stu_guanZhu + ", stu_guanJian=" + stu_guanJian + ", stu_wx="
				+ stu_wx + ", stu_qq=" + stu_qq + ", stu_baoBei=" + stu_baoBei
				+ ", stu_beiZhu=" + stu_beiZhu + ", stu_useryId=" + stu_useryId
				+ ", stu_youXiao=" + stu_youXiao + ", stu_wuXiaoYuanYin="
				+ stu_wuXiaoYuanYin + ", stu_huiFang=" + stu_huiFang
				+ ", stu_creatorTime=" + stu_creatorTime + ", stu_visit="
				+ stu_visit + ", stu_visitTime=" + stu_visitTime
				+ ", stu_payTime=" + stu_payTime + ", stu_money=" + stu_money
				+ ", stu_moneyTime=" + stu_moneyTime + ", stu_jinE=" + stu_jinE
				+ ", stu_tui=" + stu_tui + ", stu_tuiYin=" + stu_tuiYin
				+ ", stu_dingJinE=" + stu_dingJinE + ", stu_dingTime="
				+ stu_dingTime + ", stu_class=" + stu_class
				+ ", stu_classTime=" + stu_classTime + ", stu_classBeiZhu="
				+ stu_classBeiZhu + ", stu_ziXun=" + stu_ziXun
				+ ", stu_ziXunBeiZhu=" + stu_ziXunBeiZhu + ", stu_quYu="
				+ stu_quYu + ", stu_buMen=" + stu_buMen + ", stu_keCheng="
				+ stu_keCheng + ", stu_daFen=" + stu_daFen + ", stu_luRu="
				+ stu_luRu + "]";
	}
	
}
