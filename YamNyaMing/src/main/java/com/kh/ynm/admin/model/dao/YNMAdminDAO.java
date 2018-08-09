package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.BoardPaging;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMAdminDAO {
	//회원가입
	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession);
	//회원가입 아이디체크
	public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo);

	//관리자 로그인
	public YNMAdmin adminLogin(SqlSessionTemplate sqlSession, YNMAdmin vo);
	//통계(그래프/회원수)
	public AdminStatistics statAdmin(SqlSessionTemplate sqlSession);
	//통계(가게순위)
	public ArrayList<YNMStoreInfo> storeList(SqlSessionTemplate sqlSession);
	//관리자 강등
	public int dounGrade(SqlSessionTemplate sqlSession, String ad_id);
	//가입 수락
	public int upGrade(SqlSessionTemplate sqlSession, String ad_id);
	//관리자 수락 강등 
	public ArrayList<YNMAdmin> adminListPaging(SqlSessionTemplate sqlSession, BoardPaging adminPageData);
	//멤버 페이징
	public ArrayList<YNMMember> memberListPaging(SqlSessionTemplate sqlSession, BoardPaging memberPageData);
	//공지사항 페이징
	public ArrayList<Notice> noticeListPaging(SqlSessionTemplate sqlSession, BoardPaging noticePageData);
	//점주 전체보기 페이징
	public ArrayList<YNMOwner> ownerListPaging(SqlSessionTemplate sqlSession, BoardPaging ownerPageData);
	//점주 가게신청 정보 페이징
	public ArrayList<StoreInfoPageData> storeListPaging(SqlSessionTemplate sqlSession,BoardPaging storePageData);
	//공지사항 페이징(토탈)
	public int noticeGetTotal(SqlSessionTemplate sqlSession, BoardPaging noticePageData);
	//가게신청 페이징(토탈)
	public int storeGetTotal(SqlSessionTemplate sqlSession, BoardPaging storePageData);
	//멤버 페이징(토탈)
	public int memberGetTotal(SqlSessionTemplate sqlSession, BoardPaging memberPageData);
	//점주 페이징(토탈)
	public int ownerGetTotal(SqlSessionTemplate sqlSession, BoardPaging ownerPageData);
	//관리자 페이징(토탈)
	public int adminGetTotal(SqlSessionTemplate sqlSession, BoardPaging adminPageData);
	//공지사항 글보기
	public Notice noticeView(SqlSessionTemplate sqlSession, int noticeNo);
	//글수정
	public int adminBoardFix(SqlSessionTemplate sqlSession, Notice vo);
	//글삭제
	public int adminBoardDelete(SqlSessionTemplate sqlSession, Notice vo);
	//글쓰기 권한체크
	public int noticeWriteIdCheck(SqlSessionTemplate sqlSession, YNMAdmin vo);
	//글쓰기
	public int adminNoticeWrite(SqlSessionTemplate sqlSession, Notice vo);
	//가게 승인
	public int storeYes(SqlSessionTemplate sqlSession, String owStoreInfoPk);
	//가게 정지
	public int storeNo(SqlSessionTemplate sqlSession, String owStoreInfoPk);

}
