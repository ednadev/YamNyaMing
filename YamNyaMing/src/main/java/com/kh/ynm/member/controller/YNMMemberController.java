package com.kh.ynm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ynm.member.model.vo.YNMMember;

public interface YNMMemberController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
//	public String signUpMember(YNMMember ym);// ȸ������
	public String signUpMember(HttpServletRequest request, HttpServletResponse response);// ȸ������
	public String signOutMember(HttpSession session);// ȸ��Ż��
}
