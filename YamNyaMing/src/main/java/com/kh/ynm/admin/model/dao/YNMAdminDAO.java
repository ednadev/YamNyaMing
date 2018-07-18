package com.kh.ynm.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.admin.model.vo.YNMAdmin;

public interface YNMAdminDAO {
	public int insertAdmin(YNMAdmin vo, SqlSessionTemplate sqlSession);
}
