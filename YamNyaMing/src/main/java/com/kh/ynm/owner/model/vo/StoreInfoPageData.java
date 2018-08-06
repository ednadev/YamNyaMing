package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class StoreInfoPageData {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreName;
	private String owStoreTip;
	private float storeStarPoint;
	private String owStoreTel;
	private int owBigTypeFk;
	private int owSmallTypeFk;
	private String owStoreUrl;
	private String owStoreAddr;
	private String owStoreWorkingTime;
	private int owStoreDetailPk;
	private String owStoreLineComment;
	private String recommandMenu;
	private String storeTableInfo;
	private String budgetInfo;
	private String owSubInfo;
	private String owDrinkListInfo;
	private String owStoreHeadPhoto;
	private String[] storeHeadPhotoArr;// 대표 이미지 배열로 파싱
	private int store_enroll_rq_state;

	
	public StoreInfoPageData() {}
	
	
	public String getOwStoreName() {
		return owStoreName;
	}



	public void setOwStoreName(String owStoreName) {
		System.out.println(owStoreName);
		this.owStoreName = owStoreName;
	}



	public String getOwStoreTip() {
		return owStoreTip;
	}



	public void setOwStoreTip(String owStoreTip) {
		this.owStoreTip = owStoreTip;
	}



	public float getStoreStarPoint() {
		return storeStarPoint;
	}



	public void setStoreStarPoint(float storeStarPoint) {
		this.storeStarPoint = storeStarPoint;
	}



	public void setStoreHeadPhotoArr(String[] storeHeadPhotoArr) {
		this.storeHeadPhotoArr = storeHeadPhotoArr;
	}



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

	public String getOwStoreTel() {
		return owStoreTel;
	}

	public void setOwStoreTel(String owStoreTel) {
		this.owStoreTel = owStoreTel;
	}

	public int getOwBigTypeFk() {
		return owBigTypeFk;
	}

	public void setOwBigTypeFk(int owBigTypeFk) {
		this.owBigTypeFk = owBigTypeFk;
	}

	public int getOwSmallTypeFk() {
		return owSmallTypeFk;
	}

	public void setOwSmallTypeFk(int owSmallTypeFk) {
		this.owSmallTypeFk = owSmallTypeFk;
	}

	public String getOwStoreUrl() {
		return owStoreUrl;
	}

	public void setOwStoreUrl(String owStoreUrl) {
		this.owStoreUrl = owStoreUrl;
	}

	public String getOwStoreAddr() {
		return owStoreAddr;
	}

	public void setOwStoreAddr(String owStoreAddr) {
		this.owStoreAddr = owStoreAddr;
	}

	public String getOwStoreWorkingTime() {
		return owStoreWorkingTime;
	}

	public void setOwStoreWorkingTime(String owStoreWorkingTime) {
		this.owStoreWorkingTime = owStoreWorkingTime;
	}

	public int getOwStoreDetailPk() {
		return owStoreDetailPk;
	}

	public void setOwStoreDetailPk(int owStoreDetailPk) {
		this.owStoreDetailPk = owStoreDetailPk;
	}

	public String getOwStoreLineComment() {
		return owStoreLineComment;
	}

	public void setOwStoreLineComment(String owStoreLineComment) {
		this.owStoreLineComment = owStoreLineComment;
	}

	public String getRecommandMenu() {
		return recommandMenu;
	}

	public void setRecommandMenu(String recommandMenu) {
		this.recommandMenu = recommandMenu;
	}

	public String getStoreTableInfo() {
		return storeTableInfo;
	}

	public void setStoreTableInfo(String storeTableInfo) {
		this.storeTableInfo = storeTableInfo;
	}

	public String getBudgetInfo() {
		return budgetInfo;
	}

	public void setBudgetInfo(String budgetInfo) {
		this.budgetInfo = budgetInfo;
	}

	public String getOwSubInfo() {
		return owSubInfo;
	}

	public void setOwSubInfo(String owSubInfo) {
		this.owSubInfo = owSubInfo;
	}

	public String getOwDrinkListInfo() {
		return owDrinkListInfo;
	}

	public void setOwDrinkListInfo(String owDrinkListInfo) {
		this.owDrinkListInfo = owDrinkListInfo;
	}

	public String getOwStoreHeadPhoto() {
		return owStoreHeadPhoto;
	}

	public void setOwStoreHeadPhoto(String owStoreHeadPhoto) {
		this.owStoreHeadPhoto = owStoreHeadPhoto;
		setStoreHeadPhotoArr(owStoreHeadPhoto);
	}

	public String[] getStoreHeadPhotoArr() {
		return storeHeadPhotoArr;
	}

	public void setStoreHeadPhotoArr(String storeHeadPhotoArr) {
		this.storeHeadPhotoArr = storeHeadPhotoArr.split(",");
	}


	public int getStore_enroll_rq_state() {
		return store_enroll_rq_state;
	}


	public void setStore_enroll_rq_state(int store_enroll_rq_state) {
		this.store_enroll_rq_state = store_enroll_rq_state;
	}
	
	
}
