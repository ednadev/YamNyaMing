package com.kh.ynm.owner.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Repository("ynmOwnerDAO")
public class YNMOwnerDAOImpl implements YNMOwnerDAO{

	@Override
	public int ynmOwnerSignUp(SqlSessionTemplate sqlSession, YNMOwner owner) {	
		return sqlSession.insert("owners.ownerSignUp", owner);
	}
	
	@Override
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, String ownerid) {
		return sqlSession.selectOne("owners.ownerCheckId", ownerid);
	}

	@Override
	public YNMOwner selectOneOwner(SqlSessionTemplate sqlSession, YNMOwner owner) {
		return sqlSession.selectOne("owners.ownerLogin", owner);
	}

	@Override
	public int ynmStoreAdd(SqlSessionTemplate sqlSession, YNMStoreInfo storeInfo) {
		return sqlSession.insert("stores.storeAdd", storeInfo);
	}


	public int ynmSelectStoreIndex(SqlSessionTemplate sqlSession, String bizNum) {
		return sqlSession.insert("stores.storeSearchWithBizNum", bizNum);
	}

	
}
