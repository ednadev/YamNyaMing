package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMStoreUnderReview {
	private int underReviewNo;
	private int storeReviewNo;
	private int memberEntireNo;
	private String underReviewContent;
	private Date underReviewDate;
	private char reviewState;
	private String memberUploadPhotoNo;
	private String photoViewRoute;
	private String memberNickName;

	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberUploadPhotoNo() {
		return memberUploadPhotoNo;
	}
	public void setMemberUploadPhotoNo(String memberUploadPhotoNo) {
		this.memberUploadPhotoNo = memberUploadPhotoNo;
	}
	public String getPhotoViewRoute() {
		return photoViewRoute;
	}
	public void setPhotoViewRoute(String photoViewRoute) {
		this.photoViewRoute = photoViewRoute;
	}
	public YNMStoreUnderReview() {
		super();
	}
	public YNMStoreUnderReview(int underReviewNo, int storeReviewNo, int memberEntireNo, String underReviewContent,
			Date underReviewDate, char reviewState) {
		super();
		this.underReviewNo = underReviewNo;
		this.storeReviewNo = storeReviewNo;
		this.memberEntireNo = memberEntireNo;
		this.underReviewContent = underReviewContent;
		this.underReviewDate = underReviewDate;
		this.reviewState = reviewState;
	}
	public int getUnderReviewNo() {
		return underReviewNo;
	}
	public void setUnderReviewNo(int underReviewNo) {
		this.underReviewNo = underReviewNo;
	}
	public int getStoreReviewNo() {
		return storeReviewNo;
	}
	public void setStoreReviewNo(int storeReviewNo) {
		this.storeReviewNo = storeReviewNo;
	}
	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntireNo) {
		this.memberEntireNo = memberEntireNo;
	}
	public String getUnderReviewContent() {
		return underReviewContent;
	}
	public void setUnderReviewContent(String underReviewContent) {
		this.underReviewContent = underReviewContent;
	}
	public Date getUnderReviewDate() {
		return underReviewDate;
	}
	public void setUnderReviewDate(Date underReviewDate) {
		this.underReviewDate = underReviewDate;
	}
	public char getReviewState() {
		return reviewState;
	}
	public void setReviewState(char reviewState) {
		this.reviewState = reviewState;
	}
	
	
	
}
