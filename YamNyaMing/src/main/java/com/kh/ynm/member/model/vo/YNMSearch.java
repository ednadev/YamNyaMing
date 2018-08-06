package com.kh.ynm.member.model.vo;

public class YNMSearch {
	private int owStoreInfoPk;
	private String owStoreName;
	private String owStoreAddrFirst;
	private String owStoreAddrFinal;
	private String storeCateDetailName;
	private String owPhotoRoute;
	private String owStoreComment;
	private String owStoreHeadPhoto;
	private String owStoreTel;
	private String owStoreUrl;
	private String owStoreAddr;
	private String owStoreWorkingTime;
	private String owBudget;
	private String storeCateMainName;
	private String owStoreTableInfo;
	private String owSubInfo;
	private String owDrinkListInfo;
	private int starPoint;
	private float starAvg;
	private int favoriteTotal;
	private int favoriteChk;
	
	
	public YNMSearch() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearch(int owStoreInfoPk, String owStoreName, String owStoreAddrFirst, String owStoreAddrFinal,
			String storeCateDetailName, String owPhotoRoute, String owStoreComment, String owStoreHeadPhoto,
			String owStoreTel, String owStoreUrl, String owStoreAddr, String owStoreWorkingTime, String owBudget,
			String storeCateMainName, String owStoreTableInfo, String owSubInfo, String owDrinkListInfo, int starPoint,
			float starAvg, int favoriteTotal) {
		this.owStoreInfoPk = owStoreInfoPk;
		this.owStoreName = owStoreName;
		this.owStoreAddrFirst = owStoreAddrFirst;
		this.owStoreAddrFinal = owStoreAddrFinal;
		this.storeCateDetailName = storeCateDetailName;
		this.owPhotoRoute = owPhotoRoute;
		this.owStoreComment = owStoreComment;
		this.owStoreHeadPhoto = owStoreHeadPhoto;
		this.owStoreTel = owStoreTel;
		this.owStoreUrl = owStoreUrl;
		this.owStoreAddr = owStoreAddr;
		this.owStoreWorkingTime = owStoreWorkingTime;
		this.owBudget = owBudget;
		this.storeCateMainName = storeCateMainName;
		this.owStoreTableInfo = owStoreTableInfo;
		this.owSubInfo = owSubInfo;
		this.owDrinkListInfo = owDrinkListInfo;
		this.starPoint = starPoint;
		this.starAvg = starAvg;
		this.favoriteTotal = favoriteTotal;
	}
	public int getFavoriteChk() {
		return favoriteChk;
	}
	public void setFavoriteChk(int favoriteChk) {
		this.favoriteChk = favoriteChk;
	}
	public int getOwStoreInfoPk() {
		return owStoreInfoPk;
	}
	public void setOwStoreInfoPk(int owStoreInfoPk) {
		this.owStoreInfoPk = owStoreInfoPk;
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
		String[] arrTest1 = owPhotoRoute.split("\\\\");
		StringBuilder sb = new StringBuilder();
		boolean chk = false;
		for(int i = 0; i<arrTest1.length;i++)
		{
			if(arrTest1[i].equals("resources")) chk = true;
			if(chk) {
				if(!arrTest1[i].equals("resources"))sb.append("/"+arrTest1[i]);
				else sb.append(arrTest1[i]);
			}
			
		}
		this.owPhotoRoute = sb.toString();
	}
	public String getOwStoreComment() {
		return owStoreComment;
	}
	public void setOwStoreComment(String owStoreComment) {
		this.owStoreComment = owStoreComment;
	}
	public String getOwStoreHeadPhoto() {
		return owStoreHeadPhoto;
	}
	public void setOwStoreHeadPhoto(String owStoreHeadPhoto) {
		this.owStoreHeadPhoto = owStoreHeadPhoto;
	}
	public String getOwStoreTel() {
		return owStoreTel;
	}
	public void setOwStoreTel(String owStoreTel) {
		this.owStoreTel = owStoreTel;
	}
	public String getOwStoreUrl() {
		return owStoreUrl;
	}
	public void setOwStoreUrl(String owStoreUrl) {
		this.owStoreUrl = owStoreUrl;
	}
	public String getOwStoreAddr() {
		return owStoreAddr;
	}
	public void setOwStoreAddr(String owStoreAddr) {
		this.owStoreAddr = owStoreAddr;
	}
	public String getOwStoreWorkingTime() {
		return owStoreWorkingTime;
	}
	public void setOwStoreWorkingTime(String owStoreWorkingTime) {
		this.owStoreWorkingTime = owStoreWorkingTime;
	}
	public String getOwBudget() {
		return owBudget;
	}
	public void setOwBudget(String owBudget) {
		this.owBudget = owBudget;
	}
	public String getStoreCateMainName() {
		return storeCateMainName;
	}
	public void setStoreCateMainName(String storeCateMainName) {
		this.storeCateMainName = storeCateMainName;
	}
	public String getOwStoreTableInfo() {
		return owStoreTableInfo;
	}
	public void setOwStoreTableInfo(String owStoreTableInfo) {
		this.owStoreTableInfo = owStoreTableInfo;
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
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	public float getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(float starAvg) {
		this.starAvg = starAvg;
	}
	public int getFavoriteTotal() {
		return favoriteTotal;
	}
	public void setFavoriteTotal(int favoriteTotal) {
		this.favoriteTotal = favoriteTotal;
	}


}
