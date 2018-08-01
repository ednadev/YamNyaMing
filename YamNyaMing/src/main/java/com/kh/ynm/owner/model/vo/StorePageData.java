package com.kh.ynm.owner.model.vo;

import java.util.ArrayList;

public class StorePageData {
	private int startPage;
	private int endPage;
	private String pageNavi;
	private int startNavi;
	private int endNavi;
	private int currentPage;
	private int pageTotalCount;
	private int recordTotalCount;
	private int owEntirePk;
	
	public StorePageData() {}

	public StorePageData(int startPage, int endPage, String pageNavi, int startNavi, int endNavi, int currentPage,
			int pageTotalCount, int recordTotalCount, int owEntirePk) {
		super();
		this.startPage = startPage;
		this.endPage = endPage;
		this.pageNavi = pageNavi;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.currentPage = currentPage;
		this.pageTotalCount = pageTotalCount;
		this.recordTotalCount = recordTotalCount;
		this.owEntirePk = owEntirePk;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getRecordTotalCount() {
		return recordTotalCount;
	}

	public void setRecordTotalCount(int recordTotalCount) {
		this.recordTotalCount = recordTotalCount;
	}

	public int getOwEntirePk() {
		return owEntirePk;
	}

	public void setOwEntirePk(int owEntirePk) {
		this.owEntirePk = owEntirePk;
	}
	 
    
	
	
}
