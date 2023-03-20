package com.MVReservation001.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MVReservation001.dao.MemberDao;
import com.MVReservation001.dao.ReserveDao;
import com.MVReservation001.dto.MovieDto;
import com.MVReservation001.dto.ReservationDto;
import com.MVReservation001.dto.ScheduleDto;
import com.MVReservation001.dto.TheaterDto;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao redao;
	
	@Autowired
	private MemberDao memDao;	
	
	//예매페이지 - 영화 목록 조회 기능
	public ArrayList<MovieDto> getMovieList() {
		System.out.println("MovieService 영화 목록 조회");
		ArrayList<MovieDto> mvList = redao.selectMovieList();
		return mvList;
	}	

	public ArrayList<TheaterDto> getTheaterList() {
		System.out.println("MovieService 극장 목록 조회");
		ArrayList<TheaterDto> thList = redao.selectTheaterList();
		return thList;
	}
	
	public String getReTheaterList(String scmvcode) {
		System.out.println("MovieService 예매가능한 극장 목록 조회");
		ArrayList<TheaterDto> thList = redao.selectReTheaterList(scmvcode);
//		Gson gson = new Gson();
//		String json = gson.toJson(thList);
		return new Gson().toJson(thList);
	}
	
	public String getScheduleDateList(String scmvcode, String scthcode) {
		System.out.println("MovieService 예매가능한 날짜 목록 조회");
		ArrayList<ScheduleDto> dateList = redao.selectReScheDuleDateList(scmvcode, scthcode);
		return new Gson().toJson(dateList);
	}
	public String getReMovieList(String thcode) {
		System.out.println("MovieService 예매가능한 영화 목록 조회");
		ArrayList<MovieDto> mvList = redao.selectReMovieList(thcode);
		return new Gson().toJson(mvList);
	}
	public String getScheduleRoomTimeList(String scmvcode, String scthcode, String scdate) {
		System.out.println("MovieService 예매가능한 상영관 및 시간 목록 조회");
		ArrayList<ScheduleDto> roomTimeList = redao.selectReScheDuleRoomTimeList(scmvcode, scthcode, scdate);
		return new Gson().toJson(roomTimeList);
	}
	
	
	public String reserveMovie_PayReady(ReservationDto reInfo, HttpSession session) throws Exception {
		String loginId = (String)session.getAttribute("loginId");
		String recode = generateRecode(loginId, reInfo.getRethcode());
		reInfo.setRecode(recode);
		reInfo.setRemid(loginId);
		try {
			redao.insertReservation(reInfo);
		} catch (Exception e) {
			System.out.println("KAKAO결제준비 요청중 예외");
			e.printStackTrace();
			return "Fail";
		}
		
		
        StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=TC0ONETIME"); /* cid  테스트 가맹점 코드 */
        urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(recode, "UTF-8")); /* 가맹점 예매코드, 최대 100자 */
        urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8")); /* 가맹점 회원 id, 최대 100자 */
        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("영화예매테스트", "UTF-8")); /* 상품명, 최대 100자 */
        urlBuilder.append("&" + URLEncoder.encode("quantity","UTF-8") + "=" + URLEncoder.encode(reInfo.getRenumber()+"", "UTF-8")); /* 상품 수량 */
        urlBuilder.append("&" + URLEncoder.encode("total_amount","UTF-8") + "=" + URLEncoder.encode( (reInfo.getRenumber()*20000)+"", "UTF-8")); /* 상품 총액 */
        urlBuilder.append("&" + URLEncoder.encode("tax_free_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /* 상품 비과세 금액 */
        urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") 
                                + "=" + URLEncoder.encode("http://localhost:8081/controller/reserveMovie_PayApproval?recode="+recode, "UTF-8")); /* 결제 성공 시 redirect url, 최대 255자 */
        urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") 
                                + "=" + URLEncoder.encode("http://localhost:8081/controller/reserveMovie_PayCancel?recode="+recode, "UTF-8")); /* 결제 취소 시 redirect url, 최대 255자 */
        urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") 
        	                    + "=" + URLEncoder.encode("http://localhost:8081/controller/reserveMovie_PayFail?recode="+recode, "UTF-8")); /* 결제 실패 시 redirect url, 최대 255자 */        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK "+"2ddf68347d21a70b5b53b5882f920af5");
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());		
		JsonElement readyElement = JsonParser.parseString(sb.toString());
		JsonObject readyObj = readyElement.getAsJsonObject();
		String tid = readyObj.get("tid").getAsString();
		System.out.println("tid : " + tid);
		session.setAttribute("payTid", tid);
		
		String nextPcUrl = readyObj.get("next_redirect_pc_url").getAsString();
		System.out.println(nextPcUrl);
		
		return nextPcUrl;        		
		
	}
	public String reserveMovie_PayApproval(String tid, String pg_token, String recode, HttpSession session) throws Exception {
		String loginId = (String)session.getAttribute("loginId");
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/approve"); 
        urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("tid","UTF-8") + "=" + URLEncoder.encode(tid, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(recode, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("pg_token","UTF-8") + "=" + URLEncoder.encode(pg_token, "UTF-8"));		
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK "+"2ddf68347d21a70b5b53b5882f920af5");
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        String result = "Fail";
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            result = "Approval";
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            redao.deleteReservation(recode);
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());		
        if(result.equals("Approval")) {
        	String total = JsonParser.parseString(sb.toString()).getAsJsonObject().get("amount").getAsJsonObject().get("total").getAsString();
        	System.out.println("total : " + total);
        	redao.insertPayInfo(recode,tid,loginId,total);
        	
        }
		return result;
	}
	//예매코드 생성 기능
	private String generateRecode(String loginId, String scthcode) {
		int memberReserveCount = redao.selectMemberReCount(loginId)+1; // 예매자의 총예매수
		String mcode = memDao.selectMemberCode(loginId); //회원코드
		String recodeDate = new SimpleDateFormat("MMdd").format(new Date()); // 예매일
		String recode = scthcode+"-"+recodeDate+"-"+mcode+"-"+String.format("%05d", memberReserveCount);
		//T0001-1223-M0001-00001
		return recode;
	}
	

	
	
	public int deleteReserveInfo(String recode) {
		int deleteResult = redao.deleteReservation(recode);
		return deleteResult;
	}

	
	
}
