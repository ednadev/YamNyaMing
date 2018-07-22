package com.kh.ynm.member.model.vo;

public class YNMSearchCheck {
	String keyword;
	String food;
	String place;
	String [] storeCateDetailName;
	String [] owBudget;
	String [] owSubInfo;
	String [] owDrinkListInfo;
	public YNMSearchCheck() {
		// TODO Auto-generated constructor stub
	}
	public YNMSearchCheck(String keyword, String food, String place, String[] storeCateDetailName, String[] owBudget,
			String[] owSubInfo, String[] owDrinkListInfo) {
		this.keyword = keyword;
		this.food = food;
		this.place = place;
		this.storeCateDetailName = storeCateDetailName;
		this.owBudget = owBudget;
		this.owSubInfo = owSubInfo;
		this.owDrinkListInfo = owDrinkListInfo;
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
	public String[] getStoreCateDetailName() {
		return storeCateDetailName;
	}
	public void setStoreCateDetailName(String[] storeCateDetailName) {
		this.storeCateDetailName = storeCateDetailName;
	}
	public String[] getOwBudget() {
		return owBudget;
	}
	public void setOwBudget(String[] owBudget) {
		this.owBudget = owBudget;
	}
	public String[] getOwSubInfo() {
		return owSubInfo;
	}
	public void setOwSubInfo(String[] owSubInfo) {
		this.owSubInfo = owSubInfo;
	}
	public String[] getOwDrinkListInfo() {
		return owDrinkListInfo;
	}
	public void setOwDrinkListInfo(String[] owDrinkListInfo) {
		this.owDrinkListInfo = owDrinkListInfo;
	}
	
}
