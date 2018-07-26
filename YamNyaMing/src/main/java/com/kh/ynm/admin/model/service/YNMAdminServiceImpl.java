package com.kh.ynm.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.admin.model.dao.YNMAdminDAO;
import com.kh.ynm.admin.model.dao.YNMAdminDAOImpl;
import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Service("YNMAdminService")
public class YNMAdminServiceImpl implements YNMAdminService{
	@Resource(name="YNMAdminDAO")
	private YNMAdminDAOImpl adminDAO;

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int enrollAdmin(YNMAdmin vo) {
		int result = adminDAO.insertAdmin(vo,sqlSession);
		if(result>0){return result;}
		else {return 0;}
	}


    public YNMAdmin adminIdCheck(YNMAdmin vo) {
    	YNMAdmin yd = adminDAO.adminIdCheck(sqlSession,vo);
        return yd;
    }



	public ArrayList<YNMMember> allMemberView() {
		ArrayList<YNMMember> list = adminDAO.allMemberView(sqlSession);
		return list;
	}


	public ArrayList<YNMOwner> allOwnerView() {
		ArrayList<YNMOwner> list = adminDAO.allOwnerView(sqlSession);
		return list;
	}


	public ArrayList<YNMOwner> OwnerSearch(String combo, String keyword) {
		ArrayList<YNMOwner> list = adminDAO.OwnerSearch(sqlSession,combo,keyword);
		return list;
	}


	public ArrayList<YNMMember>  MemberSearch(String combo, String keyword) {
		ArrayList<YNMMember>list = adminDAO.MemberSearch(sqlSession,combo,keyword);
		return list;
	}


	public YNMAdmin adminLogin(YNMAdmin vo) {
		YNMAdmin admin = adminDAO.adminLogin(sqlSession,vo);
		return admin;
	}


	public int ownerBlock(YNMOwner vo) {
		int result = adminDAO.ownerBlock(vo,sqlSession);
		if(result>0){return result;}
		else {return 0;}
	}


	public AdminStatistics statAdmin() {
		AdminStatistics state = adminDAO.statAdmin(sqlSession);
		return state;
	}


	public ArrayList<YNMStoreInfo> storeList() {
		ArrayList<YNMStoreInfo>list = adminDAO.storeList(sqlSession);
		return list;
	}

}
