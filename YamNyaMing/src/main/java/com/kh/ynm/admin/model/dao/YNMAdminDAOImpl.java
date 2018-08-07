package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.BoardPaging;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Repository("YNMAdminDAO")
public class YNMAdminDAOImpl implements YNMAdminDAO{

	private Object noOfRecords;
	//회원가입 
	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}
	//회원가입 아이디체크
    public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo) {
    	return sqlSession.selectOne("admin.adminIdCheck",vo);
    }
    //점주 검색
	public ArrayList<YNMOwner> OwnerSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("combo", combo);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.ownerSearch",map);
		return (ArrayList<YNMOwner>) list;
	}
	//멤버 검색
	public ArrayList<YNMMember> MemberSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("combo", combo);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.memberSearch",map);
		return (ArrayList<YNMMember>) list;
	}
	//관리자 로그인
	public YNMAdmin adminLogin(SqlSessionTemplate sqlSession, YNMAdmin vo) {
		return sqlSession.selectOne("admin.adminLogin",vo);
	}
	//통계에서 그래프와 회원수
	public AdminStatistics statAdmin(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.statAdmin");
	}
	//통계에서 가게순위
	public ArrayList<YNMStoreInfo> storeList(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("admin.storeList");
		return (ArrayList<YNMStoreInfo>) list;
	}
	//강등
	public int dounGrade(SqlSessionTemplate sqlSession, String ad_id) {
		int list = sqlSession.update("admin.dounGrade",ad_id);
		return list;
	}
	//가입 수락
	public int upGrade(SqlSessionTemplate sqlSession, String ad_id) {
		int list = sqlSession.update("admin.upGrade",ad_id);
		return list;
	}	
	//관리자 수락 강등 목록 리스트 페이징
	public ArrayList<YNMAdmin> adminListPaging(SqlSessionTemplate sqlSession, BoardPaging adminPageData) {
		List list = sqlSession.selectList("admin.adminList",adminPageData);
		return (ArrayList<YNMAdmin>) list;
	}
	//멤버 페이징
    public ArrayList<YNMMember> memberListPaging(SqlSessionTemplate sqlSession, BoardPaging memberPageData) {
    	List list = sqlSession.selectList("admin.memberList",memberPageData);
		return (ArrayList<YNMMember>) list;	
	}	
	//공지사항 페이징 
	@Override
	public ArrayList<Notice> noticeListPaging(SqlSessionTemplate sqlSession, BoardPaging noticePageData) {
		List list= sqlSession.selectList("admin.noticeList", noticePageData);
		return (ArrayList<Notice>)list;
	}
    //점주 전체보기 페이징
    public ArrayList<YNMOwner> ownerListPaging(SqlSessionTemplate sqlSession, BoardPaging ownerPageData) {
    	List list = sqlSession.selectList("admin.ownerList",ownerPageData);
		return (ArrayList<YNMOwner>) list;
	}
	//점주  가게신청정보  페이징
	public ArrayList<StoreInfoPageData> storeListPaging(SqlSessionTemplate sqlSession,BoardPaging storePageData) {
		List list= sqlSession.selectList("admin.ownerStoreList",storePageData);
		return (ArrayList<StoreInfoPageData>)list;
	}
	//공지사항 페이징(토탈)
	@Override
	public int noticeGetTotal(SqlSessionTemplate sqlSession, BoardPaging noticePageData) {
		return sqlSession.selectOne("admin.noticeTotal", noticePageData);
	}
	//가게신청 페이징(토탈)
	public int storeGetTotal(SqlSessionTemplate sqlSession, BoardPaging storePageData) {
		return sqlSession.selectOne("admin.storeTotal", storePageData);
	}
	//멤버 페이징(토탈)
	public int memberGetTotal(SqlSessionTemplate sqlSession, BoardPaging memberPageData) {
		return sqlSession.selectOne("admin.memberTotal", memberPageData);
	}
	//점주 페이징(토탈)
	public int ownerGetTotal(SqlSessionTemplate sqlSession, BoardPaging ownerPageData) {
		return sqlSession.selectOne("admin.ownerTotal", ownerPageData);
	}
	//관리자 페이징(토탈)
	public int adminGetTotal(SqlSessionTemplate sqlSession, BoardPaging adminPageData) {
		return sqlSession.selectOne("admin.adminTotal", adminPageData);
	}
	//글보기
	public Notice noticeView(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("admin.noticeView", noticeNo);
	}
	//글수정
	public int adminBoardFix(SqlSessionTemplate sqlSession, Notice vo) {
		return sqlSession.update("admin.adminBoardFix", vo);
	}
	//글삭제
	public int adminBoardDelete(SqlSessionTemplate sqlSession, Notice vo) {
		return sqlSession.delete("admin.adminBoardDelete", vo);
	}
	//글쓰기전 관리자인지 체크
	public int noticeWriteIdCheck(SqlSessionTemplate sqlSession, YNMAdmin vo) {
		return sqlSession.selectOne("admin.noticeWriteIdCheck", vo);
	}
	
	//글쓰기
	public int adminNoticeWrite(SqlSessionTemplate sqlSession, Notice vo) {
		return sqlSession.insert("admin.adminNoticeWrite", vo);
	}
	//가게 승인
	public int storeYes(SqlSessionTemplate sqlSession, String owStoreInfoPk) {
		int list = sqlSession.update("admin.storeYes",owStoreInfoPk);
		return list;
	}
	//가게 정지
	public int storeNo(SqlSessionTemplate sqlSession, String owStoreInfoPk) {
		int list = sqlSession.update("admin.storeNo",owStoreInfoPk);
		return list;
	}
	

	


}