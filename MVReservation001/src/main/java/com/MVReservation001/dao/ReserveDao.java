package com.MVReservation001.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.ReservationDto;
import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;

public interface ReserveDao {

	@Select("SELECT * FROM MOVIES ORDER BY MVCODE")
	ArrayList<MovieDto> selectMovieList();

	@Select("SELECT * FROM THEATERS ORDER BY THCODE")
	ArrayList<TheaterDto> selectTheaterList();	
	
	@Select("SELECT MAINTH.*, SUBTH.SCTHCODE AS CHECKTH "
		  + "FROM THEATERS MAINTH "
		  + "LEFT OUTER JOIN ( SELECT SCTHCODE "
		                    + "FROM SCHEDULES "
		                    + "WHERE SCMVCODE = #{scmvcode} AND SCDATE > SYSDATE " // 
		                    + "GROUP BY SCTHCODE) SUBTH "
		  + "ON MAINTH.THCODE = SUBTH.SCTHCODE "
		  + "ORDER BY CHECKTH ")
	ArrayList<TheaterDto> selectReTheaterList(String scmvcode);
	
	@Select("SELECT MAINMV.*, SUBMV.SCMVCODE AS CHECKMV "
		  + "FROM MOVIES MAINMV "
		  + "LEFT OUTER JOIN ( SELECT SCMVCODE "
			                + "FROM SCHEDULES "
			                + "WHERE SCTHCODE = #{scthcode} AND SCDATE > SYSDATE " // 
			                + "GROUP BY SCMVCODE) SUBMV "
		  + "ON MAINMV.MVCODE = SUBMV.SCMVCODE "
		  + "ORDER BY CHECKMV ")	
	ArrayList<MovieDto> selectReMovieList(String scthcode);	



	@Select("SELECT TO_CHAR(SCDATE,'YYYY-MM-DD') AS SCDATE "
		  + "FROM SCHEDULES "
		  + "WHERE SCMVCODE = #{scmvcode} AND SCTHCODE = #{scthcode} "
		  + "AND SCDATE > SYSDATE "
		  + "GROUP BY TO_CHAR(SCDATE,'YYYY-MM-DD') "
		  + "ORDER BY SCDATE")
	ArrayList<ScheduleDto> selectReScheDuleDateList(@Param("scmvcode") String scmvcode, @Param("scthcode") String scthcode);
	
	@Select("SELECT SCROOM, TO_CHAR(SCDATE,'HH24:MI') AS SCDATE "
		  + "FROM SCHEDULES "
		  + "WHERE SCMVCODE = #{scmvcode} AND SCTHCODE = #{scthcode} "
		  + "AND TO_CHAR(SCDATE,'YYYY-MM-DD') = #{scdate}")
	ArrayList<ScheduleDto> selectReScheDuleRoomTimeList(@Param("scmvcode") String scmvcode, @Param("scthcode") String scthcode,@Param("scdate") String scdate);

	@Select("SELECT * FROM MOVIES WHERE MVCODE = #{remvcode}")
	MovieDto selectMovieInfo(String remvcode);

	
	@Select("SELECT MAX(RECODE) FROM RESERVATION")	
	String selectMaxRecode();
	
	@Insert("INSERT INTO RESERVATION(RECODE, REMID, RETHCODE, REROOM, REDATE, REMVCODE, RENUMBER) "
		  + "VALUES(#{recode}, #{remid}, #{rethcode}, #{reroom}, TO_DATE(#{redate},'YYYY-MM-DD HH24:MI'), #{remvcode}, #{renumber} )")
	int insertReservation(ReservationDto reserveInfo);

	@Delete("DELETE FROM RESERVATION WHERE RECODE = #{recode}")
	int deleteReservation(String recode);

	@Select("SELECT COUNT(*) FROM RESERVATION WHERE REMID = #{loginId}")
	int selectMemberReCount(String loginId);

	@Insert("INSERT INTO PAYINFO(RECODE, TID, MID, CANCEL_AMOUNT) "
		  + "VALUES(#{recode}, #{tid}, #{mid}, #{total} )")
	int insertPayInfo(@Param("recode") String recode, @Param("tid")String tid, @Param("mid")String loginId, @Param("total")String total);

	
}
