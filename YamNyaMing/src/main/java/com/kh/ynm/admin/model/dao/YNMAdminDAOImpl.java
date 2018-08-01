package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.Notice;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Repository("YNMAdminDAO")
public class YNMAdminDAOImpl implements YNMAdminDAO{

	private Object noOfRecords;

	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}

    public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo) {
    	return sqlSession.selectOne("admin.adminIdCheck",vo);
    }
   
    public ArrayList<YNMMember> allMemberView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("admin.allMemberView");
		return (ArrayList<YNMMember>) list;
		
	}

    public ArrayList<YNMOwner> allOwnerView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("admin.allOwnerView");
		return (ArrayList<YNMOwner>) list;
	}

	public ArrayList<YNMOwner> OwnerSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("combo", combo);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.ownerSearch",map);
		return (ArrayList<YNMOwner>) list;
	}

	public ArrayList<YNMMember> MemberSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("combo", combo);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("admin.memberSearch",map);
		return (ArrayList<YNMMember>) list;
	}

	public YNMAdmin adminLogin(SqlSessionTemplate sqlSession, YNMAdmin vo) {
		return sqlSession.selectOne("admin.adminLogin",vo);
	}

	public int ownerBlock(YNMOwner vo, SqlSessionTemplate sqlSession) {
		System.out.println(vo.getOwId());
		return sqlSession.update("admin.ownerBlock",vo);
	}
	

	public AdminStatistics statAdmin(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.statAdmin");
	}

	public ArrayList<YNMStoreInfo> storeList(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("admin.storeList");
		return (ArrayList<YNMStoreInfo>) list;
	}

	public ArrayList<YNMAdmin> adminList(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("admin.adminList");
		return (ArrayList<YNMAdmin>) list;
	}

	public int dounGrade(SqlSessionTemplate sqlSession, String ad_id) {
		int list = sqlSession.update("admin.dounGrade",ad_id);
		return list;
	}

	public int upGrade(SqlSessionTemplate sqlSession, String ad_id) {
		int list = sqlSession.update("admin.upGrade",ad_id);
		return list;
	}
	//게시물 목록 표시(페이징)
	@Override
	public List<Notice> writeList(SqlSessionTemplate sqlSession,int offset, int noOfRecords) throws Exception{
	List<Notice> writeList = new ArrayList<Notice>(); 
	     
	    HashMap<String, Object> params = new HashMap<String, Object>(); 
	     
	    params.put("offset", offset); 
	    params.put("noOfRecords", noOfRecords); 
	     
	    writeList = sqlSession.selectList("writeList", params); 
	    this.noOfRecords = sqlSession.selectOne("writeGetCount");
	     
	    return writeList;
	  }
	 
	// 페이징
	@Override
	public int writeGetCount(SqlSessionTemplate sqlSession) throws Exception {
	  return sqlSession.selectOne("writeGetCount");
	}










	
}