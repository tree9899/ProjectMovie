package com.MVReservation001.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MVReservation001.dao.TheaterDao;
import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;
import com.google.gson.Gson;

@Service
public class TheaterService {

	@Autowired
	private TheaterDao thdao;
	
	public ArrayList<TheaterDto> getTheaterList() {
		System.out.println("SERVICE 극장목록 조회");
		ArrayList<TheaterDto> thlist = thdao.selectTheaterList();
		return thlist;
	}

	public TheaterDto getTheaterInfo(String thcode) {
		System.out.println("SERVICE 극장상세 정보 조회");
		TheaterDto thinfo = thdao.selectTheaterInfo(thcode);
		return thinfo;
	}

	public ArrayList<ScheduleDto> getTheaterScheduleDateList(String thcode) {
		System.out.println("SERVICE 극장 상세 날짜 조회");
		ArrayList<ScheduleDto> scList = thdao.selectTheaterSchedulesList(thcode);
		
		
		return scList;
	}

	public String getTheaterMovieSchedule_svc(String scthcode, String scdate) {
		System.out.println("SERVICE 극장 상세 영화 스케쥴 조회");
		ArrayList< Map<String, String> > scList = thdao.selectTheaterMovieSchedule(scthcode, scdate);
		System.out.println(scList);
		System.out.println( new Gson().toJson(scList)  );
		return new Gson().toJson(scList);
	}

}
