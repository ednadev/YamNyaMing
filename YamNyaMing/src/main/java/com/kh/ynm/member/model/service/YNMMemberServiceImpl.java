package com.kh.ynm.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.dao.YNMMemberDAO;
import com.kh.ynm.member.model.dao.YNMMemberDAOImpl;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMFollow;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberSetting;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMReviewJjim;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchCheck;
import com.kh.ynm.member.model.vo.YNMReviewLike;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.member.model.vo.pgTest;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Service("ynmMemberService")
public class YNMMemberServiceImpl implements YNMMemberService{
	
	@Resource(name="ynmMemberDAO")
	private YNMMemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입
	public int signUpMember(YNMMember ym) {
		int result=memberDAO.signUpMember(sqlSession,ym);
		return result;
	}
	//로그인 
	public YNMMember selectOneMember(YNMMember vo) {
		YNMMember ym=memberDAO.selectOneMember(sqlSession,vo);
		return ym;
		
	}
	//회원 탈퇴
	public int signOutMember(YNMMember ym) {
		int result=memberDAO.signOutMember(sqlSession,ym);
		return result;
	}
	//예약하기
	public int bookInsert(YNMBook yb) {
		int result=memberDAO.bookInsert(sqlSession,yb);
		return result;
		
	}
	//예약정보 가져오기
	public ArrayList bookselect(YNMBook vo) {
		ArrayList list=memberDAO.bookselect(sqlSession,vo);
		return list;
		
	}
	//아이디 유효성
	public YNMMember idCheck(String memberId) {
		YNMMember ym=memberDAO.idCheck(sqlSession,memberId);
		return ym;
	}
	//닉네임 유효성
	public YNMMember nickCheck(String memberNickName) {
		YNMMember ym=memberDAO.nickCheck(sqlSession,memberNickName);
		return ym;
	}
	//이메일 유효성
	public YNMMember emailCheck(String memberEmail) {
		YNMMember ym=memberDAO.emailCheck(sqlSession,memberEmail);
		return ym;
	}
	
	//사용자 아바타 사진 등록
	public int memberUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.memberUploadPhoto(sqlSession,ymup);
		return result;
	}
	//등록한 아바타 사진 인덱스 가져오기
	public YNMMemberUploadPhoto memberIndexSelect(String remakeName) {
		YNMMemberUploadPhoto ymup=memberDAO.memberIndexSelect(sqlSession,remakeName);
		return ymup;
	}
	//리뷰 등록
	public int storeReviewInsert(YNMStoreReview ysr) {
		int result=memberDAO.storeReviewInsert(sqlSession,ysr);
		return result;
	}
	//사용자 리뷰 사진 등록
	public int reviewUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.reviewUploadPhoto(sqlSession,ymup);
		return result;
	}
	//등록한 리뷰 사진 인덱스 가져오기
	public YNMMemberUploadPhoto reviewIndexSelect(String remakeName) {
		YNMMemberUploadPhoto ymup=memberDAO.reviewIndexSelect(sqlSession,remakeName);
		return ymup;
	}
	//내정보 보기
	public YNMMemberCheck memberInfo(YNMMemberCheck vo) {
		YNMMemberCheck ymc=memberDAO.memberInfo(sqlSession,vo);
		return ymc;
	}
	//내정보 아바타 사진 업데이트
	public int updateUploadPhoto(YNMMemberUploadPhoto ymup) {
		int result=memberDAO.updateUploadPhoto(sqlSession,ymup);
		return result;
	}
	//내정보 text 업데이트
	public int updateMember(YNMMember ym) {
		int result=memberDAO.updateMember(sqlSession,ym);
		return result;
	}
	//가게 정보 가져오기
	public YNMStoreInfo storeInfo(int ownerStoreEntireNo) {
		YNMStoreInfo ysi=memberDAO.storeInfo(sqlSession,ownerStoreEntireNo);
		return ysi;
	}
	//가게 등록한 댓글 불러오기
	public ArrayList<YNMStoreReview> storeReviewCheck(int ownerStoreEntireNo) {
		ArrayList<YNMStoreReview> ysrList=memberDAO.storeReviewCheck(sqlSession,ownerStoreEntireNo);
		return ysrList;
	}
	//댓글에 따른 이미지 불러오기
	public ArrayList<YNMMemberUploadPhoto> reviewImageList(String[] imgArr) {
		ArrayList<YNMMemberUploadPhoto> imgList = memberDAO.reviewImageList(sqlSession,imgArr);
		return imgList;
	}
	//대댓글 등록
	public int storeUnderReviewInsert(YNMStoreUnderReview ysur) {
		int result=memberDAO.storeUnderReviewInsert(sqlSession,ysur);
		return result;
	}
	//댓글 좋아요 insert
	public int likeInsert(YNMReviewLike yrl) {
		int result=memberDAO.likeInsert(sqlSession,yrl);
		return result;
	}
	//댓글 좋아요 중복 체크
	public int likeChk(YNMReviewLike yrl) {
		int likeChk=memberDAO.likeChk(sqlSession,yrl);
		return likeChk;
	}
	public ArrayList<YNMSearch> search(YNMSearchCheck check) {
		ArrayList<YNMSearch> list = memberDAO.search(sqlSession, check);
		return list;
	}
	//댓글 좋아요 총수
	public int likeTotal(int storeReviewNo) {
		int likeTotal=memberDAO.likeTotal(sqlSession,storeReviewNo);
		return likeTotal;
	}
	//댓글 좋아요 취소
	public int deleteLike(YNMReviewLike yrl) {
		int result=memberDAO.deleteLike(sqlSession,yrl);
		return result;
	}
	//내정보 이미지 불러오기
	public String viewPath(int memberUploadPhotoNo) {
		String viewPath=memberDAO.viewPath(sqlSession,memberUploadPhotoNo);
		return viewPath;
	}
	//찜 체크
	public int jjimChk(YNMReviewJjim yrj) {
		int jjimChk=memberDAO.jjimChk(sqlSession,yrj);
		return jjimChk;
	}
	//찜 하기
	public int jjimInsert(YNMReviewJjim yrj) {
		int result=memberDAO.jjimInsert(sqlSession,yrj);
		return result;
	}
	//찜 취소
	public int deletejjim(YNMReviewJjim yrj) {
		int result=memberDAO.deletejjim(sqlSession,yrj);
		return result;
	}
	//팔로우 체크
	public int followChk(YNMFollow yf) {
		int followChk=memberDAO.followChk(sqlSession,yf);
		return followChk;
	}
	//팔로우 해제
	public int deletefollow(YNMFollow yf) {
		int deletefollow=memberDAO.deletefollow(sqlSession,yf);
		return deletefollow;
	}
	//팔로우 등록
	public int followInsert(YNMFollow yf) {
		int result=memberDAO.followInsert(sqlSession,yf);
		return result;
	}
	//아이디 찾기
	public YNMMember idSearch(YNMMember vo) {
		YNMMember ym=memberDAO.idSearch(sqlSession,vo);
		return ym;
	}
	public YNMMember pwSearch(YNMMember vo) {
		YNMMember ym=memberDAO.pwSearch(sqlSession,vo);
		return ym;
	}
	public int pwUpdateMember(YNMMember vo) {
		int result=memberDAO.pwUpdateMember(sqlSession,vo);
		return result;
	}
	public int updateSetting(YNMMemberSetting yms) {
		int result=memberDAO.updateSetting(sqlSession,yms);
		return result;
	}
	public YNMMemberSetting settingInfo(int memberEntireNo) {
		YNMMemberSetting yms=memberDAO.settingInfo(sqlSession,memberEntireNo);
		return yms;
	}

	
}
