package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMStoreReview {
	private int storeReviewNo;
	private int ownerStoreEntireNo;
	private int memberEntireNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewStar;
	private char jjimCheck;
	private Date reviewDate;
	private char reviewOpenCheck;
	private String reviewImgList;
	public int getStoreReviewNo() {
		return storeReviewNo;
	}
	public void setStoreReviewNo(int storeReviewNo) {
		this.storeReviewNo = storeReviewNo;
	}
	public int getOwnerEntireNo() {
		return ownerStoreEntireNo;
	}
	public void setOwnerEntireNo(int ownerEntireNo) {
		this.ownerStoreEntireNo = ownerEntireNo;
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
	public char getReviewOpenCheck() {
		return reviewOpenCheck;
	}
	public void setReviewOpenCheck(char reviewOpenCheck) {
		this.reviewOpenCheck = reviewOpenCheck;
	}
	public String getReviewImgList() {
		return reviewImgList;
	}
	public void setReviewImgList(String reviewImgList) {
		this.reviewImgList = reviewImgList;
	}
	
	
	
	
	

}