package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.ynm.owner.model.vo.YNMOwner;

public interface YNMOwnerController {
	// ���� �׽�Ʈ ������
	public String ynmOwnerTest();
	// ���� ȸ�� ����
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner);
	
	// ���� ���� �ҷ�����, �α���
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	// ���� �߰��ϱ�
	public String addStore(HttpSession session );
}
