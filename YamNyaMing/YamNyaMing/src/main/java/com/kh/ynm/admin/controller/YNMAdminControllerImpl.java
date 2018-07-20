package com.kh.ynm.admin.controller;

import java.io.IOException;
import java.security.acl.Owner;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.admin.model.service.YNMAdminServiceImpl;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;

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
		public Object allMemberView(HttpSession session) 
		{
			
			ArrayList<YNMMember> list = ynmAdminServiceImpl.allMemberView();
			 ModelAndView view = new ModelAndView();
			  if(list!=null)
			  {
					view.addObject("list",list);
					view.setViewName("ynmAdmin/allMemberView");
					return view;
			  }else
			  {
					return "ynmAdmin/allMemberView";
			  }
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
		public Object allOwnerView(HttpServletRequest request, HttpSession session) 
		{
			
			 ArrayList<YNMOwner> list = ynmAdminServiceImpl.allOwnerView();
			 ModelAndView view = new ModelAndView();
			  if(list!=null)
			  {
					view.addObject("list",list);
					view.setViewName("ynmAdmin/allOwnerView");
					return view;
			  }else
			  {
					return "ynmAdmin/allOwnerView";
			  }
		}
		
		@RequestMapping(value="/OwnerSearch.do")
		public Object OwnerSearch(HttpServletRequest request, HttpSession session) 
		{
			String combo = request.getParameter("combo");
			String keyword = request.getParameter("keyword");
			 ModelAndView view = new ModelAndView();
			ArrayList<YNMOwner> list = ynmAdminServiceImpl.OwnerSearch(combo,keyword);
			  if(list!=null)
			  {
					view.addObject("list",list);
					view.setViewName("ynmAdmin/allOwnerView");
					return view;
			  }else
			  {
					return "ynmAdmin/allOwnerView";
			  }
		}
		
		
		@RequestMapping(value="/MemberSearch.do")
		public Object MemberSearch(HttpServletRequest request, HttpSession session) 
		{
			String combo = request.getParameter("combo");
			String keyword = request.getParameter("keyword");
			 ModelAndView view = new ModelAndView();
			ArrayList<YNMMember> list= ynmAdminServiceImpl.MemberSearch(combo,keyword);
			  if(list!=null)
			  {
					view.addObject("list",list);
					view.setViewName("ynmAdmin/allMemberView");
					return view;
			  }else
			  {
					return "ynmAdmin/allMemberView";
			  }
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
		@RequestMapping(value="/boardAdmin.do")
		public String boardAdmin(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/boardAdmin";	
		}

		@RequestMapping(value="/statAdmin.do")
		public String statAdmin(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/statAdmin";	
		}
		@RequestMapping(value="/adminInfo.do")
		public String adminInfo(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/adminInfo";	
		}

		@RequestMapping(value="/ownerBlock.do")
		public String adminInfo(HttpSession session,YNMOwner vo)
		{
			return "ynmAdmin/allOwnerView";
		}
		
		

		
		
     
	
	    
}