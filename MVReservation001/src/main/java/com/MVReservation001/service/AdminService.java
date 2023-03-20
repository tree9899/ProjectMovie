package com.MVReservation001.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MVReservation001.dao.AdminDao;
import com.MVReservation001.dto.MemberDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	@Autowired
	private AdminDao admdao;
	
	public ArrayList<MemberDto> getMembersList() {
		
		ArrayList<MemberDto> memberList = admdao.selectMembersList();
		
		return memberList;
	}

	public int modifyMemberState(String mid, String mstate) {
		int modifyResult = admdao.updateMemberState(mid, mstate);
		if(mstate.equals("1")) {
			//UPDATE MEMBERS SET MSTATE = '0' WHERE MID = ?;
		} else {
			//UPDATE MEMBERS SET MSTATE = '1' WHERE MID = ?;
		}
		
		return modifyResult;
	}

	public String getMovieRatio() {
		System.out.println("SERVICE 영화 예매수 조회");
		
		ArrayList< Map<String, String> > mvList = admdao.selectMovieRatio();
		
		return new Gson().toJson(mvList);
	}

	public Map<String, String> getDetailMemberInfo(String mid) {
		System.out.println("ADMIN SERVICE 회원 상세 정보 조회");
		Map<String, String> memInfo = admdao.selectDetailMemberInfo(mid);
		System.out.println(memInfo);
		return memInfo;
	}

}












