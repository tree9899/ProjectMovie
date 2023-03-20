package com.MVReservation001.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDto {
	
	
	
	private String mid;
	private String mpw;
	private String mname;
	private String mbirth;
	private String maddr;
	private String memail;
	private String memailid;
	private String memaildomain;
	private MultipartFile mfile;
	private String mprofile;
	private String mstate;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMemailid() {
		return memailid;
	}
	public void setMemailid(String memailid) {
		this.memailid = memailid;
	}
	public String getMemaildomain() {
		return memaildomain;
	}
	public void setMemaildomain(String memaildomain) {
		this.memaildomain = memaildomain;
	}
	public MultipartFile getMfile() {
		return mfile;
	}
	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}
	public String getMprofile() {
		return mprofile;
	}
	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}
	public String getMstate() {
		return mstate;
	}
	public void setMstate(String mstate) {
		this.mstate = mstate;
	}
	
	private String mcode;
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mbirth=" + mbirth + ", maddr=" + maddr
				+ ", memail=" + memail + ", memailid=" + memailid + ", memaildomain=" + memaildomain + ", mfile="
				+ mfile + ", mprofile=" + mprofile + ", mstate=" + mstate + "]";
	}
	
	
	
}
