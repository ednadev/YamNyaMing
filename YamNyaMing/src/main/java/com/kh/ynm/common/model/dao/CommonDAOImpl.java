package com.kh.ynm.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.common.model.vo.StoreCategoryDetail;
import com.kh.ynm.common.model.vo.StoreCategoryMain;

@Repository("commonDAO")
public class CommonDAOImpl {

	public HashMap<String, StoreCategoryMain> storeCategoryLoad(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("commonsMap.storeCategoryMainLoad");
		ArrayList<StoreCategoryMain> cateList = (ArrayList<StoreCategoryMain>)list;
		HashMap<String, StoreCategoryMain> cateMainMap = new HashMap<String, StoreCategoryMain> ();
		for(int i = 0; i < cateList.size();i++)
		{
			cateMainMap.put(cateList.get(i).getStoreCateMainName(), cateList.get(i));
		}
		return cateMainMap;
	}
	
	public HashMap<String, StoreCategoryDetail> storeCategoryDetailLoad(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("commonsMap.storeCategoryDetailLoad");
		ArrayList<StoreCategoryDetail> cateList = (ArrayList<StoreCategoryDetail>)list;
		HashMap<String, StoreCategoryDetail> cateDetailMap = new HashMap<String, StoreCategoryDetail> ();
		for(int i = 0; i < cateList.size();i++)
		{
			cateDetailMap.put(cateList.get(i).getStoreCateDetailName(), cateList.get(i));
		}
		return cateDetailMap;
	}

}
