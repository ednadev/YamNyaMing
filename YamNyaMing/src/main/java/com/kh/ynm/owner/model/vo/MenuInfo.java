package com.kh.ynm.owner.model.vo;

public class MenuInfo {
	private int owMenuInfoPk;
	private int owStoreInfoFk;
	private String menuId;
	private String menuTitle;
	private String subTitle;
	private String explain;
	private int menuCost;
	
	public MenuInfo() {}

	public MenuInfo(int owMenuInfoPk, int owStoreInfoFk, String menuId, String menuTitle, String subTitle,
			String explain, int menuCost) {
		super();
		this.owMenuInfoPk = owMenuInfoPk;
		this.owStoreInfoFk = owStoreInfoFk;
		this.menuId = menuId;
		this.menuTitle = menuTitle;
		this.subTitle = subTitle;
		this.explain = explain;
		this.menuCost = menuCost;
	}

	public int getOwStoreInfoFk() {
		return owStoreInfoFk;
	}

	public void setOwStoreInfoFk(int owStoreInfoFk) {
		this.owStoreInfoFk = owStoreInfoFk;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getOwMenuInfoPk() {
		return owMenuInfoPk;
	}


	public void setOwMenuInfoPk(int owMenuInfoPk) {
		this.owMenuInfoPk = owMenuInfoPk;
	}


	public String getMenuTitle() {
		return menuTitle;
	}


	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}


	public String getSubTitle() {
		return subTitle;
	}


	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}


	public String getExplain() {
		return explain;
	}


	public void setExplain(String explain) {
		this.explain = explain;
	}


	public int getMenuCost() {
		return menuCost;
	}


	public void setMenuCost(int menuCost) {
		this.menuCost = menuCost;
	}
	
	
	
	
}
