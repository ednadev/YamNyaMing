package com.kh.ynm.member.model.vo;

public class YNMFollow {
	private int followNo;
	private int followMemberIdNo;
	private int followerNo;
	
	
	public YNMFollow() {
		super();
	}
	public YNMFollow(int followNo, int followMemberIdNo, int followerNo) {
		super();
		this.followNo = followNo;
		this.followMemberIdNo = followMemberIdNo;
		this.followerNo = followerNo;
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
	public int getFollowerNo() {
		return followerNo;
	}
	public void setFollowerNo(int followerNo) {
		this.followerNo = followerNo;
	}
	
	
}
