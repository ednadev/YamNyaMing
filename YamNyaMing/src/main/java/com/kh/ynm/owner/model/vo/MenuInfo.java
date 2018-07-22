package com.kh.ynm.owner.model.vo;

public class MenuInfo {
	private int owMenuInfoPk;
	private int owStoreInfoFk;
	private int owStoreMenuTypeFk;
	private String owStoreMenuInfoDetail;
	private String owStoreCostType;
	
	
	public MenuInfo() {}
	
	public MenuInfo(int owMenuInfoPk, int owStoreInfoFk, int owStoreMenuTypeFk, String owStoreMenuInfoDetail,
			String owStoreCostType) {
		super();
		this.owMenuInfoPk = owMenuInfoPk;
		this.owStoreInfoFk = owStoreInfoFk;
		this.owStoreMenuTypeFk = owStoreMenuTypeFk;
		this.owStoreMenuInfoDetail = owStoreMenuInfoDetail;
		this.owStoreCostType = owStoreCostType;
	}
	public int getOwMenuInfoPk() {
		return owMenuInfoPk;
	}
	public void setOwMenuInfoPk(int owMenuInfoPk) {
		this.owMenuInfoPk = owMenuInfoPk;
	}
	public int getOwStoreInfoFk() {
		return owStoreInfoFk;
	}
	public void setOwStoreInfoFk(int owStoreInfoFk) {
		this.owStoreInfoFk = owStoreInfoFk;
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
