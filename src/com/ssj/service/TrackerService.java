package com.ssj.service;

import com.ssj.entity.Fenye;
import com.ssj.entity.Tracker;

public interface TrackerService {
	//��ҳ��ѯ
	Fenye<Tracker> selectTracker(Fenye<Tracker> fenye);
}
