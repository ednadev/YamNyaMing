package com.kh.ynm.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class YNMMember {
	private int memberEntireNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNickName;
	private String memberGender;
	private Date memberBirth;
	private String memberEmail;
	private String memberPhone;
	private Date memberRegDate;
	private int memberUploadPhotoNo;
	private int followTotal;
	private int reviewTotal;
	private String photoViewRoute;
	private int jjimTotal;
	private int reservationTotal;
	private int memberPoint;
	private ArrayList<YNMMember> memberFollowingList;
	private int likeTotal;
	private int followChk=0;
	private int followerChk=0;
	private String bookDateAndTime2;
	
	
	
	
	
	public String getBookDateAndTime2() {
		return bookDateAndTime2;
	}
	public void setBookDateAndTime2(String bookDateAndTime2) {
		this.bookDateAndTime2 = bookDateAndTime2;
	}
	public int getFollowerChk() {
		return followerChk;
	}
	public void setFollowerChk(int followerChk) {
		this.followerChk = followerChk;
	}
	public int getFollowChk() {
		return followChk;
	}
	public void setFollowChk(int followChk) {
		this.followChk = followChk;
	}
	public int getLikeTotal() {
		return likeTotal;
	}
	public void setLikeTotal(int likeTotal) {
		this.likeTotal = likeTotal;
	}
	public ArrayList<YNMMember> getMemberFollowingList() {
		return memberFollowingList;
	}
	public void setMemberFollowingList(ArrayList<YNMMember> memberFollowingList) {
		this.memberFollowingList = memberFollowingList;
	}
	public int getReservationTotal() {
		return reservationTotal;
	}
	public void setReservationTotal(int reservationTotal) {
		this.reservationTotal = reservationTotal;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public int getJjimTotal() {
		return jjimTotal;
	}
	public void setJjimTotal(int jjimTotal) {
		this.jjimTotal = jjimTotal;
	}
	public String getPhotoViewRoute() {
		return photoViewRoute;
	}
	public void setPhotoViewRoute(String photoViewRoute) {
		this.photoViewRoute = photoViewRoute;
	}
	public int getFollowTotal() {
		return followTotal;
	}
	public void setFollowTotal(int followTotal) {
		this.followTotal = followTotal;
	}
	public int getReviewTotal() {
		return reviewTotal;
	}
	public void setReviewTotal(int reviewTotal) {
		this.reviewTotal = reviewTotal;
	}
	public int getMemberUploadPhotoNo() {
		return memberUploadPhotoNo;
	}
	public void setMemberUploadPhotoNo(int memberUploadPhotoNo) {
		this.memberUploadPhotoNo = memberUploadPhotoNo;
	}
	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntire) {
		this.memberEntireNo = memberEntire;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public Date getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getMemberRegDate() {
		return memberRegDate;
	}
	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	
}
