package com.MVReservation001.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MVReservation001.dto.MemberDto;
import com.MVReservation001.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService admsvc;

	
	@RequestMapping(value = "/adminMain")
	public ModelAndView adminMain() {
		System.out.println("관리자-메인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/AdminMain");
		return mav;
	}
	
	@RequestMapping(value = "/adminMembers")
	public ModelAndView adminMembers() {
		System.out.println("관리자-회원관리 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		ArrayList<MemberDto> memberList = admsvc.getMembersList();
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/AdminMembers");
		return mav;		
	}

	@RequestMapping(value = "/adminModifyMstate")
	public ModelAndView adminModifyMstate(String mid, String mstate) {
		System.out.println("관리자-회원 상태 변경 요청");
		System.out.println(mid + "::" + mstate);
		ModelAndView mav = new ModelAndView();
		int result = admsvc.modifyMemberState(mid, mstate);
		System.out.println(result);
		mav.setViewName("redirect:/adminMembers");
		return mav;			
		
	}
	
	@RequestMapping(value = "/adminGetMovieRatio")
	public @ResponseBody String adminGetMovieRatio() {
		System.out.println("관리자 영화 예매수 조회 요청");
		String mvRaioList = admsvc.getMovieRatio();
		return mvRaioList;
		
	}
	
	@RequestMapping(value = "/adminDatailMemberView")
	public ModelAndView adminDatailMemberView(String mid) {
		System.out.println("관리자 회원 상세 페이지 요청");
		ModelAndView mav = new ModelAndView();
		Map<String, String> detailMemberInfo = admsvc.getDetailMemberInfo(mid);
		
		mav.addObject("member", detailMemberInfo);
		mav.setViewName("admin/AdminDetailMemberView");
		
		return mav;
	}
	
	
}













