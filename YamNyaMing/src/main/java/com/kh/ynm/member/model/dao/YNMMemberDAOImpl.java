package com.kh.ynm.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

@Repository("ynmMemberDAO")
public class YNMMemberDAOImpl implements YNMMemberDAO{

	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}

    public YNMAdmin adminIdCheck(SqlSessionTemplate sqlSession,YNMAdmin vo) {
    	return sqlSession.selectOne("admin.adminIdCheck",vo);
    }
   
    public List<Object> allMemberView(YNMAdmin vo, SqlSessionTemplate sqlSession) {
    		return sqlSession.selectList("admin.allMemberView",vo);
	}


}
