package com.MVReservation001.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MVReservation001.dto.MemberDto;
import com.MVReservation001.dto.ReviewDto;

public interface MemberDao {
	
	@Select("SELECT MCODE FROM MEMBERS WHERE MID=#{loginId}")
	String selectMemberCode(String loginId);

	int insertMemberJoin(MemberDto joinInfo);

	String selectMaxMemberCode();

	MemberDto selectMemberLogin(@Param("mid")String mid, @Param("mpw")String mpw);

	ArrayList<Map<String, String>> selectReserveList(@Param("remid") String loginId);

	int deleteReserve(String recode);

	int deletePayInfo(String recode);

	int insertReview(ReviewDto review);

	ReviewDto selectReview(String rvrecode);
	
	

}
