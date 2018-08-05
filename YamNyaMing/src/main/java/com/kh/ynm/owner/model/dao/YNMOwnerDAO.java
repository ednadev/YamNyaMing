package com.kh.ynm.owner.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.owner.model.vo.BookSearchVo;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.StoreMenuData;
import com.kh.ynm.owner.model.vo.StorePageData;
import com.kh.ynm.owner.model.vo.StoreTitleData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreDetailInfo;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMOwnerDAO {
	public int ynmOwnerSignUp(SqlSessionTemplate sqlSession, YNMOwner owner);
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, String ownerid);
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, YNMOwner owner);
	public int ynmStoreAdd(SqlSessionTemplate sqlSession, YNMStoreInfo storeInfo);
	public int ownerPhotoUpload(SqlSessionTemplate sqlSession, OwnerUploadPhoto uploadPhoto);
	public int photoSelectWithName(SqlSessionTemplate sqlSession,String remakeName);
	public int ownerMenuUpload(SqlSessionTemplate sqlSession, MenuInfo menuInfo);
	public int selectMenuWithId(SqlSessionTemplate sqlSession, String menuId);
	public int storeDetailInfo(SqlSessionTemplate sqlSession, YNMStoreDetailInfo detailInfo);
	public int couponEnroll(SqlSessionTemplate sqlSession, CouponEnroll couponEnroll);
	public int ynmOwnerInfoUpdate(SqlSessionTemplate sqlSession, YNMOwner owner);
	public ArrayList<CouponEnroll> couponListPaging(SqlSessionTemplate sqlSession, CouponPageData couponPageData);
	public int couponGetTotal(SqlSessionTemplate sqlSession, CouponPageData couponPageData);
	public ArrayList<StoreTitleData> storeListPaging(SqlSessionTemplate sqlSession, StorePageData storePageData);
	public int storeEnrollList(SqlSessionTemplate sqlSession, int ownerIndex);
	public StoreInfoPageData storeInfoPageDataGet(SqlSessionTemplate sqlSession, int storeIndex);
	public int storeInfoEdit(SqlSessionTemplate sqlSession, StoreInfoPageData storeInfoPD);
	public int storeInfoDetailEdiy(SqlSessionTemplate sqlSession, StoreInfoPageData storeInfoPD);
	public ArrayList<OwnerUploadPhoto> headPhotoList(SqlSessionTemplate sqlSession, OwnerUploadPhoto paramVo);
	public int storeHeadPhotoDelete(SqlSessionTemplate sqlSession, OwnerUploadPhoto paramVo);
	public StoreMenuData storeMenuData(SqlSessionTemplate sqlSession, int storeInfoIndex);
	public ArrayList<MenuInfo> storeMenuInfoList(SqlSessionTemplate sqlSession, int storeIndex);
	public int textMenuUpdate(SqlSessionTemplate sqlSession, MenuInfo menuInfo);
	public int menuTextDelete(SqlSessionTemplate sqlSession, int menuIndex);
	public ArrayList<YNMBook> bookListLoadWidthStoreIndex(SqlSessionTemplate sqlSession, BookSearchVo bookSearch);
	public int ynmSelectStoreIndex(SqlSessionTemplate sqlSession, int ownerIndex);
	public int cancelBookAsOwner(SqlSessionTemplate sqlSession, YNMBook bookVo);
}
