package com.kh.ynm.member.model.vo;

public class YNMSearch {
	private String owStoreName;
	private String owStoreAddrFirst;
	private String owStoreAddrFinal;
	private String storeCateDetailName;
	private String owPhotoRoute;
	private String owStoreComment;
	public YNMSearch() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearch(String owStoreName, String owStoreAddrFirst, String owStoreAddrFinal, String storeCateDetailName,
			String owPhotoRoute, String owStoreComment) {
		this.owStoreName = owStoreName;
		this.owStoreAddrFirst = owStoreAddrFirst;
		this.owStoreAddrFinal = owStoreAddrFinal;
		this.storeCateDetailName = storeCateDetailName;
		this.owPhotoRoute = owPhotoRoute;
		this.owStoreComment = owStoreComment;
	}
	public String getOwStoreName() {
		return owStoreName;
	}
	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}
	public String getOwStoreAddrFirst() {
		return owStoreAddrFirst;
	}
	public void setOwStoreAddrFirst(String owStoreAddrFirst) {
		this.owStoreAddrFirst = owStoreAddrFirst;
	}
	public String getOwStoreAddrFinal() {
		return owStoreAddrFinal;
	}
	public void setOwStoreAddrFinal(String owStoreAddrFinal) {
		this.owStoreAddrFinal = owStoreAddrFinal;
	}
	public String getStoreCateDetailName() {
		return storeCateDetailName;
	}
	public void setStoreCateDetailName(String storeCateDetailName) {
		this.storeCateDetailName = storeCateDetailName;
	}
	public String getOwPhotoRoute() {
		return owPhotoRoute;
	}
	public void setOwPhotoRoute(String owPhotoRoute) {
		this.owPhotoRoute = owPhotoRoute;
	}
	public String getOwStoreComment() {
		return owStoreComment;
	}
	public void setOwStoreComment(String owStoreComment) {
		this.owStoreComment = owStoreComment;
	}

}
