package com.MVReservation001.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.ReservationDto;
import com.MVReservation001.dto.TheaterDto;
import com.MVReservation001.service.MovieService;
import com.MVReservation001.service.ReserveService;
import com.google.gson.Gson;

@Controller
public class ReserveController {
	@Autowired
	private MovieService mvsvc;
	
	@Autowired
	private ReserveService resvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/ticketPage")
	public ModelAndView ticketPage() {
		System.out.println("예매 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		
		//영화목록조회
		ArrayList<MovieDto> mvList = resvc.getMovieList();
		mav.addObject("mvList", mvList);
		
		//극장목록조회
		ArrayList<TheaterDto> thList = resvc.getTheaterList();
		mav.addObject("thList", thList);
		
		mav.setViewName("movie/Ticket");
		return mav;
	}
	
	@RequestMapping(value = "/getReTheaterList")
	public @ResponseBody String getReTheaterList(String mvcode) {
		System.out.println("ajax_예매가능한 극장 목록 조회 요청");
		String thList = resvc.getReTheaterList(mvcode);
		return thList;
	}
	
	@RequestMapping(value = "/getReMovieList")
	public @ResponseBody String getReMovieList(String thcode) {
		System.out.println("ajax_예매가능한 영화 목록 조회 요청");
		String mvList = resvc.getReMovieList(thcode);
		return mvList;
	}	

	
	
	@RequestMapping(value = "/getScheduleDateList")
	public @ResponseBody String getScheduleDateList(String scmvcode,String scthcode) {
		System.out.println("ajax_예매가능한 날짜 목록 조회 요청");
		System.out.println("선택한 영화코드 : " + scmvcode);
		System.out.println("선택한 극장코드 : " + scthcode);
		String dateList = resvc.getScheduleDateList(scmvcode, scthcode);
		return dateList;
	}
	
	@RequestMapping(value = "/getScheduleRoomTimeList")
	public @ResponseBody String getScheduleRoomTimeList(String scmvcode,String scthcode, String scdate) {
		System.out.println("ajax_예매가능한 상영관 및 시간 목록 조회 요청");
		System.out.println("선택한 영화코드 : " + scmvcode);
		System.out.println("선택한 극장코드 : " + scthcode);
		System.out.println("선택한 날짜 : " + scdate);
		String roomTimeList = resvc.getScheduleRoomTimeList(scmvcode, scthcode, scdate);
		return roomTimeList;		
	}	
	
	@RequestMapping(value = "/reserveMovie_PayReady")
	public @ResponseBody String reserveMovie_PayReady(ReservationDto reInfo) throws Exception {
		System.out.println("ajax_영화예매_결제준비 요청");
		//결제 QR코드 페이지 URL
		String nextUrl = resvc.reserveMovie_PayReady(reInfo,session);
		
		return nextUrl;
	}

	@RequestMapping(value = "/reserveMovie_PayApproval")
	public ModelAndView reserveMovie_PayApproval(String pg_token, String recode) throws Exception {
		System.out.println("ajax_영화예매_결제승인 요청");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pg_token : " + pg_token);
		String tid = (String)session.getAttribute("payTid");
		System.out.println("tid : " + tid);
		
		String reserveResult = resvc.reserveMovie_PayApproval(tid, pg_token, recode,session);
		
		session.removeAttribute("payTid");
		
		mav.addObject("reserveResult", reserveResult); // Approval, Fail
		mav.setViewName("movie/Ticket_PayResult");
		return mav;
	}	
	
	
	@RequestMapping(value = "/reserveMovie_PayCancel")
	public ModelAndView reserveMovie_PayCancel(String recode) throws Exception {
		System.out.println("ajax_영화예매_결제취소");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("payTid");
		int deleteReserve = resvc.deleteReserveInfo(recode);
		mav.addObject("reserveResult", "Cancel");
		mav.setViewName("movie/Ticket_PayResult");
		return mav;
	}		
	
	@RequestMapping(value = "/reserveMovie_PayFail")
	public ModelAndView reserveMovie_PayFail(String recode) throws Exception {
		System.out.println("ajax_영화예매_결제실패");
		ModelAndView mav = new ModelAndView();
		int deleteReserve = resvc.deleteReserveInfo(recode);
		session.removeAttribute("payTid");
		mav.addObject("reserveResult", "Fail");
		mav.setViewName("movie/Ticket_PayResult");
		return mav;
	}	
	
	@RequestMapping(value = "/getAllMovieList")
	public @ResponseBody String getAllMovieList() {
		ArrayList<MovieDto> allMvList = resvc.getMovieList();
		return new Gson().toJson(allMvList);
	}

	@RequestMapping(value = "/getAllTheaterList")
	public @ResponseBody String getAllTheaterList() {
		ArrayList<TheaterDto> allThList = resvc.getTheaterList();
		return new Gson().toJson(allThList);
	}	
		
	
	
}
