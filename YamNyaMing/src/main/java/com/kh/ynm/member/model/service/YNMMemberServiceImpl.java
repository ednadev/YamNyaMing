package com.kh.ynm.member.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.dao.YNMMemberDAO;
import com.kh.ynm.member.model.dao.YNMMemberDAOImpl;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMStoreReview;

@Service("ynmMemberService")
public class YNMMemberServiceImpl implements YNMMemberService{
	
	@Resource(name="ynmMemberDAO")
	private YNMMemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int signUpMember(YNMMember ym) {
		int result=memberDAO.signUpMember(sqlSession,ym);
		return result;
	}

	public YNMMember selectOneMember(YNMMember vo) {
		YNMMember ym=memberDAO.selectOneMember(sqlSession,vo);
		return ym;
		
	}

	public int signOutMember(YNMMember ym) {
		int result=memberDAO.signOutMember(sqlSession,ym);
		return result;
	}

	public int bookInsert(YNMBook yb) {
		int result=memberDAO.bookInsert(sqlSession,yb);
		return result;
		
	}

	public ArrayList bookselect(YNMBook vo) {
		ArrayList list=memberDAO.bookselect(sqlSession,vo);
		return list;
		
	}

	public YNMMember idCheck(String memberId) {
		YNMMember ym=memberDAO.idCheck(sqlSession,memberId);
		return ym;
	}

	public YNMMember nickCheck(String memberNickName) {
		YNMMember ym=memberDAO.nickCheck(sqlSession,memberNickName);
		return ym;
	}

	public int memberUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.memberUploadPhoto(sqlSession,ymup);
		return result;
	}

	public YNMMemberUploadPhoto memberIndexSelect(String remakeName) {
		YNMMemberUploadPhoto ymup=memberDAO.memberIndexSelect(sqlSession,remakeName);
		return ymup;
	}

	public int storeReviewInsert(YNMStoreReview ysr) {
		int result=memberDAO.storeReviewInsert(sqlSession,ysr);
		return result;
	}

	public int reviewUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.reviewUploadPhoto(sqlSession,ymup);
		return result;
	}

	public YNMMemberUploadPhoto reviewIndexSelect(String remakeName) {
		YNMMemberUploadPhoto ymup=memberDAO.reviewIndexSelect(sqlSession,remakeName);
		return ymup;
	}

	public YNMMemberCheck memberInfo(YNMMemberCheck vo) {
		YNMMemberCheck ymc=memberDAO.memberInfo(sqlSession,vo);
		return ymc;
	}

	public int updateUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.updateUploadPhoto(sqlSession,ymup);
		return result;
	}

	public int updateMember(YNMMember ym) {
		int result=memberDAO.updateMember(sqlSession,ym);
		return result;
	}


}
