package com.ssj.service;

import java.util.List;

import com.ssj.entity.Fenye;
import com.ssj.entity.Student;
import com.ssj.entity.Tracker;

public interface TrackerService {
	//��ҳ��ѯ
	Fenye<Tracker> selectTracker(Fenye<Tracker> fenye);
	
	
}
