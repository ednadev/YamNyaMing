package com.kh.ynm.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

public interface YNMAdminService {
	public int enrollAdmin(YNMAdmin vo);
	public YNMAdmin adminIdCheck(YNMAdmin vo);
	// 게시물 목록 표시(페이징)
	public List<Notice> writeList(int offset, int noOfRecords) throws Exception;
	// 전체 게시물 수 조회
	public int writeGetCount() throws Exception;
}
