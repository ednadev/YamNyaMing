package com.kh.ynm.member.model.vo;

import java.util.ArrayList;

import edu.emory.mathcs.backport.java.util.Collections;

public class YNMSearchPaging {
	String keyword;
	String food;
	String place;
	ArrayList<String> storeCateDetailName;
	ArrayList<String> owBudget;
	ArrayList<String> owSubInfo;
	ArrayList<String> owDrinkListInfo;

	int start;
	int end;
	private ArrayList<YNMSearch> noticelist = new ArrayList<YNMSearch>();
	private String pageNavi;
	private int startNavi;
	private int endNavi;
	private int currentPage;
	private int pageTotalCount;
	private int recordTotalCount;
	public YNMSearchPaging() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearchPaging(String keyword, String food, String place, ArrayList<String> storeCateDetailName, ArrayList<String> owBudget,
			ArrayList<String> owSubInfo, ArrayList<String> owDrinkListInfo, int start, int end, ArrayList<YNMSearch> noticelist,
			String pageNavi, int startNavi, int endNavi, int currentPage, int pageTotalCount, int recordTotalCount) {
		this.keyword = keyword;
		this.food = food;
		this.place = place;
		this.storeCateDetailName = storeCateDetailName;
		this.owBudget = owBudget;
		this.owSubInfo = owSubInfo;
		this.owDrinkListInfo = owDrinkListInfo;
		this.start = start;
		this.end = end;
		this.noticelist = noticelist;
		this.pageNavi = pageNavi;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.currentPage = currentPage;
		this.pageTotalCount = pageTotalCount;
		this.recordTotalCount = recordTotalCount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public ArrayList<String> getStoreCateDetailName() {
		return storeCateDetailName;
	}
	public void setStoreCateDetailName(ArrayList<String> storeCateDetailNameList) {
		this.storeCateDetailName = storeCateDetailNameList;
	}
	public ArrayList<String> getOwBudget() {
		return owBudget;
	}
	public void setOwBudget(ArrayList<String> owBudget) {
		this.owBudget = owBudget;
	}
	public ArrayList<String> getOwSubInfo() {
		return owSubInfo;
	}
	public void setOwSubInfo(ArrayList<String> owSubInfo) {
		this.owSubInfo = owSubInfo;
	}
	public ArrayList<String> getOwDrinkListInfo() {
		return owDrinkListInfo;
	}
	public void setOwDrinkListInfo(ArrayList<String> owDrinkListInfo) {
		this.owDrinkListInfo = owDrinkListInfo;
	}
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
	public ArrayList<YNMSearch> getNoticelist() {
		return noticelist;
	}
	public void setNoticelist(ArrayList<YNMSearch> noticelist) {
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