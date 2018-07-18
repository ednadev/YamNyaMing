package com.kh.ynm.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.member.model.vo.YNMAdmin;

public interface YNMMemberDAO {
	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession);
}
