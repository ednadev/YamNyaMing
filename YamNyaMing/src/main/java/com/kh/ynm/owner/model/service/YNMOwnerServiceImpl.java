package com.kh.ynm.owner.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.owner.model.dao.YNMOwnerDAOImpl;
import com.kh.ynm.owner.model.vo.YNMOwner;

@Service("ynmOwnerService")
public class YNMOwnerServiceImpl implements YNMOwnerService{
	@Resource(name="ynmOwnerDAO")
	private YNMOwnerDAOImpl ynmOwnerDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int ynmOwnerSignUp(YNMOwner owner) {
		int result = ynmOwnerDAO.ynmOwnerSignUp(sqlSession, owner);
		return result;
	}
}
