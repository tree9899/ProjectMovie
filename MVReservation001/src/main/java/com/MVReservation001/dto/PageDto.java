package com.MVReservation001.dto;

public class PageDto {
	
	private int reviewPage;    // 현재 페이지 번호
	private int startPageNum;  // 시작 페이지 번호
	private int endPageNum;    // 끝 페이지 번호
	private int maxPageNum;    // 최대 페이지 번호
	
	public int getReviewPage() {
		return reviewPage;
	}
	public void setReviewPage(int reviewPage) {
		this.reviewPage = reviewPage;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getMaxPageNum() {
		return maxPageNum;
	}
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	@Override
	public String toString() {
		return "PageDto [reviewPage=" + reviewPage + ", startPageNum=" + startPageNum + ", endPageNum=" + endPageNum
				+ ", maxPageNum=" + maxPageNum + "]";
	}
	
	
	
}
