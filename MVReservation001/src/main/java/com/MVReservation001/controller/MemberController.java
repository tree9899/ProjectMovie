package com.MVReservation001.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MVReservation001.dto.MemberDto;
import com.MVReservation001.dto.ReviewDto;
import com.MVReservation001.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memsvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/memberJoinForm")
	public ModelAndView memberJoinForm() {
		System.out.println("회원가입 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberJoinForm");
		return mav;
	}
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto joinInfo, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		int joinResult = memsvc.memberJoin_svc(joinInfo);
		if(joinResult > 0 ) {
			ra.addFlashAttribute("redirectMsg", "회원가입 되었습니다.");
			mav.setViewName("redirect:/");
		} else {
			ra.addFlashAttribute("redirectMsg", "회원가입에 실패하였습니다.");
			mav.setViewName("redirect:/memberJoinForm");
		}
		return mav;
	}
	
	@RequestMapping(value = "/memberLoginForm")
	public ModelAndView memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberLoginForm");
		return mav;
	}
	
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println(mid + "::"+mpw);
		MemberDto loginInfo = memsvc.memberLogin_svc(mid, mpw);
		System.out.println(loginInfo);
		if(loginInfo == null) {
			ra.addFlashAttribute("redirectMsg", "아이디 / 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/memberLoginForm");
		} else {
			if(loginInfo.getMstate().equals("1")) {
				System.out.println("이용중지계정");
				ra.addFlashAttribute("redirectMsg", "이용중지된 계정입니다. 관리자에게 문의해주세요!");
				mav.setViewName("redirect:/");
			} else {
				session.setAttribute("loginId", loginInfo.getMid());
				session.setAttribute("loginProfile", loginInfo.getMprofile());
				ra.addFlashAttribute("redirectMsg", "로그인 되었습니다.");
				mav.setViewName("redirect:/");		
			}
		}
		return mav;
	}	
	
	@RequestMapping(value = "/memberLogout")
	public ModelAndView membeLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		
		ra.addFlashAttribute("redirectMsg", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping(value = "/reserveList")
	public ModelAndView reserveList(RedirectAttributes ra) {
		System.out.println("예매내역 조회 요청");
		ModelAndView mav = new ModelAndView();

		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null) {
			ra.addFlashAttribute("redirectMsg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/memberLoginForm");
			return mav;
		}
		
		ArrayList< Map<String, String> > reserveList = memsvc.getReserveList(loginId);
		mav.addObject("reList", reserveList);
		mav.setViewName("member/ReserveList");
		
		return mav;
	}
	@RequestMapping(value = "/reserveCancel")
	public ModelAndView reserveCancel(String recode, RedirectAttributes ra) {
		System.out.println("예매 취소 요청");
		ModelAndView mav = new ModelAndView();
		
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null) {
			ra.addFlashAttribute("redirectMsg", "로그인 후 이용가능합니다.");
			mav.setViewName("redirect:/memberLoginForm");
			return mav;
		}
		
		int result = memsvc.reserveCancel_svc(recode);
		if(result > 0) {
			ra.addFlashAttribute("redirectMsg", "예매가 취소 되었습니다.");
		} else {
			ra.addFlashAttribute("redirectMsg", "예매취소 처리에 실패하였습니다.");
		}
		mav.setViewName("redirect:/reserveList");
		return mav;
	}
	
	
	@RequestMapping(value = "/reviewForm")
	public ModelAndView reviewForm(String recode) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/ReviewForm");
		return mav;
	}
	
	
	@RequestMapping(value = "/reviewWrite")
	public @ResponseBody String reviewWrite(ReviewDto review) {
		System.out.println("관람평 등록 요청");
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null) {
			return "N_login";
		}
		review.setRvmid(loginId);
		String writeResult = memsvc.reviewWrite_svc(review);
		
		return writeResult;
	}	
	@RequestMapping(value = "/reviewView")
	public ModelAndView reviewView(String rvrecode) {
		System.out.println("관람평 확인 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		
		ReviewDto review = memsvc.reviewView_svc(rvrecode);
		
		mav.addObject("review", review);
		mav.setViewName("member/ReviewView");
		return mav;
	}	
}
