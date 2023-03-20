package com.MVReservation001.service;


import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MVReservation001.dao.MovieDao;
import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.PageDto;

@Service
public class MovieService {
	
	@Autowired
	private MovieDao mvdao;

	public ArrayList<MovieDto> getMovieList() {
		System.out.println("SERVICE - 영화 목록 조회 기능");
		ArrayList<MovieDto> mvList = mvdao.selectMovieList_Rank();
		//전체 예매수 조회
		int totalReCount = mvdao.selectTotalRenumber();
		
		for(MovieDto mvinfo : mvList) {
			int recount = Integer.parseInt(mvinfo.getRecount());
			double rerate = ( (double)recount / totalReCount) * 100; //12.3456...
			mvinfo.setRecount( ( Math.round(rerate*10)/10.0 )+""  ); // "12.3"
		}
		System.out.println(mvList);
		return mvList;
	}

	public MovieDto getMovieInfo(String mvcode) {
		System.out.println("SERVICE - 영화 상세정보 조회 기능");
		MovieDto mvInfo = mvdao.selectMovieInfo(mvcode);
		//전체 예매수 조회
		int totalReCount = mvdao.selectTotalRenumber();
		//예매율
		int recount = Integer.parseInt(mvInfo.getRecount());
		double rerate = ( (double)recount / totalReCount) * 100; 
		mvInfo.setRecount( ( Math.round(rerate*10)/10.0 )+""  ); 
		System.out.println(mvInfo);
		
		return mvInfo;
	}

	public ArrayList<Map<String, String>> getReviewList(String mvcode, int reviewPage, int reviewPageLimit, int reviewPageNumber) {
		System.out.println("SERVICE 관람평 조회");

		int startRow = (reviewPage - 1) * reviewPageLimit + 1; 
		int endRow = reviewPage * reviewPageLimit;
		
		ArrayList<Map<String, String>> reviewList = mvdao.selectReviewList(mvcode, startRow, endRow);
		System.out.println(reviewList);
		return reviewList;
	}

	public PageDto getReviewPageInfo(String mvcode, int reviewPage, int reviewPageLimit, int reviewPageNumber) {
		System.out.println("SERVICE 관람평 페이지 정보 조회");
		//1. 해당 영화에 작성된 관람평 전체개수 
		int reviewCount = mvdao.selectReviewCount(mvcode);  
		
		//2. 페이지 번호 최대값 
		int maxPageNum = (int) Math.ceil( (double)reviewCount / reviewPageLimit );
		//3. 시작 페이지 번호
		int startPageNum = ( (int)Math.ceil( (double)reviewPage/reviewPageNumber ) - 1 ) * reviewPageNumber + 1 ;
		//4. 끝 페이지 번호
		int endPageNum = startPageNum + reviewPageNumber - 1 ; 
		if( endPageNum > maxPageNum ) {
			endPageNum = maxPageNum;
		}
		PageDto pageInfo = new PageDto();
		
		pageInfo.setReviewPage(reviewPage);
		pageInfo.setStartPageNum(startPageNum);
		pageInfo.setEndPageNum(endPageNum);
		pageInfo.setMaxPageNum(maxPageNum);
		
		return pageInfo;
	}



}







