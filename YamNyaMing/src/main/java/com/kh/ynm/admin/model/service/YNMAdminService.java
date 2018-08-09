package com.kh.ynm.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMAdminService {

	//관리자 회원가입
	public int enrollAdmin(YNMAdmin vo);
	//아이디 중복확인
	public YNMAdmin adminIdCheck(YNMAdmin vo);
	//게시판 목록
	public ArrayList<Notice> noticeListPaging(int currentPage,int recordCountPerPage);
	//일반 사용자 전체보기
	public ArrayList<YNMMember> memberListPaging(int currentPage, int recordCountPerPage);
	//점주 전체보기
	public ArrayList<YNMOwner> ownerListPaging(int currentPage, int recordCountPerPage);
	//가게 리스트
	public ArrayList<StoreInfoPageData> storeListPaging(int currentPage, int recordCountPerPage, StoreInfoPageData vo);
	//관리자 리스트
	public ArrayList<YNMAdmin> adminListPaging(int currentPage, int recordCountPerPage);
	//점주목록 페이징
	public CouponPageData ownerGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage);
	//게시판 페이징
	public CouponPageData noticeGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage);
	//멤버목록 페이징
	public CouponPageData memberGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage);
	//관리자목록 페이징
	public CouponPageData adminGetTotal(int currentPage, int recordCountPerPage, int naviCountPerPage);
	//관리자 로그인
	public YNMAdmin adminLogin(YNMAdmin vo);
	//관리자 정보
	public AdminStatistics statAdmin();
	//가게 리스트
	public ArrayList<YNMStoreInfo> storeList();
	//관리자 강등
	public int dounGrade(String ad_id);
	//관리자 승낙
	public int upGrade(String ad_id);
	//공지사항 글내용
	public Notice noticeView(int noticeNo);
	//글수정
	public int adminBoardFix(Notice vo);
	//글삭제
	public int adminBoardDelete(Notice vo);
	//글쓸 권한확인
	public int noticeWriteIdCheck(YNMAdmin vo);
	//글쓰기
	public int adminNoticeWrite(Notice vo);
	//가게 수락
	public int storeYes(String owStoreInfoPk);
	//가게 정지
	public int storeNo(String owStoreInfoPk);
}
