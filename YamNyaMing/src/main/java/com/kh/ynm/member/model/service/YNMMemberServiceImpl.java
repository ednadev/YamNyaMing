package com.kh.ynm.member.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.dao.YNMMemberDAO;
import com.kh.ynm.member.model.dao.YNMMemberDAOImpl;
import com.kh.ynm.member.model.vo.YNMAdmin;

@Service("ynmMemberService")
public class YNMMemberServiceImpl implements YNMMemberService{
	@Resource(name="ynmMemberDAO")
	private YNMMemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int enrollAdmin(YNMAdmin vo) {
		int result = memberDAO.insertAdmin(vo,sqlSession);
		if(result>0){return result;}
		else {return 0;}
	}


	public int adminIdCheck(String id) {
		int result = memberDAO.adminIdCheck(id,sqlSession);
		if(result>0){return result;}
		else {return 0;}
	}

}
