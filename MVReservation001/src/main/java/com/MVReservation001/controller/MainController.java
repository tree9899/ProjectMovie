package com.MVReservation001.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVReservation001.service.MainService;
import com.MVReservation001.service.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/")
	public ModelAndView MainForm() {
		System.out.println("메인페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	


	
	@Autowired
	private MainService mainsvc;
	
	@RequestMapping(value = "/addMovieList")
	public String addMovieList() throws IOException {
		System.out.println("/addMovieList 영화목록추가 요청");
		
		int insertResult = mainsvc.addMovieList();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/addTheaterList")
	public String addTheaterList() throws IOException{
		System.out.println("극장목록 추가 요청");
		int insertResult = mainsvc.addTheaterList();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/addScheduleList")
	public String addScheduleList() throws Exception{
		System.out.println("상영스케쥴 추가 요청");
		int insertResult = mainsvc.addScheduleList();
		
		return "redirect:/";
	} 
	

}















