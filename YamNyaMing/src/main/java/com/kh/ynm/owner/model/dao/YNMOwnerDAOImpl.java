package com.kh.ynm.owner.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMBook;
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

@Repository("ynmOwnerDAO")
public class YNMOwnerDAOImpl implements YNMOwnerDAO{

	@Override
	public int ynmOwnerSignUp(SqlSessionTemplate sqlSession, YNMOwner owner) {	
		return sqlSession.insert("owners.ownerSignUp", owner);
	}
	
	@Override
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, String ownerid) {
		return sqlSession.selectOne("owners.ownerCheckId", ownerid);
	}

	@Override
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, YNMOwner owner) {
		return sqlSession.selectOne("owners.ownerLogin", owner);
	}

	@Override
	public int ynmStoreAdd(SqlSessionTemplate sqlSession, YNMStoreInfo storeInfo) {
		return sqlSession.insert("stores.storeAdd", storeInfo);
	}

	public int ynmSelectStoreIndex(SqlSessionTemplate sqlSession, String bizNum) {
		return sqlSession.selectOne("stores.storeSearchWithBizNum", bizNum);	
	}

	public int ownerPhotoUpload(SqlSessionTemplate sqlSession, OwnerUploadPhoto uploadPhoto) {
		return sqlSession.insert("owphotos.ownerPhotoUpload",uploadPhoto);
	}
	
	@Override
	public int photoSelectWithName(SqlSessionTemplate sqlSession,String remakeName) {
		return sqlSession.selectOne("owphotos.photoSelectWithName", remakeName);
	}
	
	@Override
	public int ownerMenuUpload(SqlSessionTemplate sqlSession, MenuInfo menuInfo) {
		return sqlSession.insert("stores.menuUpload", menuInfo);
	}

	@Override
	public int selectMenuWithId(SqlSessionTemplate sqlSession, String menuId) {
		return sqlSession.selectOne("stores.menuSelectWithId", menuId);
	}
	
	@Override
	public int storeDetailInfo(SqlSessionTemplate sqlSession, YNMStoreDetailInfo detailInfo) {
		return sqlSession.insert("stores.storeDetailInfoInsert", detailInfo);
	}
	
	@Override
	public int couponEnroll(SqlSessionTemplate sqlSession, CouponEnroll couponEnroll) {
		return sqlSession.insert("stores.couponEnroll", couponEnroll);
	}
	
	@Override
	public int ynmOwnerInfoUpdate(SqlSessionTemplate sqlSession, YNMOwner owner) 
	{
		return sqlSession.update("owners.updateOwnerInfo", owner);
	}
	
	@Override
	public ArrayList<CouponEnroll> couponListPaging(SqlSessionTemplate sqlSession, CouponPageData couponPageData) {
		List list= sqlSession.selectList("stores.couponList", couponPageData);
		return (ArrayList<CouponEnroll>)list;
	}
	
	@Override
	public int couponGetTotal(SqlSessionTemplate sqlSession, CouponPageData couponPageData) {
		return sqlSession.selectOne("stores.couponTotal", couponPageData);
	}

	@Override
	public ArrayList<StoreTitleData> storeListPaging(SqlSessionTemplate sqlSession, StorePageData storePageData) {
		List list= sqlSession.selectList("stores.storeTitleList", storePageData);
		return  (ArrayList<StoreTitleData>)list;
	}

	public int storeEnrollList(SqlSessionTemplate sqlSession, int ownerIndex) {
		return sqlSession.selectOne("stores.storeEnrollNavi", ownerIndex);
	}

	@Override
	public StoreInfoPageData storeInfoPageDataGet(SqlSessionTemplate sqlSession, int storeIndex) {
		return sqlSession.selectOne("stores.storeInfoPageData",storeIndex );
	}

	@Override
	public int storeInfoEdit(SqlSessionTemplate sqlSession, StoreInfoPageData storeInfoPD) {
		return  sqlSession.update("stores.storeInfoBasicEdit",storeInfoPD );
	}

	@Override
	public int storeInfoDetailEdiy(SqlSessionTemplate sqlSession, StoreInfoPageData storeInfoPD) {
		return sqlSession.update("stores.storeInfoDetailEdit",storeInfoPD);
	}
	
	@Override
	public ArrayList<OwnerUploadPhoto> headPhotoList(SqlSessionTemplate sqlSession, OwnerUploadPhoto paramVo) {
		List list = sqlSession.selectList("owphotos.headPhotoList",paramVo);
		return (ArrayList<OwnerUploadPhoto>)list;
	}

	@Override
	public int storeHeadPhotoDelete(SqlSessionTemplate sqlSession, OwnerUploadPhoto paramVo) {
		return sqlSession.delete("owphotos.headPhotoDelete", paramVo);
	}

	@Override
	public StoreMenuData storeMenuData(SqlSessionTemplate sqlSession, int storeInfoIndex) {
		return sqlSession.selectOne("stores.storeMenuDataGet", storeInfoIndex);
	}

	@Override
	public ArrayList<MenuInfo> storeMenuInfoList(SqlSessionTemplate sqlSession, int storeIndex) {
		List list = sqlSession.selectList("stores.storeMenuInfoList", storeIndex);
		return (ArrayList<MenuInfo>)list;
	}

	@Override
	public int textMenuUpdate(SqlSessionTemplate sqlSession, MenuInfo menuInfo) {
		return sqlSession.update("stores.storeTextMenuUpdate", menuInfo);
	}

	@Override
	public int menuTextDelete(SqlSessionTemplate sqlSession, int menuIndex) {
		return sqlSession.delete("stores.menuTextDelete", menuIndex);
	}

	@Override
	public ArrayList<YNMBook> bookListLoadWidthStoreIndex(SqlSessionTemplate sqlSession, BookSearchVo bookSearch) {
		List list = sqlSession.selectList("stores.bookListWithStoreIndex", bookSearch);
		return (ArrayList<YNMBook>)list;
	}

	@Override
	public int ynmSelectStoreIndex(SqlSessionTemplate sqlSession, int ownerIndex) {
		return sqlSession.selectOne("stores.storeIndexWithOwIndex", ownerIndex);
	}

	@Override
	public int cancelBookAsOwner(SqlSessionTemplate sqlSession,YNMBook bookVo) {
		return sqlSession.update("stores.changeBookState", bookVo);
	}

	public OwnerUploadPhoto selectOwnerPhoto(SqlSessionTemplate sqlSession, OwnerUploadPhoto uploadPhoto) {
		return sqlSession.selectOne("owphotos.selectOwnerPhoto", uploadPhoto);
	}

	@Override
	public int ownerBoardAdd(SqlSessionTemplate sqlSession, StoreBoardData storeBoardData) {
		return sqlSession.insert("stores.ownerBoardAdd", storeBoardData);
	}

	@Override
	public ArrayList<StoreBoardData> storeBoardList(SqlSessionTemplate sqlSession, StorePageData storePageData) {
		List list= sqlSession.selectList("stores.storeBoardList", storePageData);
		return (ArrayList<StoreBoardData>)list;
	}

	@Override
	public int storeBoardNavi(SqlSessionTemplate sqlSession, CouponPageData couponPageData) {
		return sqlSession.selectOne("stores.boardCountTotal", couponPageData);
	}
	
	@Override
	public StoreBoardData boardSelect(SqlSessionTemplate sqlSession,int boardIndex)
	{
		return sqlSession.selectOne("stores.boardSelect", boardIndex);
	}

	@Override
	public int couponUpdate(SqlSessionTemplate sqlSession, CouponEnroll couponEnroll) {
		return sqlSession.update("stores.couponUpdate", couponEnroll);
	}

	@Override
	public ArrayList<YNMBook> bookCheck(SqlSessionTemplate sqlSession, int storeIndex) {
		List list = sqlSession.selectList("book.myBookStoreIndex", storeIndex);
		return (ArrayList<YNMBook>)list;
	}

	@Override
	public ArrayList<Integer> bookStoreIndex(SqlSessionTemplate sqlSession, int memberIndex) {
		List list = sqlSession.selectList("book.myBookCheck", memberIndex);
		return (ArrayList<Integer>)list;
	}

}
