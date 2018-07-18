package com.kh.ynm.member.controller;

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

import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

@Controller
public class YNMMemberControllerImpl implements YNMMemberController{

	@Autowired
	@Qualifier(value="ynmMemberService")
	private YNMMemberServiceImpl ynmMemberServiceImpl;
	

	@Override
	@RequestMapping(value="/ynmMemberTest.do")
	public String testMemberQueryTest() {
		return "ynmMember/ynmMemberTest";
	}
	
	@Override
	@RequestMapping(value="/login.do")
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String signUpMember(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String signOutMember(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}
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
			int result = ynmMemberServiceImpl.enrollAdmin(vo);
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
			List<Object> list = ynmMemberServiceImpl.allMemberView(vo);
			return "ynmAdmin/allMemberView";
		}


	    
	    @ResponseBody
	    @RequestMapping(value="/idCheck.do")
	    public String adminIdCheck(HttpServletRequest request, HttpServletResponse response,YNMAdmin vo) {
	        String ad_id = request.getParameter("ad_id");
	        vo.setAd_id(ad_id); 
	        YNMAdmin yd = ynmMemberServiceImpl.adminIdCheck(vo);
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
}