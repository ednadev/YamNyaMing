package com.kh.ynm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ynm.member.model.vo.YNMAdmin;

public interface YNMMemberController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
	public String signUpMember(HttpSession session);// ȸ������
	public String signOutMember(HttpSession session);// ȸ��Ż��
	public String insertMember(HttpServletRequest request, HttpSession session,YNMAdmin vo);
	public String adminIdCheck(HttpServletRequest request, HttpSession session,YNMAdmin vo);
}
