package com.kh.ynm.owner.model.vo;

import java.util.Date;

public class CouponEnroll {
	private int owCouponInfoPk;
	private int owEntireFk;
	private int owStoreInfoFk;
	private String owCouponName;
	private int owCouponCount;
	private Date owCouponStartDate;
	private Date owCouponExpireDate;
	private String owCouponDetail;
	
	public CouponEnroll() {}

	public CouponEnroll(int owCouponInfoPk, int owEntireFk, int owStoreInfoFk, String owCouponName, int owCouponCount,
			Date owCouponStartDate, Date owCouponExpireDate, String owCouponDetail) {
		super();
		this.owCouponInfoPk = owCouponInfoPk;
		this.owEntireFk = owEntireFk;
		this.owStoreInfoFk = owStoreInfoFk;
		this.owCouponName = owCouponName;
		this.owCouponCount = owCouponCount;
		this.owCouponStartDate = owCouponStartDate;
		this.owCouponExpireDate = owCouponExpireDate;
		this.owCouponDetail = owCouponDetail;
	}

	public int getOwCouponInfoPk() {
		return owCouponInfoPk;
	}

	public void setOwCouponInfoPk(int owCouponInfoPk) {
		this.owCouponInfoPk = owCouponInfoPk;
	}

	public int getOwEntireFk() {
		return owEntireFk;
	}

	public void setOwEntireFk(int owEntireFk) {
		this.owEntireFk = owEntireFk;
	}

	public int getOwStoreInfoFk() {
		return owStoreInfoFk;
	}

	public void setOwStoreInfoFk(int owStoreInfoFk) {
		this.owStoreInfoFk = owStoreInfoFk;
	}

	public String getOwCouponName() {
		return owCouponName;
	}

	public void setOwCouponName(String owCouponName) {
		this.owCouponName = owCouponName;
	}

	public int getOwCouponCount() {
		return owCouponCount;
	}

	public void setOwCouponCount(int owCouponCount) {
		this.owCouponCount = owCouponCount;
	}

	public Date getOwCouponStartDate() {
		return owCouponStartDate;
	}

	public void setOwCouponStartDate(Date owCouponStartDate) {
		this.owCouponStartDate = owCouponStartDate;
	}

	public Date getOwCouponExpireDate() {
		return owCouponExpireDate;
	}

	public void setOwCouponExpireDate(Date owCouponExpireDate) {
		this.owCouponExpireDate = owCouponExpireDate;
	}

	public String getOwCouponDetail() {
		return owCouponDetail;
	}

	public void setOwCouponDetail(String owCouponDetail) {
		this.owCouponDetail = owCouponDetail;
	}
	
	
	
	
	
}
