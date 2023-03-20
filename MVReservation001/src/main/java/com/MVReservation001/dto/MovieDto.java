package com.MVReservation001.dto;

public class MovieDto {
	private String mvcode;	//영화코드
	private String mvtitle;	//영화제목
	private String mvdir;	//영화감독
	private String mvact;	//출연배우
	private String mvgenre;	//영화장르
	private String mvinfo;	//기본정보
	private String mvdate;	//개봉일
	private String mvpos;	//포스터
	
	private String recount;    //현재 영화의 예매수
	public String getRecount() {
		return recount;
	}
	public void setRecount(String recount) {
		this.recount = recount;
	}
	
	
	
	
	private String checkmv;
	public String getCheckmv() {
		return checkmv;
	}
	public void setCheckmv(String checkmv) {
		this.checkmv = checkmv;
	}
	
	public String getMvcode() {
		return mvcode;
	}
	public void setMvcode(String mvcode) {
		this.mvcode = mvcode;
	}
	public String getMvtitle() {
		return mvtitle;
	}
	public void setMvtitle(String mvtitle) {
		this.mvtitle = mvtitle;
	}
	public String getMvdir() {
		return mvdir;
	}
	public void setMvdir(String mvdir) {
		this.mvdir = mvdir;
	}
	public String getMvact() {
		return mvact;
	}
	public void setMvact(String mvact) {
		this.mvact = mvact;
	}
	public String getMvgenre() {
		return mvgenre;
	}
	public void setMvgenre(String mvgenre) {
		this.mvgenre = mvgenre;
	}
	public String getMvinfo() {
		return mvinfo;
	}
	public void setMvinfo(String mvinfo) {
		this.mvinfo = mvinfo;
	}
	public String getMvdate() {
		return mvdate;
	}
	public void setMvdate(String mvdate) {
		this.mvdate = mvdate;
	}
	public String getMvpos() {
		return mvpos;
	}
	public void setMvpos(String mvpos) {
		this.mvpos = mvpos;
	}
	@Override
	public String toString() {
		return "MovieDto [mvcode=" + mvcode + ", mvtitle=" + mvtitle + ", mvdir=" + mvdir + ", mvact=" + mvact
				+ ", mvgenre=" + mvgenre + ", mvinfo=" + mvinfo + ", mvdate=" + mvdate + ", mvpos=" + mvpos
				+ ", recount=" + recount + "]";
	}

}
