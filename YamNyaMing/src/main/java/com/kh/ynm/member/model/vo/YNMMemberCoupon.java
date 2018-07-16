package com.kh.ynm.member.model.vo;

public class YNMMemberCoupon {
	private int couponNo;
	private int memberEntireNo;
	private int couponInfoNo;
	
	
	
	public YNMMemberCoupon() {
		super();
	}
	public YNMMemberCoupon(int couponNo, int memberEntireNo, int couponInfoNo) {
		super();
		this.couponNo = couponNo;
		this.memberEntireNo = memberEntireNo;
		this.couponInfoNo = couponInfoNo;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntireNo) {
		this.memberEntireNo = memberEntireNo;
	}
	public int getCouponInfoNo() {
		return couponInfoNo;
	}
	public void setCouponInfoNo(int couponInfoNo) {
		this.couponInfoNo = couponInfoNo;
	}
	
	
}
