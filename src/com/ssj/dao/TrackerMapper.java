package com.ssj.dao;

import java.util.List;




import com.ssj.entity.Fenye;
import com.ssj.entity.Tracker;

public interface TrackerMapper {
//��ѯ������
Integer selectTrackerCount(Fenye fenye);	
	
//��ҳ��ѯ
List<Tracker> selectTracker(Fenye fenye);	
	

}
