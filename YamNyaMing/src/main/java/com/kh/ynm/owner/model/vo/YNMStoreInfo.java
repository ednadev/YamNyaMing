package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class YNMStoreInfo {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreBizNum;
	private String owStoreName;
	private String owStorePhone;
	private int owBigTypeFk;
	private int owStoreTypeFk;
	private String owStoreUrl;
	private Date owStoreRegDate;
	private String owStoreMapInfo;
	private String owStoreWorkingTime;
	
	
	public YNMStoreInfo() {
		super();
	}
	public YNMStoreInfo(int owStoreInfoPk, int owEntireFk, String owStoreBizNum, String owStoreName,
			String owStorePhone, int owBigTypeFk, int owStoreTypeFk, String owStoreUrl, Date owStoreRegDate,
			String owStoreMapInfo, String owStoreWorkingTime) {
		super();
		this.owStoreInfoPk = owStoreInfoPk;
		this.owEntireFk = owEntireFk;
		this.owStoreBizNum = owStoreBizNum;
		this.owStoreName = owStoreName;
		this.owStorePhone = owStorePhone;
		this.owBigTypeFk = owBigTypeFk;
		this.owStoreTypeFk = owStoreTypeFk;
		this.owStoreUrl = owStoreUrl;
		this.owStoreRegDate = owStoreRegDate;
		this.owStoreMapInfo = owStoreMapInfo;
		this.owStoreWorkingTime = owStoreWorkingTime;
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
	public String getOwStorePhone() {
		return owStorePhone;
	}
	public void setOwStorePhone(String owStorePhone) {
		this.owStorePhone = owStorePhone;
	}
	public int getOwBigTypeFk() {
		return owBigTypeFk;
	}
	public void setOwBigTypeFk(int owBigTypeFk) {
		this.owBigTypeFk = owBigTypeFk;
	}
	public int getOwStoreTypeFk() {
		return owStoreTypeFk;
	}
	public void setOwStoreTypeFk(int owStoreTypeFk) {
		this.owStoreTypeFk = owStoreTypeFk;
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
