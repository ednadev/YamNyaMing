package com.kh.ynm.owner.model.vo;

public class StoreMenuData {
	private int storeDetailInfoPK;
	private int storeIndex;
	private int menuType;
	private String menuInfoList;
	
	public StoreMenuData() {}

	public StoreMenuData(int storeDetailInfoPK, int storeIndex, int menuType, String menuInfoList) {
		super();
		this.storeDetailInfoPK = storeDetailInfoPK;
		this.storeIndex = storeIndex;
		this.menuType = menuType;
		this.menuInfoList = menuInfoList;
	}
	

	public int getStoreIndex() {
		return storeIndex;
	}

	public void setStoreIndex(int storeIndex) {
		this.storeIndex = storeIndex;
	}

	public int getStoreDetailInfoPK() {
		return storeDetailInfoPK;
	}

	public void setStoreDetailInfoPK(int storeDetailInfoPK) {
		this.storeDetailInfoPK = storeDetailInfoPK;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public String getMenuInfoList() {
		return menuInfoList;
	}

	public void setMenuInfoList(String menuInfoList) {
		this.menuInfoList = menuInfoList;
	}
	
}
