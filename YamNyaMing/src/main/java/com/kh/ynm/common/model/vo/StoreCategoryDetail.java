package com.kh.ynm.common.model.vo;

public class StoreCategoryDetail {
	private int storeCateDetailPk;
	private int storeCateMainFk;
	private String storeCateDetailCode;
	private String storeCateDetailName;
	
	public StoreCategoryDetail() {}

	public StoreCategoryDetail(int storeCateDetailPk, int storeCateMainFk, String storeCateDetailCode,
			String storeCateDetailName) {
		super();
		this.storeCateDetailPk = storeCateDetailPk;
		this.storeCateMainFk = storeCateMainFk;
		this.storeCateDetailCode = storeCateDetailCode;
		this.storeCateDetailName = storeCateDetailName;
	}

	public int getStoreCateDetailPk() {
		return storeCateDetailPk;
	}

	public void setStoreCateDetailPk(int storeCateDetailPk) {
		this.storeCateDetailPk = storeCateDetailPk;
	}

	public int getStoreCateMainFk() {
		return storeCateMainFk;
	}

	public void setStoreCateMainFk(int storeCateMainFk) {
		this.storeCateMainFk = storeCateMainFk;
	}

	public String getStoreCateDetailCode() {
		return storeCateDetailCode;
	}

	public void setStoreCateDetailCode(String storeCateDetailCode) {
		this.storeCateDetailCode = storeCateDetailCode;
	}

	public String getStoreCateDetailName() {
		return storeCateDetailName;
	}

	public void setStoreCateDetailName(String storeCateDetailName) {
		this.storeCateDetailName = storeCateDetailName;
	}
	
	
	
	
}
