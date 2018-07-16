package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMStoreReview {
	private int storeReviewNo;
	private int ownerEntireNo;
	private int memberEntireNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewStar;
	private char jjimCheck;
	private Date reviewDate;
	private String reviewOpenCheck;
	
	
	
	
	public YNMStoreReview() {
		super();
	}
	public YNMStoreReview(int storeReviewNo, int ownerEntireNo, int memberEntireNo, String reviewTitle,
			String reviewContent, String reviewStar, char jjimCheck, Date reviewDate, String reviewOpenCheck) {
		super();
		this.storeReviewNo = storeReviewNo;
		this.ownerEntireNo = ownerEntireNo;
		this.memberEntireNo = memberEntireNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.jjimCheck = jjimCheck;
		this.reviewDate = reviewDate;
		this.reviewOpenCheck = reviewOpenCheck;
	}
	public int getStoreReviewNo() {
		return storeReviewNo;
	}
	public void setStoreReviewNo(int storeReviewNo) {
		this.storeReviewNo = storeReviewNo;
	}
	public int getOwnerEntireNo() {
		return ownerEntireNo;
	}
	public void setOwnerEntireNo(int ownerEntireNo) {
		this.ownerEntireNo = ownerEntireNo;
	}
	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntireNo) {
		this.memberEntireNo = memberEntireNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public char getJjimCheck() {
		return jjimCheck;
	}
	public void setJjimCheck(char jjimCheck) {
		this.jjimCheck = jjimCheck;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewOpenCheck() {
		return reviewOpenCheck;
	}
	public void setReviewOpenCheck(String reviewOpenCheck) {
		this.reviewOpenCheck = reviewOpenCheck;
	}
	
	
}
