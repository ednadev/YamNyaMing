package com.kh.ynm.owner.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.owner.model.dao.YNMOwnerDAOImpl;
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

	
}
