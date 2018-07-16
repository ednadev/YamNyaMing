package com.kh.ynm.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;

public interface YNMMemberController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
//	public String signUpMember(YNMMember ym);// ȸ������
	public String signUpMember(HttpServletRequest request, HttpServletResponse response);// ȸ������
	public String signOutMember(HttpSession session,HttpServletRequest request, HttpServletResponse response);// ȸ��Ż��
	public Object memberInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String bookInsert(YNMBook yb);
	
	public Object bookselect(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public String idCheck(HttpServletRequest request, HttpServletResponse response, Model model);
}
