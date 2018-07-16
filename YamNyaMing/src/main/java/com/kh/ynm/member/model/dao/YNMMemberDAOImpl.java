package com.kh.ynm.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;

@Repository("ynmMemberDAO")
public class YNMMemberDAOImpl implements YNMMemberDAO{

	public int signUpMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.insert("members.signUpMember",ym);
	}

	public YNMMember selectOneMember(SqlSessionTemplate sqlSession, YNMMember vo) {
		return sqlSession.selectOne("members.selectOneMember",vo);
	}

	public int signOutMember(SqlSessionTemplate sqlSession, YNMMember ym) {
		return sqlSession.delete("members.deleteMember",ym);
	}

	public int bookInsert(SqlSessionTemplate sqlSession, YNMBook yb) {
		return sqlSession.insert("book.bookInfo",yb);
	}

	public ArrayList<YNMBook> bookselect(SqlSessionTemplate sqlSession, YNMBook vo) {
		List list=sqlSession.selectList("book.bookCheck",vo);
		return (ArrayList<YNMBook>)list;
	}
	
}
