package com.MVReservation001.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.MVReservation001.dao.MemberDao;
import com.MVReservation001.dto.MemberDto;
import com.MVReservation001.dto.ReviewDto;

@Service
public class MemberService {
	@Autowired
	private ServletContext context;
	
	@Autowired
	private MemberDao memdao;
	
	public int memberJoin_svc(MemberDto joinInfo) throws IllegalStateException, IOException {
		String mcode = memdao.selectMaxMemberCode();
		if(mcode == null) {
			mcode = "M0001";
		} else {
			mcode =  "M" + String.format("%04d", Integer.parseInt( mcode.replace("M", "") ) +1 ) ;
		}
		joinInfo.setMcode(mcode);
		MultipartFile mfile = joinInfo.getMfile();
		String mprofile = "";
		if(mfile.isEmpty()) {
			// 프로필 이미지 파일을 업로드 하지 않았을 경우
			System.out.println("첨부파일 없음");
		} else {
			//파일을 업로드 했을 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			mprofile = uuid.toString() + "_" + mfile.getOriginalFilename();
			// 파일 저장
			// 1. 파일을 저장할 경로
			String savePath = context.getRealPath("resources\\memberProfile");
			System.out.println(savePath);
			// 2. 파일저장기능 호출
			File file = new File(savePath,mprofile);
			mfile.transferTo(file);
		}
		System.out.println("mprofile : " + mprofile);
		joinInfo.setMprofile(mprofile);
		int insertResult = 0;
		try {
			insertResult = memdao.insertMemberJoin(joinInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 처리중 예외");
		}
		return insertResult;
	}

	public MemberDto memberLogin_svc(String mid, String mpw) {
		MemberDto loginInfo = memdao.selectMemberLogin(mid, mpw);
		return loginInfo;
	}

	public ArrayList<Map<String, String>> getReserveList(String loginId) {
		System.out.println("SERVICE 예매내역 조회");
		ArrayList<Map<String, String>> reserveList = memdao.selectReserveList(loginId);
		System.out.println(reserveList);
		return reserveList;
	}

	public int reserveCancel_svc(String recode) {
		System.out.println("SERVICE 예매 취소");
		int deleteResult = 0;
		try {
			deleteResult = memdao.deletePayInfo(recode);
			deleteResult = memdao.deleteReserve(recode);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("\n예매 취소 예외");
		}
		
		return deleteResult;
	}

	public String reviewWrite_svc(ReviewDto review) {
		int insertResult = 0;
		try {
			insertResult = memdao.insertReview(review);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("\n관람평 등록 처리 예외");
		}
		return insertResult+"";
	}

	public ReviewDto reviewView_svc(String rvrecode) {
		System.out.println("관람평 정보 조회");
		
		ReviewDto review = memdao.selectReview(rvrecode);
		
		return review;
	}

}








