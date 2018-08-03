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
    //멤버 전체보기
    public ArrayList<YNMMember> allMemberView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("admin.allMemberView");
		return (ArrayList<YNMMember>) list;
		
	}	
    //점주 전체보기
    public ArrayList<YNMOwner> allOwnerView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("admin.allOwnerView");
		return (ArrayList<YNMOwner>) list;
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
	//오너 블랙(예정)
	public int ownerBlock(YNMOwner vo, SqlSessionTemplate sqlSession) {
		System.out.println(vo.getOwId());
		return sqlSession.update("admin.ownerBlock",vo);
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
	//관리자 수락 강등 목록 리스트
	public ArrayList<YNMAdmin> adminList(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("admin.adminList");
		return (ArrayList<YNMAdmin>) list;
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


	//페이징 
	@Override
	public ArrayList<Notice> noticeListPaging(SqlSessionTemplate sqlSession, BoardPaging noticePageData) {
		List list= sqlSession.selectList("admin.noticeList", noticePageData);
		return (ArrayList<Notice>)list;
	}
	//페이징
	@Override
	public int noticeGetTotal(SqlSessionTemplate sqlSession, BoardPaging noticePageData) {
		return sqlSession.selectOne("admin.noticeTotal", noticePageData);
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
	
	
	//점주  가게정보
	public ArrayList<StoreInfoPageData> ownerStoreList(SqlSessionTemplate sqlSession, BoardPaging storePageData2) {
		List list= sqlSession.selectList("admin.ownerStoreList", storePageData2);
		return (ArrayList<StoreInfoPageData>)list;
	}
	
	//점주 페이징 토탈
	public int ownerGetTotal(SqlSessionTemplate sqlSession, BoardPaging storePageData) {
		return sqlSession.selectOne("admin.ownerGetTotal", storePageData);
	}

	










	
}