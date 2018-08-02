package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.admin.model.vo.BoardPaging;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;

public interface YNMAdminDAO {
	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession);
	 

	ArrayList<Notice> noticeListPaging(SqlSessionTemplate sqlSession, BoardPaging noticePageData);

	int noticeGetTotal(SqlSessionTemplate sqlSession, BoardPaging noticePageData);
}
