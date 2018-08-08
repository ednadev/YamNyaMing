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
	private char bookState;
	private int bookDeposit;
	private String bookName;
	private Date bookDateAndTime;
	private String bookDateAndTime2;
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreName;
	private String owStoreTip;
	private String owPhotoRoute;
	private String owRemakeName;
	private String owPhotoViewRoute;
	private float storeStarPoint;
	private int bookTotal;
	
	
	
	
	
	public int getBookTotal() {
		return bookTotal;
	}


	public void setBookTotal(int bookTotal) {
		this.bookTotal = bookTotal;
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


	public String getOwStoreName() {
		return owStoreName;
	}


	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}


	public String getOwStoreTip() {
		return owStoreTip;
	}


	public void setOwStoreTip(String owStoreTip) {
		this.owStoreTip = owStoreTip;
	}


	public String getOwPhotoRoute() {
		return owPhotoRoute;
	}


	public void setOwPhotoRoute(String owPhotoRoute) {
		this.owPhotoRoute = owPhotoRoute;
		setOwPhotoViewRoute(this.owPhotoRoute);
	}


	public String getOwRemakeName() {
		return owRemakeName;
	}


	public void setOwRemakeName(String owRemakeName) {
		this.owRemakeName = owRemakeName;
	}


	public String getOwPhotoViewRoute() {
		return owPhotoViewRoute;
	}


	public float getStoreStarPoint() {
		return storeStarPoint;
	}


	public void setStoreStarPoint(float storeStarPoint) {
		this.storeStarPoint = storeStarPoint;
	}


	public YNMBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public YNMBook(int bookNo, int memberEntireNo, int storeEntireNo, Date bookDate, String bookDate2,
			int bookOrderCount, int bookPartyCount, String bookType, String bookOption, char bookState,
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
	
	
	public void setOwPhotoViewRoute(String owPhotoViewRoute) {
		String[] arrTest1 = owPhotoViewRoute.split("\\\\");
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
		this.owPhotoViewRoute = sb.toString();
	}
	
}
