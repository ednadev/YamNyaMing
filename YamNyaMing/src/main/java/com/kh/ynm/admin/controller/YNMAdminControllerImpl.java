package com.kh.ynm.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ynm.admin.model.service.YNMAdminServiceImpl;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

@Controller
public class YNMAdminControllerImpl implements YNMAdminController{

	@Autowired
	@Qualifier(value="YNMAdminService")
	private YNMAdminServiceImpl ynmAdminServiceImpl;
	

	@RequestMapping(value="/enrollAdmin.do")
	public String insertAdmin(HttpSession session,YNMAdmin vo) 
	{
		return "ynmAdmin/enroll";	
	}
	@RequestMapping(value="/enrollAdmin2.do")
	public String insertMember(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
	{
		String grade = request.getParameter("combo");
		vo.setAd_grade(grade);
		System.out.println(vo.getAd_id());
		System.out.println(vo.getAd_nickname());
		System.out.println(vo.getAd_password());
		System.out.println(vo.getAd_grade());
			int result = ynmAdminServiceImpl.enrollAdmin(vo);
			if(result>0)
			{
				return "ynmAdmin/enrollSuccess";	
			}else {
				return "ynmAdmin/enrollFailed";	
			}
	}
	
		@RequestMapping(value="/allMemberView.do")
		public String allMemberView(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
		{
			List<Object> list = ynmAdminServiceImpl.allMemberView(vo);
			return "ynmAdmin/allMemberView";
		}


	    
	    @ResponseBody
	    @RequestMapping(value="/adminIdCheck.do")
	    public String adminIdCheck(HttpServletRequest request, HttpServletResponse response,YNMAdmin vo) {
	        String ad_id = request.getParameter("ad_id");
	        vo.setAd_id(ad_id); 
	        YNMAdmin yd = ynmAdminServiceImpl.adminIdCheck(vo);
	        if(yd!=null)
	        {
	        	String data="1";
	            return data; 
	        }
	        else 
	        {
	            String data="0";
	            return data;   
	        }        
	    }
		@RequestMapping(value="/allOwnerView.do")
		public String allOwnerView(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
		{
			List<Object> list = ynmAdminServiceImpl.allOwnerView(vo);
			return "ynmAdmin/allOwnerView";
		}
		
		@RequestMapping(value="/OwnerSearch.do")
		public String OwnerSearch(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
		{
			String search = request.getParameter("search");
			List<Object> list = ynmAdminServiceImpl.OwnerSearch(search);
			return "ynmAdmin/allOwnerView";
		}
		
		@RequestMapping(value="/MemberSearch.do")
		public String MemberSearch(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
		{
			String search = request.getParameter("search");
			List<Object> list = ynmAdminServiceImpl.MemberSearch(search);
			return "ynmAdmin/allMemberView";
		}
		
		@RequestMapping(value="/adminLogin.do")
		public String adminLogin(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/ynmAdmin";	
		}
		@RequestMapping(value="/adminLogin2.do")
		public String adminLogin2(HttpServletRequest request,HttpSession session,YNMAdmin vo,
									   @RequestParam String ad_id,@RequestParam String ad_pw) 
		{
			
			vo.setAd_id(ad_id);
			vo.setAd_password(ad_pw);
			System.out.println(ad_id);
			System.out.println(ad_pw);
			YNMAdmin admin = ynmAdminServiceImpl.adminLogin(vo);
			session = request.getSession();
			if(admin!=null)
			{
				session.setAttribute("admin", admin);
				return "ynmAdmin/adminMain";	
			}else
			{
				return "ynmAdmin/enrollFailed";
			}
			
			
		}
		
		
		
     
	    
	    
	    
}