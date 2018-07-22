package com.kh.ynm.owner.model.vo;

public class StoreDetailInfo {
	private int owStoreDetailPk;
	private int owStoreInfoFk;
	private String owStoreTip;
	private String owStoreLineComment;
	private int storeBigType;
	private int storeSmallType;
	private String recommandMenu;
	private String StoreTableInfo;
	private String budgetInfo;
	private String owSubInfo;
	private String owDrinkListInfo;
	
	public StoreDetailInfo() {}
	
	public StoreDetailInfo(int owStoreDetailPk, int owStoreInfoFk, String owStoreTip, String owStoreLineComment,
			int storeBigType, int storeSmallType, String recommandMenu, String storeTableInfo, String budgetInfo,
			String owSubInfo, String owDrinkListInfo) {
		super();
		this.owStoreDetailPk = owStoreDetailPk;
		this.owStoreInfoFk = owStoreInfoFk;
		this.owStoreTip = owStoreTip;
		this.owStoreLineComment = owStoreLineComment;
		this.storeBigType = storeBigType;
		this.storeSmallType = storeSmallType;
		this.recommandMenu = recommandMenu;
		StoreTableInfo = storeTableInfo;
		this.budgetInfo = budgetInfo;
		this.owSubInfo = owSubInfo;
		this.owDrinkListInfo = owDrinkListInfo;
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
		return StoreTableInfo;
	}
	public void setStoreTableInfo(String storeTableInfo) {
		StoreTableInfo = storeTableInfo;
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
	
	
}
