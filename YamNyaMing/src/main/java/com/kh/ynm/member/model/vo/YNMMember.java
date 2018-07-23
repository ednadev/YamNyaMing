package com.kh.ynm.member.model.vo;

import java.sql.Date;

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
