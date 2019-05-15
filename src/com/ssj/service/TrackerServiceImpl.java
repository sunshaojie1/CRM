package com.ssj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssj.dao.TrackerMapper;
import com.ssj.entity.Fenye;
import com.ssj.entity.Tracker;
@Service
public class TrackerServiceImpl implements TrackerService{
@Autowired	
private TrackerMapper trackerMapper;

@Override
public Fenye<Tracker> selectTracker(Fenye<Tracker> fenye) {
	Integer selectTrackerCount = trackerMapper.selectTrackerCount(fenye);
	List<Tracker> selectTracker = trackerMapper.selectTracker(fenye);
	fenye.setTotal(selectTrackerCount);
	fenye.setRows(selectTracker);
	return fenye;
}
	
}
