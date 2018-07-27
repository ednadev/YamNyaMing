package com.kh.ynm.owner.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.owner.model.dao.YNMOwnerDAOImpl;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreDetailInfo;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Service("ynmOwnerService")
public class YNMOwnerServiceImpl implements YNMOwnerService{
	@Resource(name="ynmOwnerDAO")
	private YNMOwnerDAOImpl ynmOwnerDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int ynmOwnerSignUp(YNMOwner owner) {
		int result = ynmOwnerDAO.ynmOwnerSignUp(sqlSession, owner);
		return result;
	}

	@Override
	public YNMOwner selectOneOwner(YNMOwner owner) {
		YNMOwner resultOwner = ynmOwnerDAO.selectOneOwner(sqlSession, owner);
		return resultOwner;
	}

	@Override
	public YNMOwner selectOneOwner(String ownerId) {
		YNMOwner owner = ynmOwnerDAO.selectOneOwner(sqlSession, ownerId);
		return owner;
	}
	
	@Override
	public YNMOwner idCheck(String ownerId) {
		YNMOwner owner = ynmOwnerDAO.selectOneOwner(sqlSession, ownerId);
		return owner;
	}
	

	@Override
	public int ynmStoreAdd(YNMStoreInfo storeInfo) {
		int result =  ynmOwnerDAO.ynmStoreAdd(sqlSession, storeInfo);
		return result;
	}

	@Override
	public int ynmSelectStoreIndex(String bizNum) {
		int storeIndex = ynmOwnerDAO.ynmSelectStoreIndex(sqlSession,bizNum);
		return storeIndex;
	}

	@Override
	public int ownerPhotoUpload(OwnerUploadPhoto uploadPhoto) {
		int uploadResult = ynmOwnerDAO.ownerPhotoUpload(sqlSession, uploadPhoto);
		return uploadResult;
	}

	@Override
	public int photoSelectWithName(String remakeName) {
		int photoIndex = ynmOwnerDAO.photoSelectWithName(sqlSession,remakeName);
		return photoIndex;
	}
	
	@Override
	public int ownerMenuUpload(MenuInfo menuInfo) {
		int menuUploadResult = ynmOwnerDAO.ownerMenuUpload(sqlSession, menuInfo);
		return menuUploadResult;
	}

	@Override
	public int selectMenuWithId(String menuId) {
		int menuIndex = ynmOwnerDAO.selectMenuWithId(sqlSession, menuId);
		return menuIndex;
	}
	
	@Override
	public int storeDetailInfo(YNMStoreDetailInfo detailInfo) {
		int storeDetailInfoResult = ynmOwnerDAO.storeDetailInfo(sqlSession, detailInfo);
		return storeDetailInfoResult;
	}
	
	@Override
	public int couponEnroll(CouponEnroll couponEnroll) {
		int couponEnrollResult = ynmOwnerDAO.couponEnroll(sqlSession, couponEnroll);
		return couponEnrollResult;
	}

	@Override
	public int ynmOwnerInfoUpdate(YNMOwner owner) {
		int result = ynmOwnerDAO.ynmOwnerInfoUpdate(sqlSession, owner);
		return result;
	}
	
	@Override
	public ArrayList<CouponEnroll> couponListPaging(int currentPage,int recordCountPerPage,int owEntirePk, int storeEntireFk) {
		//시작 페이지 계산
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		CouponPageData couponPageData = new CouponPageData();
		couponPageData.setStartPage(start);
		couponPageData.setEndPage(end);
		couponPageData.setOwEntirePk(owEntirePk);
		couponPageData.setStoreEntireFk(storeEntireFk);
		return ynmOwnerDAO.couponListPaging(sqlSession,couponPageData);
	}
	
	public CouponPageData couponPageNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int owEntirePk, int storeEntireFk) {
		CouponPageData couponPageData = new CouponPageData();
		couponPageData.setOwEntirePk(owEntirePk);
		couponPageData.setStoreEntireFk(storeEntireFk);
		
		int recordTotalCount = ynmOwnerDAO.couponGetTotal(sqlSession, couponPageData);
		
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
		couponPageDataResult.setStartNavi(startNavi);
		couponPageDataResult.setEndNavi(endNavi);
		couponPageDataResult.setPageTotalCount(pageTotalCount);
		couponPageDataResult.setRecordTotalCount(recordTotalCount);
		
		return couponPageDataResult;
		
		//페이지navi에서 사용할 '<'모양과'>'모양을 사용하기 위해 필요한 변수 2개 생성
//		boolean needPrev = true;
//		boolean needNext = true;
//
//		if(startNavi==1)
//		{
//			needPrev = false;
//		}
//
//		if(endNavi==pageTotalCount)
//		{
//			needNext = false;
//		}
//		//여기까지 기본적은 구조는 끝.
//
//		StringBuilder sb = new StringBuilder();
//		String navi = 
//				"<nav aria-label='Page navigation example'>";				
//		navi+= "<ul class='pagination'>";
//
//		
//		if(needPrev) {// 시작이 1페이지가 아니라면!					
//			navi +=	"<li class='page-item'>"+
//				"<a class='page-link' aria-label='Previous' onclick='pageChange("+(startNavi-1)+ ");'> <span aria-hidden='true' >«</span>"+
//				"<span class='sr-only'>Previous</span>"+
//				"</a> </li>";
//			
////			"<span onclick='pageChange("+(startNavi-1)+ ");'> < </span>";
//		}
//		
//		for(int i = startNavi;i<=endNavi;i++)
//		{
//			if(i==currentPage) {
//				navi += "<li>"+
//				"<a class='page-link' onclick='pageChange("+ i +");'> <span aria-hidden='true'><B>"+i+"</B></span>"+
//				"<span class='sr-only'>"+ i +"</span>"+
//				"</a></li>";
////				navi += "<span onclick='pageChange("+ i + ");'></span>";
//			}
//			else {
//				navi += "<li>"+
//					"<a class='page-link'  onclick='pageChange("+ i +");'> <span aria-hidden='true'>"+i+"</span>"+
//					"<span class='sr-only'>"+i+"</span>"+
//					"</a></li>";
////				navi += "<span onclick='pageChange("+ i + ");'>"+ i +"</span>";
////				sb.append("<a href='/notice?currentPage="+i+"'> "+i+" </a>");
//			}
//		}
//		
//		if(needNext) {// 끝페이지가 아니라면
//			navi += "<li class='page-item'>"+
//				"<a class='page-link' aria-label='Next' onclick='pageChange("+(endNavi+1)+ ");'>"+
//				"<span aria-hidden='true' >»</span>"+ 
//				"<span class='sr-only'>Next</span>"+
//				"</a>"+
//			"</li>";
////			navi+= "<span onclick='pageChange("+(endNavi+1)+ ");'> > </span>";
////			sb.append("<a href='/notice?currentPage="+(endNavi+1)+ "'> > </a>");
//		
//		}
	}

	
}
