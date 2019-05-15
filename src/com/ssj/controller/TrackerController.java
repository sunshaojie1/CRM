package com.ssj.controller;

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
public Fenye<Tracker> showT(Integer page,Integer rows){
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);
	/*fenye.setStudent(student);*/
	fenye=trackerService.selectTracker(fenye);
	
	return fenye;
	
}
}
