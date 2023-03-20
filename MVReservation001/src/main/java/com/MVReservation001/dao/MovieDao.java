package com.MVReservation001.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.MVReservation001.dto.MovieDto;

public interface MovieDao {


	ArrayList<MovieDto> selectMovieList_Rank();

	int selectTotalRenumber();

	MovieDto selectMovieInfo(String mvcode);

	ArrayList<Map<String, String>> selectReviewList(@Param("mvcode") String mvcode, @Param("startRow") int startRow, @Param("endRow")int endRow);

	int selectReviewCount(String mvcode);

	
}
