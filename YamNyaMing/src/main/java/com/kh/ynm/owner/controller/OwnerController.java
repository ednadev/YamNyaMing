package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface OwnerController {
	// ���� ���� �ҷ�����, �α���
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	// ���� �߰��ϱ�
	public String addStore(HttpSession session );
	// 
}
