package com.kh.ynm.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.admin.model.dao.YNMAdminDAO;
import com.kh.ynm.admin.model.dao.YNMAdminDAOImpl;
import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.BoardPaging;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Service("YNMAdminService")
public class YNMAdminServiceImpl implements YNMAdminService{
	@Resource(name="YNMAdminDAO")
	private YNMAdminDAOImpl adminDAO;

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	//점주 검색
	public ArrayList<YNMOwner> OwnerSearch(String combo, String keyword) {
		ArrayList<YNMOwner> list = adminDAO.OwnerSearch(sqlSession,combo,keyword);
		return list;
	}

	//일반 사용자 검색
	public ArrayList<YNMMember>  MemberSearch(String combo, String keyword) {
		ArrayList<YNMMember>list = adminDAO.MemberSearch(sqlSession,combo,keyword);
		return list;
	}

	//관리자 회원가입
	public int enrollAdmin(YNMAdmin vo) {
		int result = adminDAO.insertAdmin(vo,sqlSession);
		if(result>0){return result;}
		else {return 0;}
	}

	//관리자 가입 아이디 중복확인
    public YNMAdmin adminIdCheck(YNMAdmin vo) {
    	YNMAdmin yd = adminDAO.adminIdCheck(sqlSession,vo);
        return yd;
    }

   
	//게시판 목록
	public ArrayList<Notice> noticeListPaging(int currentPage,int recordCountPerPage)
	{
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		BoardPaging noticePageData = new BoardPaging();
		noticePageData.setStartPage(start);
		noticePageData.setEndPage(end);
		return adminDAO.noticeListPaging(sqlSession,noticePageData);
	}
	//일반 사용자 전체보기
	public ArrayList<YNMMember> memberListPaging(int currentPage, int recordCountPerPage) 
	{
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		BoardPaging memberPageData = new BoardPaging();
		memberPageData.setStartPage(start);
		memberPageData.setEndPage(end);
		return adminDAO.memberListPaging(sqlSession,memberPageData);
	}
	//점주 전체보기
	public ArrayList<YNMOwner> ownerListPaging(int currentPage, int recordCountPerPage)
	{
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		BoardPaging ownerPageData = new BoardPaging();
		ownerPageData.setStartPage(start);
		ownerPageData.setEndPage(end);
		return adminDAO.ownerListPaging(sqlSession,ownerPageData);		
	}
	//가게리스트
	public ArrayList<StoreInfoPageData> storeListPaging(int currentPage, int recordCountPerPage, StoreInfoPageData vo)
	{
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		BoardPaging storePageData = new BoardPaging();
		storePageData.setOwEntirePk(vo.getOwEntireFk());
		storePageData.setStartPage(start);
		storePageData.setEndPage(end);
		return adminDAO.storeListPaging(sqlSession,storePageData);
	}
	//관리자 리스트
	public ArrayList<YNMAdmin> adminListPaging(int currentPage, int recordCountPerPage) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		BoardPaging adminPageData = new BoardPaging();
		adminPageData.setStartPage(start);
		adminPageData.setEndPage(end);
		return adminDAO.adminListPaging(sqlSession,adminPageData);
	}
	//점주목록 페이징
	public CouponPageData ownerGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage) {
		BoardPaging ownerPageData = new BoardPaging();
		int recordTotalCount = adminDAO.ownerGetTotal(sqlSession, ownerPageData);
		int pageTotalCount = 0;
		if(recordTotalCount%recordCountPerPage!=0)
		{
		pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}
		else
		{
		pageTotalCount = recordTotalCount / recordCountPerPage;
		}

			if(currentPage<1)
			{
				currentPage = 1;
			}else if(currentPage>pageTotalCount)
			{
				currentPage = pageTotalCount;					
			}

			int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
			int endNavi = startNavi+naviCountPerPage-1;
			
			if(endNavi>pageTotalCount)
			{
				endNavi = pageTotalCount;
			}
			CouponPageData ownerPageDataResult = new CouponPageData();
			ownerPageDataResult.setCurrentPage(currentPage);
			ownerPageDataResult.setStartNavi(startNavi);
			ownerPageDataResult.setEndNavi(endNavi);
			ownerPageDataResult.setPageTotalCount(pageTotalCount);
			ownerPageDataResult.setRecordTotalCount(recordTotalCount);
			
			return ownerPageDataResult;
		}

	//게시판 페이징
	public CouponPageData noticeGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage) {
		BoardPaging noticePageData = new BoardPaging();
		int recordTotalCount = adminDAO.noticeGetTotal(sqlSession, noticePageData);
		
		int pageTotalCount = 0;

		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;					
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		CouponPageData couponPageDataResult = new CouponPageData();
		couponPageDataResult.setCurrentPage(currentPage);
		couponPageDataResult.setStartNavi(startNavi);
		couponPageDataResult.setEndNavi(endNavi);
		couponPageDataResult.setPageTotalCount(pageTotalCount);
		couponPageDataResult.setRecordTotalCount(recordTotalCount);
		
		return couponPageDataResult;
	}
	//멤버목록 페이징
	public CouponPageData memberGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage) {
		BoardPaging memberPageData = new BoardPaging();
		int recordTotalCount = adminDAO.memberGetTotal(sqlSession, memberPageData);
		int pageTotalCount = 0;
		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;					
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		CouponPageData memberPageDataResult = new CouponPageData();
		memberPageDataResult.setCurrentPage(currentPage);
		memberPageDataResult.setStartNavi(startNavi);
		memberPageDataResult.setEndNavi(endNavi);
		memberPageDataResult.setPageTotalCount(pageTotalCount);
		memberPageDataResult.setRecordTotalCount(recordTotalCount);
		
		return memberPageDataResult;
	}

	//가게리스트 페이징
	public CouponPageData storePageNavi(int currentPage, int recordCountPerPage, int naviCountPerPage) {
		BoardPaging storePageData = new BoardPaging();
		int recordTotalCount = adminDAO.storeGetTotal(sqlSession, storePageData);
		int pageTotalCount = 0;
		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;					
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		CouponPageData storePageDataResult = new CouponPageData();
		storePageDataResult.setCurrentPage(currentPage);
		storePageDataResult.setStartNavi(startNavi);
		storePageDataResult.setEndNavi(endNavi);
		storePageDataResult.setPageTotalCount(pageTotalCount);
		storePageDataResult.setRecordTotalCount(recordTotalCount);
		
		return storePageDataResult;
	}
	//관리자목록 페이징
	public CouponPageData adminGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage) {
		BoardPaging adminPageData = new BoardPaging();
		int recordTotalCount = adminDAO.adminGetTotal(sqlSession, adminPageData);
		int pageTotalCount = 0;
		if(recordTotalCount%recordCountPerPage!=0)
		{
			pageTotalCount = recordTotalCount / recordCountPerPage+1;
		}else
		{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage<1)
		{
			currentPage = 1;
		}else if(currentPage>pageTotalCount)
		{
			currentPage = pageTotalCount;					
		}

		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi+naviCountPerPage-1;
		
		if(endNavi>pageTotalCount)
		{
			endNavi = pageTotalCount;
		}
		CouponPageData adminPageDataResult = new CouponPageData();
		adminPageDataResult.setCurrentPage(currentPage);
		adminPageDataResult.setStartNavi(startNavi);
		adminPageDataResult.setEndNavi(endNavi);
		adminPageDataResult.setPageTotalCount(pageTotalCount);
		adminPageDataResult.setRecordTotalCount(recordTotalCount);
		
		return adminPageDataResult;
	}
	


	//관리자 로그인
	public YNMAdmin adminLogin(YNMAdmin vo) {
		YNMAdmin admin = adminDAO.adminLogin(sqlSession,vo);
		return admin;
	}

	//관리자 정보
	public AdminStatistics statAdmin() {
		AdminStatistics state = adminDAO.statAdmin(sqlSession);
		return state;
	}

	//가게 리스트
	public ArrayList<YNMStoreInfo> storeList() {
		ArrayList<YNMStoreInfo>list = adminDAO.storeList(sqlSession);
		return list;
	}
	//관리자 강등
	public int dounGrade(String ad_id) {
		int list = adminDAO.dounGrade(sqlSession,ad_id);
		return list;
	}
	
	//관리자 승낙
	public int upGrade(String ad_id) {
		int list = adminDAO.upGrade(sqlSession,ad_id);
		return list;
	}

	//공지사항 글내용
	public Notice noticeView(int noticeNo) {
		 return adminDAO.noticeView(sqlSession,noticeNo);
	}

	//글수정
	public int adminBoardFix(Notice vo) {
		 return adminDAO.adminBoardFix(sqlSession,vo);
	}

	//글삭제
	public int adminBoardDelete(Notice vo) {
		 return adminDAO.adminBoardDelete(sqlSession,vo);
	}

	//글쓰는 권한확인
	public int noticeWriteIdCheck(YNMAdmin vo) {
		return adminDAO.noticeWriteIdCheck(sqlSession,vo);
	}

	//글쓰기
	public int adminNoticeWrite(Notice vo) {
		return adminDAO.adminNoticeWrite(sqlSession,vo);
	}


	
	//가게 수락 
	public int storeYes(String owStoreInfoPk) {
		int result = adminDAO.storeYes(sqlSession,owStoreInfoPk);
		return result;
	}
	
	//가게 정지
	public int storeNo(String owStoreInfoPk) {
		int result = adminDAO.storeNo(sqlSession,owStoreInfoPk);
		return result;
	}
}