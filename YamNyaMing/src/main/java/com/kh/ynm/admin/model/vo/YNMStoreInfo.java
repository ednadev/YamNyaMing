package com.kh.ynm.admin.model.vo;

public class YNMStoreInfo {
	
	private String name;  //가게이름
	private int book;     //가게예약수
	private int grade;    //가게평점
	private int jjim; 	  //즐겨찾기수
	private int favorite; //좋아요 수
	YNMStoreInfo() {}
	public YNMStoreInfo(String name, int book, int grade, int jjim, int favorite) {
		super();
		this.name = name;
		this.book = book;
		this.grade = grade;
		this.jjim = jjim;
		this.favorite = favorite;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBook() {
		return book;
	}
	public void setBook(int book) {
		this.book = book;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getJjim() {
		return jjim;
	}
	public void setJjim(int jjim) {
		this.jjim = jjim;
	}
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	
}
