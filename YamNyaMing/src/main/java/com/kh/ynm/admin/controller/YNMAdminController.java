package com.kh.ynm.admin.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.kh.ynm.admin.model.vo.YNMAdmin;

public interface YNMAdminController {
	public String allMemberView(HttpServletRequest request, HttpSession session,YNMAdmin vo);

}
