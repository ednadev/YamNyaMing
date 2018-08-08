package com.kh.ynm.owner.model.service;

import java.util.ArrayList;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.owner.model.vo.BookSearchVo;
import com.kh.ynm.owner.model.vo.CouponEnroll;
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

	// 내가 등록한 가게 리스트
	public ArrayList<StoreTitleData> ynmStoreInfoList(int ownerIndex, int currentPage, int recordCountPerPage);
	
	// 가게 선택 네비게이션
	public StorePageData ynmStoreNavi(int currentPage, int recordCountPerPage, int naviCountPerPage, int ownerIndex);

	// 가게 관리 페이지에서 정보 불러오기.
	public StoreInfoPageData storeInfoPageDataGet(int storeIndex);

	// 가게 기본 정보 수정하기
	public int storeInfoEdit(StoreInfoPageData storeInfoPD);

	// 가게 상세 정보 수정하긴
	public int storeInfoDetailEdit(StoreInfoPageData storeInfoPD);

	// 가게 대표 이미지 불러오기
	public ArrayList<OwnerUploadPhoto> headPhotoList(OwnerUploadPhoto paramVo);

	// 가게 대표이미지 삭제
	public int storeHeadPhotoDelete(OwnerUploadPhoto paramVo);

	// 가게 메뉴 정보 가져오기
	public StoreMenuData storeMenuData(int storeInfoIndex);

	// 가게 메뉴 가져오기
	public ArrayList<MenuInfo> storeMenuInfoList(int storeIndex);

	// 가게 메뉴 텍스트 업데이트
	public int textMenuUpdate(MenuInfo menuInfo);

	// 가게 메뉴 항목 삭제
	public int menuTextDelete(int menuIndex);

	// 가게 예약 정보 리스트
	public ArrayList<YNMBook> bookListLoadWidthStoreIndex(BookSearchVo bookSearch);

	// 등록한 첫번째 가게 인덱스 가져오기
	public int selectStoreIndex(int ownerIndex);

	// 점주가 취소한 예약, 혹은 자동 취소.
	public int cancelBookAsOwner(YNMBook bookVo);
	
	// 게시글 사진 올리기
	public OwnerUploadPhoto selectOwnerPhoto(OwnerUploadPhoto uploadPhoto);

	// 가게 공지글 올리기
	public int ownerBoardAdd(StoreBoardData storeBoardData);

	// 가게 페이징 뷰
	public ArrayList<StoreBoardData> storeBoardList(int currentPage, int recordCountPerPage, int storeIndex);

	// 가게 선택했을때 정보 가져오기
	public StoreBoardData boardSelect(int boardIndex);

	// 쿠폰 업데이트
	public int couponUpdate(CouponEnroll couponEnroll);

	// 예약 확인
	public ArrayList<YNMBook> bookCheck(int memberIndex);

	// 로그인한 사람이 예약한 가게의 인덱스들.
	public ArrayList<Integer> bookedStoreIndex(int memberIndex);
	
}
