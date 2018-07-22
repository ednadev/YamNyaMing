package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class OwnerUploadPhoto {
	private int owStorePhotoPk;
	private int owPhotoTypeFk;
	private int storeInfoFk;
	private String originName;
	private String remakeName;
	private String photoRoute;
	private Date owPhotoUploadDate;
	
	public OwnerUploadPhoto() {
		
	}
	
	public OwnerUploadPhoto(int owStorePhotoPk, int owPhotoTypeFk, int storeInfoFk, String originName,
			String remakeName, String photoRoute, Date owPhotoUploadDate) {
		super();
		this.owStorePhotoPk = owStorePhotoPk;
		this.owPhotoTypeFk = owPhotoTypeFk;
		this.storeInfoFk = storeInfoFk;
		this.originName = originName;
		this.remakeName = remakeName;
		this.photoRoute = photoRoute;
		this.owPhotoUploadDate = owPhotoUploadDate;
	}


	public int getOwStorePhotoPk() {
		return owStorePhotoPk;
	}
	public void setOwStorePhotoPk(int owStorePhotoPk) {
		this.owStorePhotoPk = owStorePhotoPk;
	}
	public int getOwPhotoTypeFk() {
		return owPhotoTypeFk;
	}
	public void setOwPhotoTypeFk(int owPhotoTypeFk) {
		this.owPhotoTypeFk = owPhotoTypeFk;
	}
	public int getStoreInfoFk() {
		return storeInfoFk;
	}
	public void setStoreInfoFk(int storeInfoFk) {
		this.storeInfoFk = storeInfoFk;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
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
	public Date getOwPhotoUploadDate() {
		return owPhotoUploadDate;
	}
	public void setOwPhotoUploadDate(Date owPhotoUploadDate) {
		this.owPhotoUploadDate = owPhotoUploadDate;
	}
	
	
}	
