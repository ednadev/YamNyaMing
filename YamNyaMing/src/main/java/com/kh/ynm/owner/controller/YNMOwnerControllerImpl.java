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
		String owId = request.getParameter("memberId");
		String owPw = request.getParameter("memberPw");
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
		{// 濡쒓렇�씤 �떎�뙣.
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

			// 媛�寃� �벑濡앹씠 �셿猷뚮릱�쑝硫�.
			if(result>0) {
				int storeInfoIndex = ynmOwnerServiceImpl.ynmSelectStoreIndex(request.getParameter("owStoreBizNum"));
				System.out.println("�벑濡앸맂 媛�寃뚯쓽 �씤�뜳�뒪 踰덊샇 " + storeInfoIndex);
				MenuInfo menuInfo = new MenuInfo();
				menuInfo.setOwStoreMenuTypeFk(2);//�꽕紐낇��엯
			}
			 
			
			
			return "ynmOwner/storeEnrollOwner";

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
		YNMOwner owner = ynmOwnerServiceImpl.idCheck(ownerId);
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
