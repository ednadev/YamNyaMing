package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMBook {
	private int bookNo;
	private int memberEntireNo;
	private int ownerEntireNo;
	private Date bookDate;
	private String bookDate2;
	private int bookOrderCount;
	private int bookPartyCount;
	private String bookType;
	private String bookOption;
	private char bookState;
	private int bookDeposit;
	
	
	
	public YNMBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public YNMBook(int bookNo, int memberEntireNo, int ownerEntireNo, Date bookDate, int bookOrderCount, int bookPartyCount,
			String bookType, String bookOption, char bookState, int bookDeposit) {
		super();
		this.bookNo = bookNo;
		this.memberEntireNo = memberEntireNo;
		this.ownerEntireNo = ownerEntireNo;
		this.bookDate = bookDate;
		this.bookOrderCount = bookOrderCount;
		this.bookPartyCount = bookPartyCount;
		this.bookType = bookType;
		this.bookOption = bookOption;
		this.bookState = bookState;
		this.bookDeposit = bookDeposit;
	}
	
	
	
	public String getBookDate2() {
		return bookDate2;
	}
	public void setBookDate2(String bookDate2) {
		this.bookDate2 = bookDate2;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntire) {
		this.memberEntireNo = memberEntire;
	}
	
	public int getOwnerEntireNo() {
		return ownerEntireNo;
	}
	public void setOwnerEntireNo(int ownerEntireNo) {
		this.ownerEntireNo = ownerEntireNo;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public int getBookOrderCount() {
		return bookOrderCount;
	}
	public void setBookOrderCount(int bookOrderCount) {
		this.bookOrderCount = bookOrderCount;
	}
	public int getBookPartyCount() {
		return bookPartyCount;
	}
	public void setBookPartyCount(int bookPartyCount) {
		this.bookPartyCount = bookPartyCount;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	public String getBookOption() {
		return bookOption;
	}
	public void setBookOption(String bookOption) {
		this.bookOption = bookOption;
	}
	public char getBookState() {
		return bookState;
	}
	public void setBookState(char bookState) {
		this.bookState = bookState;
	}
	public int getBookDeposit() {
		return bookDeposit;
	}
	public void setBookDeposit(int bookDeposit) {
		this.bookDeposit = bookDeposit;
	}
	
	
	
}
