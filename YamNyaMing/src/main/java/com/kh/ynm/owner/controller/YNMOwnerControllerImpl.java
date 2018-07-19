package com.kh.ynm.owner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.owner.model.service.YNMOwnerServiceImpl;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Controller
public class YNMOwnerControllerImpl implements YNMOwnerController{

	@Autowired
	@Qualifier(value="ynmOwnerService")
	private YNMOwnerServiceImpl ynmOwnerServiceImpl;
	
	
	@Override
	@RequestMapping(value="/ownerLogin.do")
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String owId = request.getParameter("owId");
		String owPw = request.getParameter("owPw");
		YNMOwner owner = new YNMOwner();
		owner.setOwId(owId);
		owner.setOwPw(owPw);
		YNMOwner resultOwner = ynmOwnerServiceImpl.selectOneOwner(owner);
		if(resultOwner!=null)
		{
			session.setAttribute("owner", resultOwner);
			return "redirect:/";
		}
		else
		{// 로그인 실패.
			return "ynmOwner/ynmOwnerError/ownerLoginFail";
		}
		
	}
	
	@Override
	@RequestMapping(value="/ownerSignOut.do")
	public String ynmOwnerSignOut(HttpSession session, @RequestParam String owId, @RequestParam String owPw) {
		
		
		return null;
	}
	
	

	@Override
	@RequestMapping(value="/ownerAddStore.do")
	public String addStore(HttpSession session, YNMStoreInfo storeInfo) {
		if(session.getAttribute("owner")!=null) {
			int result = ynmOwnerServiceImpl.ynmStoreAdd(storeInfo);
			
			return null;
		}
		return null;
	}


	@Override
	@RequestMapping(value="/ownerSignUp.do")
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner) {
		int result = ynmOwnerServiceImpl.ynmOwnerSignUp(owner);
		return "redirect:/";
	}
	
	
	@Override
	@ResponseBody
	@RequestMapping(value="/ownerIdChk.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ownerId = request.getParameter("ownerId");
		YNMOwner owner = ynmOwnerServiceImpl.selectOneOwner(ownerId);
		if(owner!=null) return "y";
		else return "n";
	}

	@Override
	@RequestMapping(value="/ownerLogout.do")
	public String ynmOwnerLogout(HttpSession session) {
		if(session.getAttribute("owner")!=null)
		{
			session.removeAttribute("owner");
		}
		return "redirect:/";
	}
	

}
