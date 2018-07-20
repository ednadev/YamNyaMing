package com.kh.ynm.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.admin.model.dao.YNMAdminDAO;
//import com.kh.ynm.admin.model.dao.YNMAdminDAOImpl;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
//
//@Service("YNMAdminService")
//public class YNMAdminServiceImpl implements YNMAdminService{
////	@Resource(name="YNMAdminDAO")
////	private YNMAdminDAOImpl adminDAO;
//
//	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//
//	public int enrollAdmin(YNMAdmin vo) {
//		int result = adminDAO.insertAdmin(vo,sqlSession);
//		if(result>0){return result;}
//		else {return 0;}
//	}
//
//
//    public YNMAdmin adminIdCheck(YNMAdmin vo) {
//    	YNMAdmin yd = adminDAO.adminIdCheck(sqlSession,vo);
//        return yd;
//    }
//
//
//
//	public List<Object> allMemberView(YNMAdmin vo) {
//		List<Object> list = adminDAO.allMemberView(vo,sqlSession);
//		return list;
//	}
//
//
//	public List<Object> allOwnerView(YNMAdmin vo) {
//		List<Object> list = adminDAO.allOwnerView(vo,sqlSession);
//		return list;
//	}
//
//
//	public List<Object> OwnerSearch(String search) {
//		List<Object> list = adminDAO.OwnerSearch(search,sqlSession);
//		return list;
//	}
//
//
//	public List<Object> MemberSearch(String search) {
//		List<Object> list = adminDAO.MemberSearch(search,sqlSession);
//		return list;
//	}
//
//
//	public YNMAdmin adminLogin(YNMAdmin vo) {
//		YNMAdmin admin = adminDAO.adminLogin(sqlSession,vo);
//		return admin;
//	}
//
//
//
//
//
//
//
//
//
//
//}
