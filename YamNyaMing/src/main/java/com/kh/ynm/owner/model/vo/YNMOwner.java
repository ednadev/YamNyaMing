package com.kh.ynm.owner.model.vo;

import java.sql.Date;

public class YNMOwner {
	private int owEntirePk;
	private String owId;
	private String owPw;
	private String owName;
	private String owEmail;
	private String phone;
	private String owBankAccount;
	private Date owRegDate;
	
	public YNMOwner() {}
	
	public YNMOwner(int owEntirePk, String owId, String owPw, String owName, String owEmail, String phone,
			String owBankAccount, Date owRegDate) {
		super();
		this.owEntirePk = owEntirePk;
		this.owId = owId;
		this.owPw = owPw;
		this.owName = owName;
		this.owEmail = owEmail;
		this.phone = phone;
		this.owBankAccount = owBankAccount;
		this.owRegDate = owRegDate;
	}
	public int getOwEntirePk() {
		return owEntirePk;
	}
	public void setOwEntirePk(int owEntirePk) {
		this.owEntirePk = owEntirePk;
	}
	public String getOwId() {
		return owId;
	}
	public void setOwId(String owId) {
		this.owId = owId;
	}
	public String getOwPw() {
		return owPw;
	}
	public void setOwPw(String owPw) {
		this.owPw = owPw;
	}
	public String getOwName() {
		return owName;
	}
	public void setOwName(String owName) {
		this.owName = owName;
	}
	public String getOwEmail() {
		return owEmail;
	}
	public void setOwEmail(String owEmail) {
		this.owEmail = owEmail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOwBankAccount() {
		return owBankAccount;
	}
	public void setOwBankAccount(String owBankAccount) {
		this.owBankAccount = owBankAccount;
	}
	public Date getOwRegDate() {
		return owRegDate;
	}
	public void setOwRegDate(Date owRegDate) {
		this.owRegDate = owRegDate;
	}
	
	
}