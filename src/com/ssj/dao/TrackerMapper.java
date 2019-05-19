package com.ssj.dao;

import java.util.List;




import com.ssj.entity.Fenye;
import com.ssj.entity.Tracker;

public interface TrackerMapper {
//查询总条数
Integer selectTrackerCount(Fenye fenye);	
	
//分页查询
List<Tracker> selectTracker(Fenye fenye);	
	

}
