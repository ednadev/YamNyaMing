package com.kh.ynm.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

@Repository("YNMAdminDAO")
public class YNMAdminDAOImpl implements YNMAdminDAO{

	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}

    public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo) {
    	return sqlSession.selectOne("admin.adminIdCheck",vo);
    }
   
    public List<Object> allMemberView(YNMAdmin vo, SqlSessionTemplate sqlSession) {
    		return sqlSession.selectList("admin.allMemberView",vo);
	}

	public List<Object> allOwnerView(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.allOwnerView",vo);
	}

	public List<Object> OwnerSearch(String search, SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.OwnerSearch",search);
	}

	public List<Object> MemberSearch(String search, SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("admin.MemberSearch",search);
	}

	public YNMAdmin adminLogin(SqlSessionTemplate sqlSession, YNMAdmin vo) {
		return sqlSession.selectOne("admin.adminLogin",vo);
	}


}
