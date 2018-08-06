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
	private String owPhotoViewRoute;
	private int storeDetailPk;
	private String headStoreList;
	public OwnerUploadPhoto() {
		
	}
	
	
	public OwnerUploadPhoto(int owStorePhotoPk, int owPhotoTypeFk, int storeInfoFk, String originName,
			String remakeName, String photoRoute, Date owPhotoUploadDate, String owPhotoViewRoute, int storeDetailPk,
			String headStoreList) {
		super();
		this.owStorePhotoPk = owStorePhotoPk;
		this.owPhotoTypeFk = owPhotoTypeFk;
		this.storeInfoFk = storeInfoFk;
		this.originName = originName;
		this.remakeName = remakeName;
		this.photoRoute = photoRoute;
		this.owPhotoUploadDate = owPhotoUploadDate;
		this.owPhotoViewRoute = owPhotoViewRoute;
		this.storeDetailPk = storeDetailPk;
		this.headStoreList = headStoreList;
	}

	
	public int getStoreDetailPk() {
		return storeDetailPk;
	}


	public void setStoreDetailPk(int storeDetailPk) {
		this.storeDetailPk = storeDetailPk;
	}


	public String getHeadStoreList() {
		return headStoreList;
	}


	public void setHeadStoreList(String headStoreList) {
		this.headStoreList = headStoreList;
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
	public String getOwPhotoViewRoute() {
		return owPhotoViewRoute;
	}


	public void setOwPhotoViewRoute(String owPhotoViewRoute) {
		String[] arrTest1 = owPhotoViewRoute.split("\\\\");
		StringBuilder sb = new StringBuilder();
		boolean chk = false;
		for(int i = 0; i<arrTest1.length;i++)
		{
			if(arrTest1[i].equals("resources")) chk = true;
			if(chk) {
				if(!arrTest1[i].equals("resources"))sb.append("/"+arrTest1[i]);
				else sb.append(arrTest1[i]);
			}
			
		}
		this.owPhotoViewRoute = sb.toString();
	}
	
	
}	
