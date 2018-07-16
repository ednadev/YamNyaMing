package com.kh.ynm.owner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.owner.model.service.YNMOwnerServiceImpl;
import com.kh.ynm.owner.model.vo.YNMOwner;

@Controller
public class YNMOwnerControllerImpl implements YNMOwnerController{

	@Autowired
	@Qualifier(value="ynmOwnerService")
	private YNMOwnerServiceImpl ynmOwnerServiceImpl;
	
	
	@Override
	@RequestMapping(value="/ownerLogin.do")
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
	
	@Override
	public String ynmOwnerSignOut(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	@RequestMapping(value="/ownerAddStore.do")
	public String addStore(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	@RequestMapping(value="/ownerSignUp.do")
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner) {
		int result = ynmOwnerServiceImpl.ynmOwnerSignUp(owner);
		return "ynmOwner/ynmOwnerTest";
	}
	
	
	@Override
	@RequestMapping(value="/ownerIdChk.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ownerId = request.getParameter("ownerId");
		System.out.println("아이디 체크 " + ownerId);
//		YNMOwner owner = ynmOwnerServiceImpl.selectOneOwner(ownerId);
//		System.out.println(owner.getOwId());
		response.getWriter().println("y");
		return "y";
//		if(owner!=null) return "ynmOwner/ynmOwnerTest?ownerId=y";
//		else return "ynmOwner/ynmOwnerTest?ownerId=n";
	}
	

}
