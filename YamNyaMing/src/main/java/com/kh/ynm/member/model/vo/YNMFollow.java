package com.kh.ynm.member.model.vo;

public class YNMFollow {
	private int followNo;
	private int followMemberIdNo;
	private int followrNo;
	
	
	public YNMFollow() {
		super();
	}
	public YNMFollow(int followNo, int followMemberIdNo, int followrNo) {
		super();
		this.followNo = followNo;
		this.followMemberIdNo = followMemberIdNo;
		this.followrNo = followrNo;
	}
	public int getFollowNo() {
		return followNo;
	}
	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}
	public int getFollowMemberIdNo() {
		return followMemberIdNo;
	}
	public void setFollowMemberIdNo(int followMemberIdNo) {
		this.followMemberIdNo = followMemberIdNo;
	}
	public int getFollowrNo() {
		return followrNo;
	}
	public void setFollowrNo(int followrNo) {
		this.followrNo = followrNo;
	}
	
	
}
