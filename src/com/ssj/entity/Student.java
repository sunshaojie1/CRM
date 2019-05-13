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
}
