package com.kh.ynm.common.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class YNMTotalRefModel {
	private static HashMap<String, StoreCategoryMain> cateMainList =  new HashMap<String, StoreCategoryMain>();
	private static HashMap<String, StoreCategoryDetail> cateDetailList = new HashMap<String, StoreCategoryDetail>();
	
	public YNMTotalRefModel() {}

	public static HashMap<String, StoreCategoryMain> getCateMainList() {
		return cateMainList;
	}

	public static void setCateMainList(HashMap<String, StoreCategoryMain> cateMainList) {
		YNMTotalRefModel.cateMainList = cateMainList;
	}

	public static HashMap<String, StoreCategoryDetail> getCateDetailList() {
		return cateDetailList;
	}

	public static void setCateDetailList(HashMap<String, StoreCategoryDetail> cateDetailList) {
		YNMTotalRefModel.cateDetailList = cateDetailList;
	}
	
	public static int getCateMainIndex(String name){
		return cateMainList.get(name).getStoreCateMainPk();
	}
	public static int getCateDetailIndex(String name){
		return cateDetailList.get(name).getStoreCateDetailPk();
	}
}