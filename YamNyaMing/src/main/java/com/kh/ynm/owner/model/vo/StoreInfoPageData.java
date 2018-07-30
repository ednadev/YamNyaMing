package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class StoreInfoPageData {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreName;
	private String owStoreTel;
	private int owBigTypeFk;
	private int owSmallTypeFk;
	private String owStoreUrl;
	private String owStoreAddr;
	private String owStoreMapInfo;
	private String owStoreWorkingTime;
	
	private int owStoreDetailPk;
	private int owStoreInfoFk;
	private String owStoreTip;
	private String owStoreLineComment;
	private String recommandMenu;
	private String storeTableInfo;
	private String budgetInfo;
	private String owSubInfo;
	private String owDrinkListInfo;
	private String owStoreHeadPhoto;
	private String[] storeHeadPhotoArr;// 대표 이미지 배열로 파싱
	private int owStoreMenuTypeFk;
	private String owStoreMenuInfoDetail;
	private String[] owStoreMenuInfoDetailArr;// 메뉴 정보 인덱스 배열로 파싱
	private String owStoreCostType;
	
	public StoreInfoPageData() {}

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

	public String getOwStoreMapInfo() {
		return owStoreMapInfo;
	}

	public void setOwStoreMapInfo(String owStoreMapInfo) {
		this.owStoreMapInfo = owStoreMapInfo;
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

	public int getOwStoreInfoFk() {
		return owStoreInfoFk;
	}

	public void setOwStoreInfoFk(int owStoreInfoFk) {
		this.owStoreInfoFk = owStoreInfoFk;
	}

	public String getOwStoreTip() {
		return owStoreTip;
	}

	public void setOwStoreTip(String owStoreTip) {
		this.owStoreTip = owStoreTip;
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

	public int getOwStoreMenuTypeFk() {
		return owStoreMenuTypeFk;
	}

	public void setOwStoreMenuTypeFk(int owStoreMenuTypeFk) {
		this.owStoreMenuTypeFk = owStoreMenuTypeFk;
	}

	public String getOwStoreMenuInfoDetail() {
		return owStoreMenuInfoDetail;
	}

	public void setOwStoreMenuInfoDetail(String owStoreMenuInfoDetail) {
		this.owStoreMenuInfoDetail = owStoreMenuInfoDetail;
		setOwStoreMenuInfoDetailArr(this.owStoreMenuInfoDetail);
	}

	public String getOwStoreCostType() {
		return owStoreCostType;
	}

	public void setOwStoreCostType(String owStoreCostType) {
		this.owStoreCostType = owStoreCostType;
	}

	public String[] getStoreHeadPhotoArr() {
		return storeHeadPhotoArr;
	}

	public void setStoreHeadPhotoArr(String storeHeadPhotoArr) {
		this.storeHeadPhotoArr = storeHeadPhotoArr.split(",");
	}

	public String[] getOwStoreMenuInfoDetailArr() {
		return owStoreMenuInfoDetailArr;
	}

	public void setOwStoreMenuInfoDetailArr(String owStoreMenuInfoDetailArr) {
		this.owStoreMenuInfoDetailArr = owStoreMenuInfoDetailArr.split(",");
	}
	
	
}
