package com.kh.ynm.owner.model.vo;

public class YNMStoreDetailInfo {
	private int owStoreDetailPk;
	private int owStoreInfoFk;
	private String owStoreTip;
	private String owStoreLineComment;
	private int storeBigType;
	private int storeSmallType;
	private String recommandMenu;
	private String storeTableInfo;
	private String budgetInfo;
	private String owSubInfo;
	private String owDrinkListInfo;
	private String owStoreHeadPhoto;
	private int owStoreMenuTypeFk;
	private String owStoreMenuInfoDetail;
	private String owStoreCostType;
	
	public YNMStoreDetailInfo() {}
	

	public YNMStoreDetailInfo(int owStoreDetailPk, int owStoreInfoFk, String owStoreTip, String owStoreLineComment,
			int storeBigType, int storeSmallType, String recommandMenu, String storeTableInfo, String budgetInfo,
			String owSubInfo, String owDrinkListInfo, String owStoreHeadPhoto, int owStoreMenuTypeFk,
			String owStoreMenuInfoDetail, String owStoreCostType) {
		super();
		this.owStoreDetailPk = owStoreDetailPk;
		this.owStoreInfoFk = owStoreInfoFk;
		this.owStoreTip = owStoreTip;
		this.owStoreLineComment = owStoreLineComment;
		this.storeBigType = storeBigType;
		this.storeSmallType = storeSmallType;
		this.recommandMenu = recommandMenu;
		this.storeTableInfo = storeTableInfo;
		this.budgetInfo = budgetInfo;
		this.owSubInfo = owSubInfo;
		this.owDrinkListInfo = owDrinkListInfo;
		this.owStoreHeadPhoto = owStoreHeadPhoto;
		this.owStoreMenuTypeFk = owStoreMenuTypeFk;
		this.owStoreMenuInfoDetail = owStoreMenuInfoDetail;
		this.owStoreCostType = owStoreCostType;
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
	public int getStoreBigType() {
		return storeBigType;
	}
	public void setStoreBigType(int storeBigType) {
		this.storeBigType = storeBigType;
	}
	public int getStoreSmallType() {
		return storeSmallType;
	}
	public void setStoreSmallType(int storeSmallType) {
		this.storeSmallType = storeSmallType;
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
	}

	public String getOwStoreCostType() {
		return owStoreCostType;
	}

	public void setOwStoreCostType(String owStoreCostType) {
		this.owStoreCostType = owStoreCostType;
	}
	
	
	
	
}
