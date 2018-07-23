package com.kh.ynm.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class YNMMemberUploadPhoto {
	private int uploadPhotoNo;
	private int photoType;
	private String OriginName;
	private String remakeName;
	private String photoRoute;
	private Date photoUploadDate;
	private String photoViewRoute;
	
	
	
	public YNMMemberUploadPhoto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public YNMMemberUploadPhoto(int uploadPhotoNo, int photoType, String originName, String remakeName,
			String photoRoute, Date photoUploadDate, String photoViewRoute) {
		super();
		this.uploadPhotoNo = uploadPhotoNo;
		this.photoType = photoType;
		OriginName = originName;
		this.remakeName = remakeName;
		this.photoRoute = photoRoute;
		this.photoUploadDate = photoUploadDate;
		this.photoViewRoute = photoViewRoute;
	}
	public int getUploadPhotoNo() {
		return uploadPhotoNo;
	}
	public void setUploadPhotoNo(int uploadPhotoNo) {
		this.uploadPhotoNo = uploadPhotoNo;
	}
	public int getPhotoType() {
		return photoType;
	}
	public void setPhotoType(int photoType) {
		this.photoType = photoType;
	}
	public String getOriginName() {
		return OriginName;
	}
	public void setOriginName(String originName) {
		OriginName = originName;
	}
	public String getRemakeName() {
		return remakeName;
	}
	public void setRemakeName(String remakeName) {
		this.remakeName = remakeName;
	}
	public String getPhotoRoute() {
		return photoRoute;
	}
	public void setPhotoRoute(String photoRoute) {
		this.photoRoute = photoRoute;
	}
	public Date getPhotoUploadDate() {
		return photoUploadDate;
	}
	public void setPhotoUploadDate(Date photoUploadDate) {
		this.photoUploadDate = photoUploadDate;
	}
	public String getPhotoViewRoute() {
		return photoViewRoute;
	}
	public void setPhotoViewRoute(String photoViewRoute) {
		this.photoViewRoute = photoViewRoute;
	}
	
	
	
	
	
	
	
}
