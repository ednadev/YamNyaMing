package com.kh.ynm.member.model.vo;

import java.util.ArrayList;

public class pagingTest2 {
	int start;
	int end;
	private ArrayList<PagingTest> noticelist;
	private String pageNavi;
	private int startNavi;
	private int endNavi;
	private int currentPage;
	private int pageTotalCount;
	private int recordTotalCount;
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public ArrayList<PagingTest> getNoticelist() {
		return noticelist;
	}
	public void setNoticelist(ArrayList<PagingTest> noticelist) {
		this.noticelist = noticelist;
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
	
	
}
