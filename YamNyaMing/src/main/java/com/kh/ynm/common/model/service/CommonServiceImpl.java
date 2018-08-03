package com.kh.ynm.common.model.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.common.model.dao.CommonDAOImpl;
import com.kh.ynm.common.model.vo.StoreCategoryDetail;
import com.kh.ynm.common.model.vo.StoreCategoryMain;
import com.kh.ynm.owner.model.dao.YNMOwnerDAOImpl;

@Service("commonService")
public class CommonServiceImpl {

	@Resource(name="commonDAO")
	private CommonDAOImpl commonDAOImpl;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public HashMap<String, StoreCategoryMain> storeCategoryLoad() {
		HashMap<String, StoreCategoryMain> cateMainMap = commonDAOImpl.storeCategoryLoad(sqlSession);
		return cateMainMap;
	}

	public HashMap<String, StoreCategoryDetail> storeCateDetailLoad() {
		HashMap<String, StoreCategoryDetail> cateDetailMap = commonDAOImpl.storeCategoryDetailLoad(sqlSession);
		return cateDetailMap;
	}

}
