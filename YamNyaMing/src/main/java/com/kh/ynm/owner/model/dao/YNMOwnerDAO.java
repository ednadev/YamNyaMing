package com.kh.ynm.owner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
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
}
