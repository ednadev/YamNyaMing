package com.kh.ynm.owner.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.owner.model.dao.YNMOwnerDAOImpl;
import com.kh.ynm.owner.model.vo.BookSearchVo;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreBoardData;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.StoreMenuData;
import com.kh.ynm.owner.model.vo.StorePageData;
import com.kh.ynm.owner.model.vo.StoreTitleData;
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
		couponPageDataResult.setCurrentPage(currentPage);
		couponPageDataResult.setStartNavi(startNavi);
		couponPageDataResult.setEndNavi(endNavi);
		couponPageDataResult.setPageTotalCount(pageTotalCount);
		couponPageDataResult.setRecordTotalCount(recordTotalCount);
		
		return couponPageDataResult;
	}

	public ArrayList<StoreTitleData> ynmStoreInfoList(int ownerIndex, int currentPage, int recordCountPerPage) {
		//시작 페이지 계산
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		StorePageData storePageData = new StorePageData();
		storePageData.setStartPage(start);
		storePageData.setEndPage(end);
		storePageData.setOwEntirePk(ownerIndex);
		return ynmOwnerDAO.storeListPaging(sqlSession,storePageData);
	}

	public StorePageData ynmStoreNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int ownerIndex) {
		
		int recordTotalCount = ynmOwnerDAO.storeEnrollList(sqlSession, ownerIndex);
		
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
		StorePageData storePageData = new StorePageData();
		storePageData.setCurrentPage(currentPage);
		storePageData.setStartNavi(startNavi);
		storePageData.setEndNavi(endNavi);
		storePageData.setPageTotalCount(pageTotalCount);
		storePageData.setRecordTotalCount(recordTotalCount);
		return storePageData;
	}

	@Override
	public StoreInfoPageData storeInfoPageDataGet(int storeIndex) {
		StoreInfoPageData storeInfoPD = ynmOwnerDAO.storeInfoPageDataGet(sqlSession, storeIndex);
		return storeInfoPD;
	}

	@Override
	public int storeInfoEdit(StoreInfoPageData storeInfoPD) {
		int result = ynmOwnerDAO.storeInfoEdit(sqlSession, storeInfoPD);
		return result;
	}

	@Override
	public int storeInfoDetailEdit(StoreInfoPageData storeInfoPD) {
		int result = ynmOwnerDAO.storeInfoDetailEdiy(sqlSession, storeInfoPD);
		return result;
	}

	@Override
	public ArrayList<OwnerUploadPhoto> headPhotoList(OwnerUploadPhoto paramVo) {
		ArrayList<OwnerUploadPhoto> list = ynmOwnerDAO.headPhotoList(sqlSession,paramVo);
		return list;
	}

	@Override
	public int storeHeadPhotoDelete(OwnerUploadPhoto paramVo) {
		int result = ynmOwnerDAO.storeHeadPhotoDelete(sqlSession, paramVo);
		return result;
	}
	
	/*@Override
	public int storeDetailInfoHeadPhotoUpdate(OwnerUploadPhoto paramVo) {
		int result = ynmOwnerDAO.storeDetailInfoHeadPhotoUpdate(sqlSession, paramVo);
		return result;
	}
*/
	@Override
	public StoreMenuData storeMenuData(int storeInfoIndex) {
		StoreMenuData storeMenuData = ynmOwnerDAO.storeMenuData(sqlSession, storeInfoIndex);
		return storeMenuData;
	}

	@Override
	public ArrayList<MenuInfo> storeMenuInfoList(int storeIndex) {
		ArrayList<MenuInfo> list = ynmOwnerDAO.storeMenuInfoList(sqlSession, storeIndex);
		return list;
	}

	@Override
	public int textMenuUpdate(MenuInfo menuInfo) {
		int updateResult = ynmOwnerDAO.textMenuUpdate(sqlSession, menuInfo);
		return updateResult;
	}

	@Override
	public int menuTextDelete(int menuIndex) {
		int result  = ynmOwnerDAO.menuTextDelete(sqlSession, menuIndex);
		return result;
	}

	@Override
	public ArrayList<YNMBook> bookListLoadWidthStoreIndex(BookSearchVo bookSearch) {
		ArrayList<YNMBook> list  = ynmOwnerDAO.bookListLoadWidthStoreIndex(sqlSession, bookSearch);
		return list;
	}

	@Override
	public int selectStoreIndex(int ownerIndex) {
		return ynmOwnerDAO.ynmSelectStoreIndex(sqlSession, ownerIndex);
	}
	
	@Override
	public int cancelBookAsOwner(YNMBook bookVo) {
		return ynmOwnerDAO.cancelBookAsOwner(sqlSession, bookVo);
	}

	
	@Override
	public OwnerUploadPhoto selectOwnerPhoto(OwnerUploadPhoto uploadPhoto) {
		return ynmOwnerDAO.selectOwnerPhoto(sqlSession, uploadPhoto);
	}

	@Override
	public int ownerBoardAdd(StoreBoardData storeBoardData) {
		return ynmOwnerDAO.ownerBoardAdd(sqlSession, storeBoardData);
	}

	@Override
	public ArrayList<StoreBoardData> storeBoardList(int currentPage, int recordCountPerPage, int storeIndex) {
		int start = currentPage*recordCountPerPage-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		StorePageData storePageData = new StorePageData();
		storePageData.setStartPage(start);
		storePageData.setEndPage(end);
		storePageData.setStoreIndex(storeIndex);
		return ynmOwnerDAO.storeBoardList(sqlSession,storePageData);
	}

	public CouponPageData storeBoardNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int storeIndex) {
		CouponPageData couponPageData = new CouponPageData();
		couponPageData.setStoreEntireFk(storeIndex);
		
		int recordTotalCount = ynmOwnerDAO.storeBoardNavi(sqlSession, couponPageData);
		
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

	@Override
	public StoreBoardData boardSelect(int boardIndex) {
		return ynmOwnerDAO.boardSelect(sqlSession, boardIndex);
	}


	
}
