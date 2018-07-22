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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.owner.model.service.YNMOwnerServiceImpl;
import com.kh.ynm.owner.model.vo.MenuInfo;
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
	public String addStore(@RequestParam("mainImgFile") MultipartFile mainImgFile,@RequestParam("menuImageFile") MultipartFile menuImgFile, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			YNMStoreInfo storeInfo = new YNMStoreInfo();
			storeInfo.setOwEntireFk(owner.getOwEntirePk());
			storeInfo.setOwStoreBizNum(request.getParameter("owStoreBizNum"));
			storeInfo.setOwStoreName(request.getParameter("owStoreName"));
			String tel = request.getParameter("regionTel")+request.getParameter("owTel");
			storeInfo.setOwStoreTel(tel);
			storeInfo.setOwBigTypeFk(1);
			storeInfo.setOwSmallTypeFk(1);
			storeInfo.setOwStoreUrl(request.getParameter("owStoreUrl"));
			String addr = request.getParameter("postNum") + request.getParameter("addrStreet") + request.getParameter("detailAddr");
			System.out.println("주소 " + addr);
			storeInfo.setOwStoreAddr(addr);
			String owStoreWorkingTime = request.getParameter("workingWeek")+" " + 
					request.getParameter("owStoreWorkingTimeStart") +"-" + request.getParameter("owStoreWorkingTimeEnd") + 
					" " + request.getParameter("extWorkingOption");
			storeInfo.setOwStoreWorkingTime(owStoreWorkingTime); 
			
			int result = ynmOwnerServiceImpl.ynmStoreAdd(storeInfo);
			
			int storeInfoIndex = ynmOwnerServiceImpl.ynmSelectStoreIndex(request.getParameter("owStoreBizNum"));
			
			MenuInfo menuInfo = new MenuInfo();
			menuInfo.setOwStoreMenuTypeFk(2);//설명타입 
			
			
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
