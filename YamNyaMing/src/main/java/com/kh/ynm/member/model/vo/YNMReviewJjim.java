package com.kh.ynm.member.model.vo;

public class YNMReviewJjim {
	private int reviewJjimNo;
	private int storeReviewNo;
	private int memberEntireNo;
	
	
	
	public YNMReviewJjim() {
		super();
	}
	public YNMReviewJjim(int reviewJjimNo, int storeReviewNo, int memberEntireNo) {
		super();
		this.reviewJjimNo = reviewJjimNo;
		this.storeReviewNo = storeReviewNo;
		this.memberEntireNo = memberEntireNo;
	}
	public int getReviewJjimNo() {
		return reviewJjimNo;
	}
	public void setReviewJjimNo(int reviewJjimNo) {
		this.reviewJjimNo = reviewJjimNo;
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
	
	
}
