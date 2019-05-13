package com.ssj.entity;

import org.springframework.stereotype.Component;

@Component
//跟踪表
public class Tracher {
	private Integer t_id;//
	private String t_useryId;//跟踪者id
	private String t_stuId;//被跟踪学生id
	private String t_beginTime;//跟踪开始时间
	private String t_finishTime;//跟踪结束时间
	private String t_huiFang;//回访情况
	private String t_fangShi;//跟踪方式
	
}
