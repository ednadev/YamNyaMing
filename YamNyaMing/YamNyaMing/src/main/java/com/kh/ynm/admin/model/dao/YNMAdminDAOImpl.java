package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;

@Repository("YNMAdminDAO")
public class YNMAdminDAOImpl implements YNMAdminDAO{

	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Admin.insertAdmin",vo);
	}

    public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo) {
    	return sqlSession.selectOne("Admin.adminIdCheck",vo);
    }
   
    public ArrayList<YNMMember> allMemberView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("Admin.allMemberView");
		return (ArrayList<YNMMember>) list;
		
	}

    public ArrayList<YNMOwner> allOwnerView(SqlSessionTemplate sqlSession) {
    	List list = sqlSession.selectList("Admin.allOwnerView");
		return (ArrayList<YNMOwner>) list;
	}

	public ArrayList<YNMOwner> OwnerSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Owner map넣기전:"+combo);
		System.out.println("Owner map넣기전:"+keyword);
		map.put("combo", combo);
		map.put("keyword", keyword);
		List list = sqlSession.selectList("Admin.OwnerSearch",map);
		return (ArrayList<YNMOwner>) list;
	}

	public ArrayList<YNMMember> MemberSearch(SqlSessionTemplate sqlSession,String combo,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Member map넣기전:"+combo);
		System.out.println("Member map넣기전:"+keyword);
		map.put("combo", combo);
		map.put("keyword", keyword);
		System.out.println("Member map 넣은후:"+map.get(combo));
		System.out.println("Member map 넣은후"+map.get(keyword));
		List list = sqlSession.selectList("Admin.MemberSearch",map);
		return (ArrayList<YNMMember>) list;
	}

	public YNMAdmin adminLogin(SqlSessionTemplate sqlSession, YNMAdmin vo) {
		System.out.println(vo.getAd_id());
		System.out.println(vo.getAd_password());
		return sqlSession.selectOne("Admin.adminLogin",vo);
	}


}
