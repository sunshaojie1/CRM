package com.ssj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Tracker;
import com.ssj.service.TrackerService;
@Controller
public class TrackerController {
@Autowired	
private Fenye<Tracker> fenye;	
@Autowired
private TrackerService trackerService;

@RequestMapping(value = "/showTracker", method = RequestMethod.POST)
@ResponseBody
public Fenye<Tracker> showT(Integer page,Integer rows,String sname,String t_huiFang,String t_fangShi,String startt_beginTime,String endt_beginTime,String startt_finishTime,String endt_finishTime){
	
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	fenye.setSname(sname);
	fenye.setT_huiFang(t_huiFang);
	fenye.setT_fangShi(t_fangShi);
	fenye.setStartt_beginTime(startt_beginTime);
	fenye.setEndt_beginTime(endt_beginTime);
	fenye.setStartt_finishTime(startt_finishTime);
	fenye.setEndt_finishTime(endt_finishTime);
	fenye=trackerService.selectTracker(fenye);
	System.out.println(fenye.getRows());
	return fenye;
	
}

}
