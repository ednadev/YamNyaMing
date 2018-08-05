package com.kh.ynm.member.model.vo;

import java.sql.Date;

public class YNMBook {
	private int bookNo;
	private int memberEntireNo;
	private int storeEntireNo;
	private Date bookDate;
	private String bookDate2;
	private int bookOrderCount;
	private int bookPartyCount;
	private String bookType;
	private String bookOption;
	private String bookState;
	private int bookDeposit;
	private String bookName;
	private Date bookDateAndTime;
	private String bookDateAndTime2;
	
	
	public YNMBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public YNMBook(int bookNo, int memberEntireNo, int storeEntireNo, Date bookDate, String bookDate2,
			int bookOrderCount, int bookPartyCount, String bookType, String bookOption, String bookState,
			int bookDeposit, String bookName, Date bookDateAndTime, String bookDateAndTime2) {
		super();
		this.bookNo = bookNo;
		this.memberEntireNo = memberEntireNo;
		this.storeEntireNo = storeEntireNo;
		this.bookDate = bookDate;
		this.bookDate2 = bookDate2;
		this.bookOrderCount = bookOrderCount;
		this.bookPartyCount = bookPartyCount;
		this.bookType = bookType;
		this.bookOption = bookOption;
		this.bookState = bookState;
		this.bookDeposit = bookDeposit;
		this.bookName = bookName;
		this.bookDateAndTime = bookDateAndTime;
		this.bookDateAndTime2 = bookDateAndTime2;
	}

	

	public String getBookDateAndTime2() {
		return bookDateAndTime2;
	}


	public void setBookDateAndTime2(String bookDateAndTime2) {
		this.bookDateAndTime2 = bookDateAndTime2;
	}


	public Date getBookDateAndTime() {
		return bookDateAndTime;
	}



	public void setBookDateAndTime(Date bookDateAndTime) {
		this.bookDateAndTime= bookDateAndTime;
	}



	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
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
	
	public int getStoreEntireNo() {
		return storeEntireNo;
	}



	public void setStoreEntireNo(int storeEntireNo) {
		this.storeEntireNo = storeEntireNo;
	}



	public int getMemberEntireNo() {
		return memberEntireNo;
	}
	public void setMemberEntireNo(int memberEntire) {
		this.memberEntireNo = memberEntire;
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
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	public int getBookDeposit() {
		return bookDeposit;
	}
	public void setBookDeposit(int bookDeposit) {
		this.bookDeposit = bookDeposit;
	}
	
	
	
}
