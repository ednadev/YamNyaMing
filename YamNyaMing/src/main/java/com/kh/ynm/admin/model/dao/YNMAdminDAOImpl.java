package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Repository("YNMAdminDAO")
public class YNMAdminDAOImpl implements YNMAdminDAO{

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
		System.out.println("Owner map�ֱ���:"+combo);
		System.out.println("Owner map�ֱ���:"+keyword);
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
}