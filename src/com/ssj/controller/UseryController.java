package com.ssj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssj.entity.Fenyea;
import com.ssj.entity.Usery;
import com.ssj.service.UserService;

@Controller
public class UseryController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private Fenyea<Usery> fenyea;
	/**
	 * ��ҳ��ѯ
	 * @param page
	 * @param rows
	 * @param usery
	 * @return
	 */
	@RequestMapping(value="/selectUsery1",method=RequestMethod.POST)
	@ResponseBody
	public Fenyea<Usery> selectUsery(Integer page,Integer rows,Usery usery){
		fenyea.setPage((page-1)*rows);
		fenyea.setPageSize(rows);
		fenyea.setT(usery);
		fenyea = userService.selectUsery(fenyea);
		return fenyea;
	}
	/**
	 * ɾ��
	 * @param u_id
	 * @return
	 */
	@RequestMapping(value="/delUsery1",method=RequestMethod.POST)
	@ResponseBody
	public Integer delUsery(Integer u_id){
		return userService.delUsery(u_id);
	}
	/**

	 * ���һ���û�
	 * @param usery
	 * @return
	 */
	@RequestMapping(value="/insertUsery1",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUsery(Usery usery){

		//��ʽ��ʱ��
			SimpleDateFormat smf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//��ȡ����ʱ��
			Date date=new Date();
		//��ʽ��ʱ��
			String time = smf.format(date);
		usery.setU_creationTime(time);
		return userService.insertUser(usery);
	}
	/**

	 * �޸��û�
	 * @param usery
	 * @return
	 */
	@RequestMapping(value="/updateUser1",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUser(Usery usery){
		
		return userService.updateUser(usery);
	}
}
