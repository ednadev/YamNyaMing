package com.kh.ynm.owner.model.vo;

public class StoreTitleData {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreName;
	private String owStoreTip;
	private String owStoreHeadPhoto;
	private String[] owStoreHeadPhotoArr;
	
	public StoreTitleData() {}
	
	public int getOwStoreInfoPk() {
		return owStoreInfoPk;
	}
	public void setOwStoreInfoPk(int owStoreInfoPk) {
		this.owStoreInfoPk = owStoreInfoPk;
	}
	public int getOwEntireFk() {
		return owEntireFk;
	}
	public void setOwEntireFk(int owEntireFk) {
		this.owEntireFk = owEntireFk;
	}
	public String getOwStoreName() {
		return owStoreName;
	}
	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}
	public String getOwStoreTip() {
		return owStoreTip;
	}
	public void setOwStoreTip(String owStoreTip) {
		this.owStoreTip = owStoreTip;
	}
	public String getOwStoreHeadPhoto() {
		return owStoreHeadPhoto;
	}
	public void setOwStoreHeadPhoto(String owStoreHeadPhoto) {
		this.owStoreHeadPhoto = owStoreHeadPhoto;
		setOwStoreHeadPhotoArr(owStoreHeadPhoto.split(","));
	}

	public String[] getOwStoreHeadPhotoArr() {
		return owStoreHeadPhotoArr;
	}

	public void setOwStoreHeadPhotoArr(String[] owStoreHeadPhotoArr) {
		this.owStoreHeadPhotoArr = owStoreHeadPhotoArr;
	}
	
	
	
}
