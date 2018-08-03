package com.kh.ynm.admin.model.vo;

import java.sql.Date;

public class Notice {
private int noticeNo;
private String subject;
private String contents;
private String userId;
private String userNickname;
private Date regDate;
public Notice() {}
public Notice(int noticeNo, String subject, String contents, String userId, String userNickname, Date regDate) {
	super();
	this.noticeNo = noticeNo;
	this.subject = subject;
	this.contents = contents;
	this.userId = userId;
	this.userNickname = userNickname;
	this.regDate = regDate;
}
public int getNoticeNo() {
	return noticeNo;
}
public void setNoticeNo(int noticeNo) {
	this.noticeNo = noticeNo;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserNickname() {
	return userNickname;
}
public void setUserNickname(String userNickname) {
	this.userNickname = userNickname;
}
public Date getRegDate() {
	return regDate;
}
public void setRegDate(Date regDate) {
	this.regDate = regDate;
}


}
