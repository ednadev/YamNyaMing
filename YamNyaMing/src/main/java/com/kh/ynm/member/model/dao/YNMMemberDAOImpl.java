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
import com.kh.ynm.member.model.vo.YNMFollow;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberSetting;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMReviewJjim;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchPaging;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMReviewLike;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.member.model.vo.pgTest;
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
	public YNMMember emailCheck(SqlSessionTemplate sqlSession, String memberEmail) {
		return sqlSession.selectOne("member.emailCheck",memberEmail);
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

	public int likeInsert(SqlSessionTemplate sqlSession, YNMReviewLike yrl) {
		return sqlSession.insert("review.likeInsert",yrl);
	}

	public int likeChk(SqlSessionTemplate sqlSession, YNMReviewLike yrl) {
		return sqlSession.selectOne("review.likeChk",yrl);
	}

	public int likeTotal(SqlSessionTemplate sqlSession, int storeReviewNo) {
		return sqlSession.selectOne("review.likeTotal",storeReviewNo);
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, YNMReviewLike yrl) {
		return sqlSession.delete("review.likeDelete",yrl);
	}
	
	public String viewPath(SqlSessionTemplate sqlSession, int memberUploadPhotoNo) {
		return sqlSession.selectOne("photo.viewPath",memberUploadPhotoNo);
	}
	
	public int jjimChk(SqlSessionTemplate sqlSession, YNMReviewJjim yrj) {
		return sqlSession.selectOne("review.jjimChk",yrj);
	}
	
	public int jjimInsert(SqlSessionTemplate sqlSession, YNMReviewJjim yrj) {
		return sqlSession.insert("review.jjimInsert",yrj);
	}
	
	public int deletejjim(SqlSessionTemplate sqlSession, YNMReviewJjim yrj) {
		return sqlSession.delete("review.deleteJjim",yrj);
	}
	
	public int followChk(SqlSessionTemplate sqlSession, YNMFollow yf) {
		return sqlSession.selectOne("member.followChk",yf);
	}
	
	public int deletefollow(SqlSessionTemplate sqlSession, YNMFollow yf) {
		return sqlSession.delete("member.deleteFollow",yf);
	}
	
	public int followInsert(SqlSessionTemplate sqlSession, YNMFollow yf) {
		return sqlSession.insert("member.followInsert",yf);
	}
	
	public int reviewUploadPhoto(SqlSessionTemplate sqlSession, YNMMemberUploadPhoto ymup) {
		return sqlSession.insert("photo.reviewPhoto",ymup);
		
	}
	public YNMMember idSearch(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.selectOne("member.idSearch",vo);
	}

	public YNMMember pwSearch(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.selectOne("member.pwSearch",vo);
	}

	public int pwUpdateMember(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.update("member.pwUpdateMember",vo);
	}

	public int updateSetting(SqlSessionTemplate sqlSession, YNMMemberSetting yms) {
		return sqlSession.update("member.updateSetting",yms);
	}

	public YNMMemberSetting settingInfo(SqlSessionTemplate sqlSession, int memberEntireNo) {
		return sqlSession.selectOne("member.settingInfo",memberEntireNo);
	}
	
	public ArrayList<YNMSearch> getCurrentPage(SqlSessionTemplate sqlSession, int currentPage, int recordCountPerPage,
			YNMSearchPaging check) {
		int start=currentPage*recordCountPerPage-(recordCountPerPage-1);
		
		int end=currentPage*recordCountPerPage;
		
		check.setStart(start);
		check.setEnd(end);
		
		
		List list=sqlSession.selectList("search.searchList",check);

		return (ArrayList<YNMSearch>)list;
	}

	public YNMSearchPaging getPageNavi(SqlSessionTemplate sqlSession, int currentPage, int recordCountPerPage,
			int naviCountPerPage, YNMSearchPaging check) {
		int recordTotalCount=0;
		recordTotalCount=sqlSession.selectOne("search.searchCount",check);
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
	
		YNMSearchPaging sp =new YNMSearchPaging();
		sp.setCurrentPage(currentPage);
		sp.setEndNavi(endNavi);
		sp.setStartNavi(startNavi);
		sp.setPageTotalCount(pageTotalCount);
		sp.setRecordTotalCount(recordTotalCount);
		
		return sp;
	}

	public YNMSearch detailPage(SqlSessionTemplate sqlSession, YNMSearch vo) {
		return sqlSession.selectOne("search.detailPage",vo);
	}

	public ArrayList<YNMSearch> detailPageImg(SqlSessionTemplate sqlSession, YNMSearch vo) {
		List list = sqlSession.selectList("search.detailPageImg",vo);
		return (ArrayList<YNMSearch>)list;
	}	

}
