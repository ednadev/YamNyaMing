package com.kh.ynm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

public interface YNMMemberController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
	public String enrollMember();
	public String signUpMember(HttpSession session);// ȸ������
	public String signOutMember(HttpSession session);// ȸ��Ż��
}
