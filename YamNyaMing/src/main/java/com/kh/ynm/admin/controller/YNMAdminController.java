package com.kh.ynm.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.kh.ynm.admin.model.vo.YNMAdmin;

public interface YNMAdminController {
	public String testMemberQueryTest();// �׽�Ʈ ����
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response);// ȸ�� �˻�
	public String signUpMember(HttpSession session);// ȸ������
	public String signOutMember(HttpSession session);// ȸ��Ż��
	public String insertMember(HttpServletRequest request, HttpSession session,YNMAdmin vo);
	public String allMemberView(HttpServletRequest request, HttpSession session,YNMAdmin vo);

}
