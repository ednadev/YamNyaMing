package com.kh.ynm.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Repository("ynmMemberDAO")
public class YNMMemberDAOImpl implements YNMMemberDAO{

	public int signUpMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.insert("member.signUpMember",ym);
	}

	public YNMMember selectOneMember(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.selectOne("member.selectOneMember",vo);
	}

	public int signOutMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.delete("member.deleteMember",ym);
	}

	public int bookInsert(SqlSessionTemplate sqlSession, YNMBook yb) {
		return sqlSession.insert("book.bookInfo",yb);
	}

	public ArrayList<YNMBook> bookselect(SqlSessionTemplate sqlSession, YNMBook vo) {
		List list=sqlSession.selectList("book.bookCheck",vo);
		return (ArrayList<YNMBook>)list;
	}

	public YNMMember idCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("member.idCheck",memberId);
	}

	public YNMMember nickCheck(SqlSessionTemplate sqlSession, String memberNickName) {
		return sqlSession.selectOne("member.nickCheck",memberNickName);
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

	public int reviewUploadPhoto(SqlSessionTemplate sqlSession, YNMMemberUploadPhoto ymup) {
		return sqlSession.insert("photo.reviewPhoto",ymup);
	}

	public YNMMemberUploadPhoto reviewIndexSelect(SqlSessionTemplate sqlSession, String remakeName) {
		return sqlSession.selectOne("photo.indexSearch",remakeName);
	}

	public YNMMemberCheck memberInfo(SqlSessionTemplate sqlSession, YNMMemberCheck vo) {
		return sqlSession.selectOne("member.memberInfo",vo);
	}

	public int updateUploadPhoto(SqlSessionTemplate sqlSession, YNMMemberUploadPhoto ymup) {
		return sqlSession.insert("photo.updatePhoto",ymup);
	}

	public int updateMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.insert("member.updateMember",ym);
	}

	public ArrayList<YNMStoreReview> storeReviewCheck(SqlSessionTemplate sqlSession, int ownerStoreEntireNo) {
		List list=sqlSession.selectList("review.storeReviewCheck",ownerStoreEntireNo);
		return (ArrayList<YNMStoreReview>) list;
	}

	public YNMStoreInfo storeInfo(SqlSessionTemplate sqlSession, int ownerStoreEntireNo) {
		return sqlSession.selectOne("member.selectOneStore",ownerStoreEntireNo);
	}

	public ArrayList<YNMMemberUploadPhoto> reviewImageList(SqlSessionTemplate sqlSession, String[] imgArr) {
		List list=sqlSession.selectList("photo.storeReviewPhoto",imgArr);
		return (ArrayList<YNMMemberUploadPhoto>) list;
	}

	public int storeUnderReviewInsert(SqlSessionTemplate sqlSession, YNMStoreUnderReview ysur) {
		return sqlSession.insert("underReview.storeUnderReviewInsert",ysur);
	}
	
}
