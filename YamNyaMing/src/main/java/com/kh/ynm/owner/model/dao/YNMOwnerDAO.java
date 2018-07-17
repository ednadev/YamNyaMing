package com.kh.ynm.owner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.ynm.owner.model.vo.YNMOwner;

public interface YNMOwnerDAO {
	public int ynmOwnerSignUp(SqlSessionTemplate sqlSession, YNMOwner owner);
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, String ownerid);
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, YNMOwner owner);
}
