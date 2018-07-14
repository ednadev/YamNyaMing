package com.kh.ynm.member.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.dao.YNMMemberDAO;
import com.kh.ynm.member.model.dao.YNMMemberDAOImpl;
import com.kh.ynm.member.model.vo.YNMMember;

@Service("ynmMemberService")
public class YNMMemberServiceImpl implements YNMMemberService{
	@Resource(name="ynmMemberDAO")
	private YNMMemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int signUpMember(YNMMember ym) {
		int result=memberDAO.signUpMember(sqlSession,ym);
		return result;
		
	}
}
