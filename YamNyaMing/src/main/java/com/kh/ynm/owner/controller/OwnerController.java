package com.kh.ynm.owner.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface OwnerController {
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response);
	public String addStore(HttpSession session );
	// 
}
