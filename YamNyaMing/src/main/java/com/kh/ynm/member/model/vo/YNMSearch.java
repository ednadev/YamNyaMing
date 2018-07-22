package com.kh.ynm.member.model.vo;

public class YNMSearch {
	String owPhotoRoute;
	String owStoreNum;
	public YNMSearch() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearch(String owPhotoRoute, String owStoreNum) {
		this.owPhotoRoute = owPhotoRoute;
		this.owStoreNum = owStoreNum;
	}
	public String getOwPhotoRoute() {
		return owPhotoRoute;
	}
	public void setOwPhotoRoute(String owPhotoRoute) {
		this.owPhotoRoute = owPhotoRoute;
	}
	public String getOwStoreNum() {
		return owStoreNum;
	}
	public void setOwStoreNum(String owStoreNum) {
		this.owStoreNum = owStoreNum;
	}
}
