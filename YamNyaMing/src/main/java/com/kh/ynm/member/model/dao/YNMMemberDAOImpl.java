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

import com.kh.ynm.member.model.vo.PagingTest;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchCheck;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMReviewLike;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.member.model.vo.pagingTest2;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

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

	public int boardCount(SqlSessionTemplate sqlSession, PagingTest pt) {
		return sqlSession.selectOne("underReview.pagingTest",pt);
	}

	public List<PagingTest> boardList(SqlSessionTemplate sqlSession, PagingTest pt) {
		List list=sqlSession.selectList("underReview.pagingTest2",pt);
		return list;
	}

	public int likeInsert(SqlSessionTemplate sqlSession, YNMReviewLike yrl) {
		return sqlSession.insert("review.likeInsert",yrl);
	}

	public int storeInfo(SqlSessionTemplate sqlSession, YNMReviewLike yrl) {
		return sqlSession.selectOne("review.likeChk",yrl);
	}

	public ArrayList<PagingTest> getCurrentPage(SqlSessionTemplate sqlSession, int currentPage,
			int recordCountPerPage) {
		int start=currentPage*recordCountPerPage-(recordCountPerPage-1);
		
		int end=currentPage*recordCountPerPage;
		
		pagingTest2 pt=new pagingTest2();
		pt.setStart(start);
		pt.setEnd(end);
		
		
		List list=sqlSession.selectList("underReview.pagingTest2",pt);
		System.out.println(list.size());

		return (ArrayList<PagingTest>)list;
	}

	public pagingTest2 getPageNavi(SqlSessionTemplate sqlSession, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		
		int recordTotalCount=0;
		recordTotalCount=sqlSession.selectOne("underReview.pagingTest");
		System.out.println(recordTotalCount);
		int pageTotalCount=0;
		
		if(recordTotalCount%recordCountPerPage!=0) {
			pageTotalCount=recordTotalCount/recordCountPerPage+1;
		}else {
			pageTotalCount=recordTotalCount/recordCountPerPage;
		}
		
		if(currentPage<1) {
			currentPage=1;
		}else if(currentPage>pageTotalCount) {
			currentPage=pageTotalCount;
		}
		
		int startNavi=((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		
		int endNavi=startNavi + naviCountPerPage -1;
		
		if(endNavi>pageTotalCount) {
			endNavi=pageTotalCount;
		}
		
		pagingTest2 qpd=new pagingTest2();
		qpd.setCurrentPage(currentPage);
		qpd.setEndNavi(endNavi);
		qpd.setStartNavi(startNavi);
		qpd.setPageTotalCount(pageTotalCount);
		qpd.setRecordTotalCount(recordTotalCount);
		
		return qpd;
	}
}
