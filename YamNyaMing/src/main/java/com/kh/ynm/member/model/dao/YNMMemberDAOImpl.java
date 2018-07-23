package com.kh.ynm.member.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchCheck;
import com.kh.ynm.member.model.vo.YNMStoreReview;

@Repository("ynmMemberDAO")
public class YNMMemberDAOImpl implements YNMMemberDAO{

	public int signUpMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.insert("members.signUpMember",ym);
	}

	public YNMMember selectOneMember(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.selectOne("members.selectOneMember",vo);
	}

	public int signOutMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.delete("members.deleteMember",ym);
	}

	public int bookInsert(SqlSessionTemplate sqlSession, YNMBook yb) {
		return sqlSession.insert("book.bookInfo",yb);
	}

	public ArrayList<YNMBook> bookselect(SqlSessionTemplate sqlSession, YNMBook vo) {
		List list=sqlSession.selectList("book.bookCheck",vo);
		return (ArrayList<YNMBook>)list;
	}

	public YNMMember idCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("members.idCheck",memberId);
	}

	public YNMMember nickCheck(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("members.nickCheck",memberNickName);
	}

	public int memberUploadPhoto(SqlSessionTemplate sqlSession, YNMMemberUploadPhoto ymup) {
		return sqlSession.insert("photo.avatarPhoto",ymup);
	}

	public YNMMemberUploadPhoto memberIndexSelect(SqlSessionTemplate sqlSession, String remakeName) {
		return sqlSession.selectOne("photo.indexSearch",remakeName);
	}

	public int storeReviewInsert(SqlSessionTemplate sqlSession, YNMStoreReview ysr) {
		return sqlSession.insert("review.storeReviewInsert",ysr);
	}

	public ArrayList<YNMSearch> search(SqlSessionTemplate sqlSession, YNMSearchCheck check) {
		List list = sqlSession.selectList("search.searchList",check);
		return (ArrayList<YNMSearch>)list;
	}

}
