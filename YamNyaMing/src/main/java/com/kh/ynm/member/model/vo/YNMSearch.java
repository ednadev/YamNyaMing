package com.kh.ynm.member.model.vo;

public class YNMSearch {
	private String owPhotoRoute;
	private String owStoreName;
	public YNMSearch() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearch(String owPhotoRoute, String owStoreName) {
		this.owPhotoRoute = owPhotoRoute;
		this.owStoreName = owStoreName;
	}
	public String getOwPhotoRoute() {
		return owPhotoRoute;
	}
	public void setOwPhotoRoute(String owPhotoRoute) {
		this.owPhotoRoute = owPhotoRoute;
	}
	public String getOwStoreName() {
		return owStoreName;
	}
	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}
}
