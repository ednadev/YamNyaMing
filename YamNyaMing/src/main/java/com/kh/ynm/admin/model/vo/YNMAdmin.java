package com.kh.ynm.admin.model.vo;

public class YNMAdmin {
	private int admin_info_pk; 
	private String ad_id;
	private String ad_password;
	private String ad_nickname;
	private String ad_grade;
	public YNMAdmin() {}
	public YNMAdmin(int admin_info_pk, String ad_id, String ad_password, String ad_nickname, String ad_grade) {
		super();
		this.admin_info_pk = admin_info_pk;
		this.ad_id = ad_id;
		this.ad_password = ad_password;
		this.ad_nickname = ad_nickname;
		this.ad_grade = ad_grade;
	}
	public int getAdmin_info_pk() {
		return admin_info_pk;
	}
	public void setAdmin_info_pk(int admin_info_pk) {
		this.admin_info_pk = admin_info_pk;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_password() {
		return ad_password;
	}
	public void setAd_password(String ad_password) {
		this.ad_password = ad_password;
	}
	public String getAd_nickname() {
		return ad_nickname;
	}
	public void setAd_nickname(String ad_nickname) {
		this.ad_nickname = ad_nickname;
	}
	public String getAd_grade() {
		return ad_grade;
	}
	public void setAd_grade(String ad_grade) {
		this.ad_grade = ad_grade;
	}
}
