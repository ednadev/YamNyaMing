package com.kh.ynm.owner.model.vo;

import java.sql.Date;

public class StoreBoardData {
	private int owBoarInfoPk;
	private String owBoardTitle;
	private String owBoardContent;
	private Date owEnrollDate;
	private int owStoreInfoFk;
	
	public StoreBoardData() {}
	
	public StoreBoardData(int owBoarInfoPk, String owBoardTitle, String owBoardContent, Date owEnrollDate,
			int owStoreInfoFk) {
		super();
		this.owBoarInfoPk = owBoarInfoPk;
		this.owBoardTitle = owBoardTitle;
		this.owBoardContent = owBoardContent;
		this.owEnrollDate = owEnrollDate;
		this.owStoreInfoFk = owStoreInfoFk;
	}

	public int getOwBoarInfoPk() {
		return owBoarInfoPk;
	}

	public void setOwBoarInfoPk(int owBoarInfoPk) {
		this.owBoarInfoPk = owBoarInfoPk;
	}

	public String getOwBoardTitle() {
		return owBoardTitle;
	}

	public void setOwBoardTitle(String owBoardTitle) {
		this.owBoardTitle = owBoardTitle;
	}

	public String getOwBoardContent() {
		return owBoardContent;
	}

	public void setOwBoardContent(String owBoardContent) {
		this.owBoardContent = owBoardContent;
	}

	public Date getOwEnrollDate() {
		return owEnrollDate;
	}

	public void setOwEnrollDate(Date owEnrollDate) {
		this.owEnrollDate = owEnrollDate;
	}

	public int getOwStoreInfoFk() {
		return owStoreInfoFk;
	}

	public void setOwStoreInfoFk(int owStoreInfoFk) {
		this.owStoreInfoFk = owStoreInfoFk;
	}
	
	
	
}
