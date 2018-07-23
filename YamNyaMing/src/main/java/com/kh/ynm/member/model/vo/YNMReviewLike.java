package com.kh.ynm.member.model.vo;

public class YNMReviewLike {
	private int reviewLikeNo;
	private int storeReviewNo;
	private int memberEntireNo;
	
	
	
	public YNMReviewLike() {
		super();
	}
	public YNMReviewLike(int reviewLikeNo, int storeReviewNo, int memberEntireNo) {
		super();
		this.reviewLikeNo = reviewLikeNo;
		this.storeReviewNo = storeReviewNo;
		this.memberEntireNo = memberEntireNo;
	}
	public int getReviewLikeNo() {
		return reviewLikeNo;
	}
	public void setReviewLikeNo(int reviewLikeNo) {
		this.reviewLikeNo = reviewLikeNo;
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
