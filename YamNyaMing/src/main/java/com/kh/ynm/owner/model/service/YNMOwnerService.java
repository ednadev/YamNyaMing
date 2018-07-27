package com.kh.ynm.owner.model.service;

import java.util.ArrayList;

import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreDetailInfo;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMOwnerService {
	// 회원가입
	public int ynmOwnerSignUp(YNMOwner owner);
	
	// 회원 선택(로그인, 정보 가져오기)
	public YNMOwner selectOneOwner(YNMOwner owner);
		
	//
	public YNMOwner selectOneOwner(String ownerId);
	
	// 가게 추가
	public int ynmStoreAdd(YNMStoreInfo storeInfo);
	
	// 아이디 체크
	public YNMOwner idCheck(String ownerId);
	
	// 상점 정보 인덱스로 가져오기
	public int ynmSelectStoreIndex(String bizNum);
	
	// 점주 사진 업로드
	public int ownerPhotoUpload(OwnerUploadPhoto uploadPhoto);
	
	// 사진 선택, 이름으로
	public int photoSelectWithName(String remakeName);
	
	// 메뉴 업로드
	public int ownerMenuUpload(MenuInfo menuInfo);
	
	// 메뉴 인덱스 가져오기
	public int selectMenuWithId(String menuId);
	
	// 상세 가게 정보 입력
	public int storeDetailInfo(YNMStoreDetailInfo detailInfo);

	// 쿠폰 등록
	public int couponEnroll(CouponEnroll couponEnroll);

	// 점주 정보 업데이트
	public int ynmOwnerInfoUpdate(YNMOwner owner);
	
	// 쿠폰 리스트 가져오기
	public ArrayList<CouponEnroll> couponListPaging(int currentPage,int recordCountPerPage,int owEntirePk, int storeEntireFk) ;

	
}
