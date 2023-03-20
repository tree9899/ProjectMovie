package com.MVReservation001.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.MVReservation001.dto.MemberDto;

public interface AdminDao {

	ArrayList<MemberDto> selectMembersList();
	
	int updateMemberState(@Param("mid") String mid, @Param("mstate") String mstate);

	ArrayList<Map<String, String>> selectMovieRatio();

	Map<String, String> selectDetailMemberInfo(String mid);

}
