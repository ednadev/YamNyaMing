package com.kh.ynm.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class YNMStoreReview {
	private int memberUploadPhotoNo;
	private String photoViewRoute;
	private int storeReviewNo;
	private int ownerStoreEntireNo;
	private int memberEntireNo;
	private String reviewContent;
	private int reviewStar;
	private char jjimCheck;
	private Date reviewDate;
	private char reviewOpenCheck;
	private String reviewImgList="";
	private String[] reviewImgArr;
	private int likeTotal;
	private int jjimTotal;
	private String memberNickName;
	private ArrayList<YNMFollow> followList=new ArrayList<YNMFollow>();
	private ArrayList<YNMMemberUploadPhoto> photoObjList = new ArrayList<YNMMemberUploadPhoto>();
	private int myLikeChk = 0;
	private int myJjimChk = 0;
	
	
	public int getMyJjimChk() {
		return myJjimChk;
	}
	public void setMyJjimChk(int myJjimChk) {
		this.myJjimChk = myJjimChk;
	}
	public int getMyLikeChk() {
		return myLikeChk;
	}
	public void setMyLikeChk(int myLikeChk) {
		this.myLikeChk = myLikeChk;
	}
	public ArrayList<YNMFollow> getFollowList() {
		return followList;
	}
	public void setFollowList(ArrayList<YNMFollow> followList) {
		this.followList = followList;
	}
	public int getJjimTotal() {
		return jjimTotal;
	}
	public void setJjimTotal(int jjimTotal) {
		this.jjimTotal = jjimTotal;
	}
	public int getMemberUploadPhotoNo() {
		return memberUploadPhotoNo;
	}
	public void setMemberUploadPhotoNo(int memberUploadPhotoNo) {
		this.memberUploadPhotoNo = memberUploadPhotoNo;
	}
	public String getPhotoViewRoute() {
		return photoViewRoute;
	}
	public void setPhotoViewRoute(String photoViewRoute) {
		this.photoViewRoute = photoViewRoute;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public int getLikeTotal() {
		return likeTotal;
	}
	public void setLikeTotal(int likeTotal) {
		this.likeTotal = likeTotal;
	}
	public String[] getReviewImgArr() {
		return reviewImgArr;
	}
	public void setReviewImgArr(String reviewImgArr) {
		this.reviewImgArr = reviewImgArr.split(",");
	}
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
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
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
		setReviewImgArr(this.reviewImgList);
	}
	public int getOwnerStoreEntireNo() {
		return ownerStoreEntireNo;
	}
	public void setOwnerStoreEntireNo(int ownerStoreEntireNo) {
		this.ownerStoreEntireNo = ownerStoreEntireNo;
	}
	public ArrayList<YNMMemberUploadPhoto> getPhotoObjList() {
		return photoObjList;
	}
	public void setPhotoObjList(YNMMemberUploadPhoto photoObj) {
		this.photoObjList.add(photoObj);
	}
	
	
	
	
	

}