package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMMember {
	private int memberEntire;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNickName;
	private String memberGender;
	private Date memberBirth;
	private String memberEmail;
	private String memberPhone;
	private Date memberRegDate;
	private String memberAvatar;

	public YNMMember() {
		super();
	}

	public YNMMember(int memberEntire, String memberId, String memberPw, String memberName, String memberNickName,
			String memberGender, Date memberBirth, String memberEmail, String memberPhone, Date memberRegDate,
			String memberAvatar) {
		super();
		this.memberEntire = memberEntire;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNickName = memberNickName;
		this.memberGender = memberGender;
		this.memberBirth = memberBirth;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberRegDate = memberRegDate;
		this.memberAvatar = memberAvatar;
	}
	
	public int getMemberEntire() {
		return memberEntire;
	}
	public void setMemberEntire(int memberEntire) {
		this.memberEntire = memberEntire;
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
	public String getMemberAvatar() {
		return memberAvatar;
	}
	public void setMemberAvatar(String memberAvatar) {
		this.memberAvatar = memberAvatar;
	}
	
	
}
