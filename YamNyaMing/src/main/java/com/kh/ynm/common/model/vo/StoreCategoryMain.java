package com.kh.ynm.common.model.vo;

public class StoreCategoryMain {
	private int storeCateMainPk;
	private String storeCateMainCode;
	private String storeCateMainName;
	
	public StoreCategoryMain() {}
	
	public StoreCategoryMain(int storeCateMainPk, String storeCateMainCode, String storeCateMainName) {
		super();
		this.storeCateMainPk = storeCateMainPk;
		this.storeCateMainCode = storeCateMainCode;
		this.storeCateMainName = storeCateMainName;
	}

	public int getStoreCateMainPk() {
		return storeCateMainPk;
	}

	public void setStoreCateMainPk(int storeCateMainPk) {
		this.storeCateMainPk = storeCateMainPk;
	}

	public String getStoreCateMainCode() {
		return storeCateMainCode;
	}

	public void setStoreCateMainCode(String storeCateMainCode) {
		this.storeCateMainCode = storeCateMainCode;
	}

	public String getStoreCateMainName() {
		return storeCateMainName;
	}

	public void setStoreCateMainName(String storeCateMainName) {
		this.storeCateMainName = storeCateMainName;
	}
	
	
	
}
