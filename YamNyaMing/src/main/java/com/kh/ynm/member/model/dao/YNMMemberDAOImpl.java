package com.kh.ynm.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMAdmin;

@Repository("ynmMemberDAO")
public class YNMMemberDAOImpl implements YNMMemberDAO{

	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("admin.insertAdmin",vo);
	}

	public int adminIdCheck(String id, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin.adminIdCheck",id);
	}


}
