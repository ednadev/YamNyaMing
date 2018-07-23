package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class YNMStoreInfo {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreBizNum;
	private String owStoreName;
	private String owStoreTel;
	private int owBigTypeFk;
	private int owSmallTypeFk;
	private String owStoreUrl;
	private String owStoreAddr;
	private Date owStoreRegDate;
	private String owStoreMapInfo;
	private String owStoreWorkingTime;
	private YNMStoreDetailInfo detailInfo;
	
	
	
	public YNMStoreInfo() {
		super();
	}
	
	public YNMStoreInfo(int owStoreInfoPk, int owEntireFk, String owStoreBizNum, String owStoreName, String owStoreTel,
			int owBigTypeFk, int owSmallTypeFk, String owStoreUrl, String owStoreAddr, Date owStoreRegDate,
			String owStoreMapInfo, String owStoreWorkingTime, YNMStoreDetailInfo detailInfo) {
		super();
		this.owStoreInfoPk = owStoreInfoPk;
		this.owEntireFk = owEntireFk;
		this.owStoreBizNum = owStoreBizNum;
		this.owStoreName = owStoreName;
		this.owStoreTel = owStoreTel;
		this.owBigTypeFk = owBigTypeFk;
		this.owSmallTypeFk = owSmallTypeFk;
		this.owStoreUrl = owStoreUrl;
		this.owStoreAddr = owStoreAddr;
		this.owStoreRegDate = owStoreRegDate;
		this.owStoreMapInfo = owStoreMapInfo;
		this.owStoreWorkingTime = owStoreWorkingTime;
		this.detailInfo = detailInfo;
	}
	
	


	@Override
	public String toString() {
		return "YNMStoreInfo [owStoreInfoPk=" + owStoreInfoPk + ", owEntireFk=" + owEntireFk + ", owStoreBizNum="
				+ owStoreBizNum + ", owStoreName=" + owStoreName + ", owStoreTel=" + owStoreTel + ", owBigTypeFk="
				+ owBigTypeFk + ", owSmallTypeFk=" + owSmallTypeFk + ", owStoreUrl=" + owStoreUrl + ", owStoreAddr="
				+ owStoreAddr + ", owStoreRegDate=" + owStoreRegDate + ", owStoreMapInfo=" + owStoreMapInfo
				+ ", owStoreWorkingTime=" + owStoreWorkingTime + ", detailInfo=" + detailInfo + "]";
	}

	public String getOwStoreAddr() {
		return owStoreAddr;
	}
	public void setOwStoreAddr(String owStoreAddr) {
		this.owStoreAddr = owStoreAddr;
	}
	public YNMStoreDetailInfo getMenuInfo() {
		return detailInfo;
	}
	public void setMenuInfo(YNMStoreDetailInfo detailInfo) {
		this.detailInfo = detailInfo;
	}
	public int getOwStoreInfoPk() {
		return owStoreInfoPk;
	}
	public void setOwStoreInfoPk(int owStoreInfoPk) {
		this.owStoreInfoPk = owStoreInfoPk;
	}
	public int getOwEntireFk() {
		return owEntireFk;
	}
	public void setOwEntireFk(int owEntireFk) {
		this.owEntireFk = owEntireFk;
	}
	public String getOwStoreBizNum() {
		return owStoreBizNum;
	}
	public void setOwStoreBizNum(String owStoreBizNum) {
		this.owStoreBizNum = owStoreBizNum;
	}
	public String getOwStoreName() {
		return owStoreName;
	}
	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}
	public String getOwStoreTel() {
		return owStoreTel;
	}
	public void setOwStoreTel(String owStoreTel) {
		this.owStoreTel = owStoreTel;
	}
	public int getOwBigTypeFk() {
		return owBigTypeFk;
	}
	public void setOwBigTypeFk(int owBigTypeFk) {
		this.owBigTypeFk = owBigTypeFk;
	}
	public int getOwSmallTypeFk() {
		return owSmallTypeFk;
	}
	public void setOwSmallTypeFk(int owSmallTypeFk) {
		this.owSmallTypeFk = owSmallTypeFk;
	}
	public String getOwStoreUrl() {
		return owStoreUrl;
	}
	public void setOwStoreUrl(String owStoreUrl) {
		this.owStoreUrl = owStoreUrl;
	}
	public Date getOwStoreRegDate() {
		return owStoreRegDate;
	}
	public void setOwStoreRegDate(Date owStoreRegDate) {
		this.owStoreRegDate = owStoreRegDate;
	}
	public String getOwStoreMapInfo() {
		return owStoreMapInfo;
	}
	public void setOwStoreMapInfo(String owStoreMapInfo) {
		this.owStoreMapInfo = owStoreMapInfo;
	}
	public String getOwStoreWorkingTime() {
		return owStoreWorkingTime;
	}
	public void setOwStoreWorkingTime(String owStoreWorkingTime) {
		this.owStoreWorkingTime = owStoreWorkingTime;
	}
	
	
}
