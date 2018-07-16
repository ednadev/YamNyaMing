package com.kh.ynm.member.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMBook;
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
		YNMMember vo=new YNMMember();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPw(request.getParameter("memberPw"));
		YNMMember ym=ynmMemberServiceImpl.selectOneMember(vo);
		HttpSession session=request.getSession();
		if(ym!=null) {
			session.setAttribute("member", ym);
			return "redirect:/index.jsp";
		}else {
			return "ynmMember/fail";
		}

	}
	//mb_id 프라이머리키 설정
	//DAO수정
	//생일에 대하여 생각해보아야함....
	
//	@Override
//	@RequestMapping(value="/signUpMember.do")
//	public String signUpMember(YNMMember ym) {
//		ynmMemberServiceImpl.signUpMember(ym);
//		return null;
//	}
	
	@Override
	@RequestMapping(value="/signUpMember.do")
	public String signUpMember(HttpServletRequest request, HttpServletResponse response) {
		YNMMember ym=new YNMMember();
		ym.setMemberId(request.getParameter("memberId"));
		ym.setMemberPw(request.getParameter("memberPw"));
		ym.setMemberName(request.getParameter("memberName"));
		ym.setMemberNickName(request.getParameter("memberNickName"));
		ym.setMemberGender(request.getParameter("memberGender"));
		//yyyy-mm-dd 형태로 받아야함
		String memberBirth=request.getParameter("memberBirth"); 
		java.sql.Date birth = java.sql.Date.valueOf(memberBirth);
		ym.setMemberBirth(birth);
		
		ym.setMemberEmail(request.getParameter("memberEmail"));
		ym.setMemberPhone(request.getParameter("memberPhone"));
		ym.setMemberAvatar(request.getParameter("memberAvatar"));
		ynmMemberServiceImpl.signUpMember(ym);
		return null;
	}

	@Override
	@RequestMapping(value="/signOutMember.do")
	public String signOutMember(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMember ym=new YNMMember();
		session=request.getSession(false);
		ym.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		ym.setMemberPw(request.getParameter("memberPw"));

		int result=ynmMemberServiceImpl.signOutMember(ym);
		
		if(result>0) {
			session.invalidate();
			return "redirect:/index.jsp";
		}
		
		return null;
	}
	
	@Override
	@RequestMapping(value="/memberInfo.do")
	public Object memberInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		session=request.getSession(false);
		vo.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		vo.setMemberPw(request.getParameter("memberPw"));
		
		YNMMember ym=ynmMemberServiceImpl.selectOneMember(vo);
		ModelAndView view=new ModelAndView();
	if(ym!=null) {
			
			view.addObject("info",ym);
			view.setViewName("ynmMember/info");
			return view;
		}
		else {
			
		}
		return null;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/idCheck.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response,Model model) {
		String memberId=request.getParameter("memberId");
		YNMMember ym=ynmMemberServiceImpl.idCheck(memberId);
		
		if(ym==null) {
			String chk="0";
			return chk;
		}else {
			String chk="1";
			return chk;
			
		}
		
	}
	
	//예약하기 table
	
	@Override
	@RequestMapping(value="/bookInsert.do")
	public String bookInsert(YNMBook yb) {
		ynmMemberServiceImpl.bookInsert(yb);
		return null;
	}
	
	
	@Override
	@RequestMapping(value="/bookselect.do")
	public Object bookselect(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session=request.getSession(false);
		YNMBook vo=new YNMBook();
		vo.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntire());
		ArrayList list=ynmMemberServiceImpl.bookselect(vo);
		ModelAndView view=new ModelAndView();
		if(!list.isEmpty()) {
				
				view.addObject("bookInfo",list);
				view.setViewName("ynmMember/info");
				return view;
			}
			else {
				
			}
			return null;
	}
	



}
