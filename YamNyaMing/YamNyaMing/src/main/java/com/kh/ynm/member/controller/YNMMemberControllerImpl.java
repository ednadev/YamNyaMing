package com.kh.ynm.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.common.MyFileRenamePolicy;
import com.kh.ynm.member.controller.YNMMemberController;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMStoreReview;


@Controller
public class YNMMemberControllerImpl implements YNMMemberController{

	@Autowired
	ServletContext context;
		
	@Autowired
	@Qualifier(value="ynmMemberService")
	private YNMMemberServiceImpl ynmMemberServiceImpl;
	
	@Override
	@RequestMapping(value="/ynmMemberTest.do")
	public String testMemberQueryTest() {
		return "ynmMember/ynmMemberTest";
	}
	
	//로그인
	@Override
	@RequestMapping(value="/memberLogin.do")
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
	
	//회원 가입
	@Override
	@RequestMapping(value="/signUpMember.do")
	public String signUpMember(@RequestParam("avatar") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
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
		
		String OriginName=file.getOriginalFilename();
		String remakeName=System.currentTimeMillis()+"_"+OriginName;
		String photoRoute="C:\\Users\\user1\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\memberPhoto\\"+remakeName;
		String photoViewRoute="\\memberPhoto\\"+remakeName;
		File f=new File(photoRoute);
		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		YNMMemberUploadPhoto ymup=new YNMMemberUploadPhoto();
		ymup.setOriginName(OriginName);
		ymup.setRemakeName(remakeName);
		ymup.setPhotoRoute(photoRoute);
		ymup.setPhotoViewRoute(photoViewRoute);
		
		int result=ynmMemberServiceImpl.memberUploadPhoto(ymup);
		
		YNMMemberUploadPhoto ymupIndex=ynmMemberServiceImpl.memberIndexSelect(remakeName);
		
		
		ym.setMemberAvatar(ymupIndex.getUploadPhotoNo());
		
		ynmMemberServiceImpl.signUpMember(ym);
		
		
		return null;
	}
	
	
	//회원 탈퇴
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
	
	//내정보 확인
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
			view.addObject("img","\\memberPhoto\\1531815232521_Koala.jpg");
			view.setViewName("ynmMember/info");
			return view;
		}
		else {
			
		}
		return null;
	}
	//회원 가입시 아이디 유효성 검사
	@Override
	@ResponseBody
	@RequestMapping(value="/memberIdCheck.do")
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
	//회원 가입시 닉네임 유효성 검사
	@Override
	@ResponseBody
	@RequestMapping(value="/nickCheck.do")
	public String nickCheck(HttpServletRequest request, HttpServletResponse response,Model model) {
		String memberNickName=request.getParameter("memberNickName");
		YNMMember ym=ynmMemberServiceImpl.nickCheck(memberNickName);
		
		if(ym==null) {
			String chk="0";
			return chk;
		}else {
			String chk="1";
			return chk;
			
		}
		
	}
	
	
	//예약하기 table
	//예약 하기
	@Override
	@RequestMapping(value="/bookInsert.do")
	public String bookInsert(YNMBook yb) {
		ynmMemberServiceImpl.bookInsert(yb);
		return null;
	}
	
	//예약 정보 확인
	@Override
	@RequestMapping(value="/bookselect.do")
	public Object bookselect(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session=request.getSession(false);
		YNMBook vo=new YNMBook();
		vo.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
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
	
	
	
	//리뷰 table
	@Override
	@RequestMapping(value="/storeReviewInsert.do")
	public String storeReviewInsert(HttpSession session,HttpServletRequest request, HttpServletResponse response,YNMStoreReview ysr) {
		session=request.getSession(false);
		ysr.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		int result=ynmMemberServiceImpl.storeReviewInsert(ysr);
			return null;
	}
	


	//사용자 : 회원가입 페이지로 이동
	@Override
	@RequestMapping(value="/enrollMember.do")
	public String enrollMember() {
		return "ynmMember/signUpMember";
	}	
	
	//점장 : 입점신청 약관동의 페이지로 이동
	@RequestMapping(value="/enrollOwner.do")
	public String enrollOwner() {
		return "ynmOwner/enrollOwner";
	}
	
	//점장 : 입점신청 계정정보입력 페이지로 이동
	@RequestMapping(value="/signUpOwner.do")
	public String signUpOwner() {
		return "ynmOwner/signUpOwner";
	}
	
	//점장 : 입점신청 음식점정보입력 페이지로 이동
	@RequestMapping(value="/signUpOwner2.do")
	public String signUpOwner2() {
		return "ynmOwner/signUpOwner2";
	}
	
	//관리자 : 관리자 로그인 페이지로 이동
	@RequestMapping(value="/ynmAdmin.do")
	public String ynmAdmin() {
		return "ynmAdmin/ynmAdmin";
	}
	
	//관리자 : 관리자 메인 페이지로 이동
	@RequestMapping(value="/mainAdmin.do")
	public String adminMain() {
		return "ynmAdmin/mainAdmin";
	}

}
