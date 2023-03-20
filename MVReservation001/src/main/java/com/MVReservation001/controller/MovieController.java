package com.MVReservation001.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.PageDto;
import com.MVReservation001.service.MovieService;

@Controller
public class MovieController {

	@Autowired
	private MovieService mvsvc;
	
	@RequestMapping(value = "/movieList")
	public ModelAndView movieList() {
		System.out.println("영화 목록 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<MovieDto> mvList = mvsvc.getMovieList();
		
		mav.addObject("mvList", mvList);
		mav.setViewName("movie/MovieList");
		return mav;
	}
	
	@RequestMapping(value = "/movieInfo")
	public ModelAndView movieInfo(String mvcode, @RequestParam(value = "reviewPage", defaultValue = "1") int reviewPage) {
		System.out.println("영화 상세 정보 페이지 이동요청");
		System.out.println("영화코드 : " + mvcode);
		System.out.println("관람평 페이지번호 : " + reviewPage);
		int reviewPageLimit = 2;  // 한 페이지에 보여줄 관람평의 개수
		int reviewPageNumber = 10; // 페이지 번호의 개수 
		
		ModelAndView mav = new ModelAndView();
		//영화 상세 정보 조회
		MovieDto mvInfo = mvsvc.getMovieInfo(mvcode);
		mav.addObject("mvInfo", mvInfo);
		
		//관람평 목록 조회
		ArrayList< Map<String, String> > reviewList = mvsvc.getReviewList(mvcode,reviewPage,reviewPageLimit,reviewPageNumber);
		mav.addObject("reviewList", reviewList);
		
		//관람평 페이지 정보 조회
		PageDto pageInfo = mvsvc.getReviewPageInfo(mvcode,reviewPage,reviewPageLimit, reviewPageNumber );
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName("movie/MovieInfo");
		return mav;		
		
	}
	
}
