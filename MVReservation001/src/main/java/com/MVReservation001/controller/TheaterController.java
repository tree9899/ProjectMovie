package com.MVReservation001.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;
import com.MVReservation001.service.TheaterService;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService thsvc;
	
	
	@RequestMapping(value = "/theaterList")
	public ModelAndView theaterList(String thcode) {
		System.out.println("극장 목록 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		//
		ArrayList<TheaterDto> thList = thsvc.getTheaterList();
		
		if(thList.size() <= 0) {
			System.out.println("극장목록 없음");
			mav.setViewName("redirect:/");
			return mav;
		}
		mav.addObject("thList", thList);
		
		TheaterDto thInfo = null;
		System.out.println("thcode : " + thcode);
		if(thcode == null) {
			thInfo = thList.get(0);
		} else {
			thInfo = thsvc.getTheaterInfo(thcode);
		}
		mav.addObject("thInfo", thInfo);
		
		
		ArrayList<ScheduleDto> scheduleList = thsvc.getTheaterScheduleDateList(thInfo.getThcode());
		mav.addObject("dateList", scheduleList);
		
		
		mav.setViewName("movie/TheaterList");
		return mav;
	}
	
	@RequestMapping(value = "/getTheaterMovieSchedule")
	public @ResponseBody String getTheaterMovieSchedule(String scthcode, String scdate) {
		System.out.println("극장코드 : " + scthcode);
		System.out.println("날짜 : " + scdate);
		
		String scList = thsvc.getTheaterMovieSchedule_svc(scthcode, scdate);
		
		return scList;
	}
	
	
}
