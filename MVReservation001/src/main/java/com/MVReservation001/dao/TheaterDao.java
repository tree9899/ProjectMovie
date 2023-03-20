package com.MVReservation001.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;

public interface TheaterDao {

	ArrayList<TheaterDto> selectTheaterList();

	TheaterDto selectTheaterInfo(String thcode);

	ArrayList<ScheduleDto> selectTheaterSchedulesList(String thcode);

	ArrayList<Map<String, String>> selectTheaterMovieSchedule(@Param("scthcode") String scthcode, @Param("scdate") String scdate);

}
