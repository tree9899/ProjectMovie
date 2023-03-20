package com.MVReservation001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;

public interface MainDao {

	@Select("SELECT MVTITLE "
			  + "FROM MOVIES "
			  + "WHERE MVTITLE = #{mvtitle}")
	String selectCheckMovie(String mvtitle);
	

	@Select("SELECT MAX(MVCODE) "
			  + "FROM MOVIES")
	String selectMaxMvcode();

	@Insert("INSERT INTO MOVIES(MVCODE, MVTITLE, MVDIR, MVACT, MVGENRE, MVINFO, MVDATE, MVPOS) "
			  + "VALUES(#{mvcode}, #{mvtitle}, #{mvdir}, #{mvact}, #{mvgenre}, #{mvinfo}, TO_DATE(#{mvdate},'YYYY.MM.DD'), #{mvpos} ) ")
	int insertMovie(MovieDto movie);
	
	@Select("SELECT THCODE FROM THEATERS WHERE THCODE = #{cgvThCode}")
	String selectCheckTheater(String cgvThCode);	
	
	
	@Insert("INSERT INTO THEATERS(THCODE, THNAME, THADDR, THTEL) "
		  + "VALUES(#{thcode}, #{thname},#{thaddr},#{thtel} ) ")
	int insertTheater(TheaterDto theater);
	
	@Select("SELECT * FROM THEATERS ORDER BY THCODE")
	ArrayList<TheaterDto> selectTheaterList();
	
	@Select("SELECT MVCODE FROM MOVIES WHERE MVTITLE = #{mvtitle}")
	String selectMvcode(String mvtitle);

	@Insert("INSERT INTO SCHEDULES(SCMVCODE, SCTHCODE, SCROOM, SCDATE) "
		  + "VALUES(#{scmvcode}, #{scthcode}, #{scroom}, TO_DATE(#{scdate},'YYYYMMDD HH24:MI')  ) ")
	int insertSchedule(ScheduleDto schedule);
	
}
