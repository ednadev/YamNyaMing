package com.kh.ynm.admin.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.admin.model.service.YNMAdminServiceImpl;
import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.StorePageData;
import com.kh.ynm.owner.model.vo.StoreTitleData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

import com.kh.ynm.admin.model.vo.Notice;

@Controller
public class YNMAdminControllerImpl implements YNMAdminController{

	@Autowired
	@Qualifier(value="YNMAdminService")
	private YNMAdminServiceImpl ynmAdminServiceImpl;
	//관리자 페이지로 
	@RequestMapping(value="/enrollAdmin.do")
	public String insertAdmin(HttpSession session,YNMAdmin vo) 
	{
		return "ynmAdmin/enrollAdmin";	
	}
	//관리자 가입
	@RequestMapping(value="/enrollAdmin2.do")
	public String insertMember(HttpServletRequest request, HttpSession session,YNMAdmin vo) 
	{
		String grade = request.getParameter("combo");
		vo.setAd_id(request.getParameter("ad_id"));
		vo.setAd_password(request.getParameter("ad_password"));
		vo.setAd_nickname(request.getParameter("ad_nickname"));
		vo.setAd_grade(grade);
		System.out.println(vo.getAd_id());
		System.out.println(vo.getAd_nickname());
		System.out.println(vo.getAd_password());
		System.out.println(vo.getAd_grade());
		int result = ynmAdminServiceImpl.enrollAdmin(vo);
		if(result>0)
		{
			return "ynmAdmin/ynmAdmin";	
		}
		else 
		{
			return "ynmAdmin/adminError/error";	
		}
	}
	//회원가입 아이디 체크
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
	//점주 검색
	@RequestMapping(value="/OwnerSearch.do")
	public Object OwnerSearch(HttpServletRequest request, HttpSession session) 
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("admin")!=null) {
			String combo = request.getParameter("combo");
			String keyword = request.getParameter("keyword");
			System.out.println(keyword);
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			int recordCountPerPage = 6; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<YNMOwner> list = ynmAdminServiceImpl.OwnerSearch(combo,keyword,currentPage,recordCountPerPage);
			CouponPageData pageNavi = ynmAdminServiceImpl.owSearchGetTotal(combo,keyword,currentPage,recordCountPerPage,naviCountPerPage);
			view.addObject("list",list);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmAdmin/ownerSearch");
			return view;
		}
		else
		{
			return "ynmAdmin/adminError/error";
		}
	}
	// 멤버 검색
	@RequestMapping(value="/MemberSearch.do")
	public Object MemberSearch(HttpServletRequest request, HttpSession session) 
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("admin")!=null) {
			String combo = request.getParameter("combo");
			String keyword = request.getParameter("keyword");
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			int recordCountPerPage = 6; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<YNMMember> list= ynmAdminServiceImpl.MemberSearchPaging(combo,keyword,currentPage,recordCountPerPage);
			CouponPageData pageNavi = ynmAdminServiceImpl.memSearchGetTotal(combo,keyword,currentPage,recordCountPerPage,naviCountPerPage);
			view.addObject("list",list);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmAdmin/memberSearch");
			return view;
		}
		else 
		{
			return "ynmAdmin/adminError/error";
		}

	}
	//로그인 페이지로 이동
	@RequestMapping(value="/adminLogin.do")
	public String adminLogin(HttpSession session,YNMAdmin vo) 
	{
		return "ynmAdmin/ynmAdmin";	
	}
	//로그인
	@RequestMapping(value="/adminLogin2.do")
	public String adminLogin2(HttpServletRequest request,HttpSession session,YNMAdmin vo,
			@RequestParam String ad_id,@RequestParam String ad_pw) 
	{
		vo.setAd_id(ad_id);
		vo.setAd_password(ad_pw);
		session = request.getSession();
		YNMAdmin admin = ynmAdminServiceImpl.adminLogin(vo);
		session.setAttribute("admin", admin);
		if(session.getAttribute("admin")!=null) 
		{
			String grade = admin.getAd_grade();
			if(grade.equals("1"))	//관리자 등급이 승인상태일때
			{
				return "ynmAdmin/adminInfo";	
			}
			else					//승인 대기중일때
			{
				session.invalidate();
				return "ynmAdmin/adminError/loginfailed";
			}
		}
		else						//아이디나 비밀번호가 틀렸을때
		{
			return "ynmAdmin/adminError/loginError";
		}
	}

	//통계
	@RequestMapping(value="/statAdmin.do")
	public Object statAdmin(HttpSession session,AdminStatistics vo) 
	{
		if(session.getAttribute("admin")!=null) 
		{
			vo =  ynmAdminServiceImpl.statAdmin();
			ArrayList<YNMStoreInfo> list = ynmAdminServiceImpl.storeList();
			ModelAndView view = new ModelAndView();
			//오늘날짜
			String today = new java.text.SimpleDateFormat("MM/dd").format(new java.util.Date());
			vo.setToday(today);
			//어제날짜
			Calendar c1 = new GregorianCalendar();
			c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String yesterday = sdf.format(c1.getTime()); // String으로 저장
			vo.setYesterday(yesterday);
			//2일전
			Calendar c2 = new GregorianCalendar();
			c2.add(Calendar.DATE, -2); // 오늘날짜로부터 -1
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String threeday = sdf1.format(c2.getTime()); // String으로 저장
			vo.setThreeday(threeday);
			//3일전
			Calendar c3 = new GregorianCalendar();
			c3.add(Calendar.DATE, -3); // 오늘날짜로부터 -1
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String fourday = sdf2.format(c3.getTime()); // String으로 저장
			vo.setFourday(fourday);
			//4일전
			Calendar c4 = new GregorianCalendar();
			c4.add(Calendar.DATE, -4); // 오늘날짜로부터 -1
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String fiveday = sdf3.format(c4.getTime()); // String으로 저장
			vo.setFiveday(fiveday);
			//5일전
			Calendar c5 = new GregorianCalendar();
			c5.add(Calendar.DATE, -5); // 오늘날짜로부터 -1
			SimpleDateFormat sdf4 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String sixday = sdf4.format(c5.getTime()); // String으로 저장
			vo.setSixday(sixday);
			//6일전
			Calendar c6 = new GregorianCalendar();
			c6.add(Calendar.DATE, -6); // 오늘날짜로부터 -1
			SimpleDateFormat sdf5 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String sevenday = sdf5.format(c6.getTime()); // String으로 저장
			vo.setSevenday(sevenday);
			view.addObject("list",vo);
			view.addObject("list2",list);
			view.setViewName("ynmAdmin/mainAdmin");
			return view;
		}
		else 
		{
			return "ynmAdmin/adminError/error";
		}
	}
	//관리자 정보
	@RequestMapping(value="/adminInfo.do")
	public String adminInfo(HttpSession session,YNMAdmin vo) 
	{
		if(session.getAttribute("admin")!=null) 
		{
			return "ynmAdmin/adminInfo";	
		}else {
			return "ynmAdmin/adminError/error";
		}
	}

	//관리자(강등)
	@RequestMapping(value="/downGrade.do")
	public Object dounGrade(HttpSession session,HttpServletRequest request)
	{
		String ad_id = request.getParameter("ad_id");
		int list = ynmAdminServiceImpl.dounGrade(ad_id);
		return "ynmAdmin/adminSuccess/fixsuccess";
	}
	//관리자(수락)
	@RequestMapping(value="/upGrade.do")
	public Object upGrade(HttpSession session ,HttpServletRequest request)
	{
		String ad_id = request.getParameter("ad_id");
		int list = ynmAdminServiceImpl.upGrade(ad_id);
		return "ynmAdmin/adminSuccess/fixsuccess";
	}
	//관리자 로그아웃
	@RequestMapping(value="/logoutAdmin.do")
	public Object logoutAdmin(HttpSession session ,HttpServletRequest request)
	{
		session.invalidate();
		return "ynmAdmin/adminSuccess/logoutSuccess";	
	}
	//공지사항 글보기
	@RequestMapping(value="/noticeView.do")
	public Object noticeView(HttpSession session ,HttpServletRequest request,Notice vo)
	{
		ModelAndView view = new ModelAndView();
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		vo = ynmAdminServiceImpl.noticeView(noticeNo);
		view.addObject("notice",vo);
		view.setViewName("ynmAdmin/noticeView");
		return view;
	}
	//공지사항 글수정 페이지로 이동
	@RequestMapping(value="/adminBoardFix.do")
	public Object adminBoardFix(HttpSession session ,HttpServletRequest request,Notice vo)
	{

		String writeId = request.getParameter("userId");
		String adminId =  ((YNMAdmin)session.getAttribute("admin")).getAd_id();
		if(adminId.equals("admin")||adminId.equals(writeId))
		{
			ModelAndView view = new ModelAndView();
			view.addObject("notice",vo);
			view.setViewName("ynmAdmin/boardFixPage");
			return view;	
		}
		else
		{
			return "ynmAdmin/adminError/fixError";
		}
	}
	//공지사항 글수정
	@RequestMapping(value="/adminBoardFix2.do")
	public Object adminBoardFix2(HttpSession session ,HttpServletRequest request,Notice vo)
	{
		ModelAndView view = new ModelAndView();
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String contents = request.getParameter("owBoardTitle");
		String subject = request.getParameter("boardInfo");
		vo.setContents(contents);
		vo.setSubject(subject);
		vo.setNoticeNo(noticeNo);
		int result = ynmAdminServiceImpl.adminBoardFix(vo);
		view.addObject("notice",vo);
		view.setViewName("ynmAdmin/adminSuccess/boardfixSuccess");
		return view;
	}
	//공지사항 글삭제
	@RequestMapping(value="/adminBoardDelete.do")
	public Object adminBoardDelete(HttpSession session ,HttpServletRequest request,Notice vo)
	{
		String writeId = request.getParameter("userId");
		String adminId =  ((YNMAdmin)session.getAttribute("admin")).getAd_id();
		if(adminId.equals("admin")||adminId.equals(writeId))
		{
			ModelAndView view = new ModelAndView();
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			vo.setNoticeNo(noticeNo);
			System.out.println(vo.getNoticeNo());
			int result = ynmAdminServiceImpl.adminBoardDelete(vo);
			view.addObject("notice",vo);
			view.setViewName("ynmAdmin/adminSuccess/boardDeleteSuccess");
			return view;
		}
		else
		{
			return "ynmAdmin/adminError/BoardDeleteFailed";
		}
	}
	//공지사항 글쓰기권한 확인
	@RequestMapping(value="/noticeWrite.do")
	public Object noticeWrite(HttpSession session ,HttpServletRequest request,YNMAdmin vo)
	{
		int admin_info_pk = Integer.parseInt(request.getParameter("admin_info_pk"));
		String ad_id = request.getParameter("ad_id");
		String ad_password = request.getParameter("ad_password");
		String ad_nickname = request.getParameter("ad_nickname");
		String ad_grade = request.getParameter("ad_grade");
		vo.setAdmin_info_pk(admin_info_pk);
		vo.setAd_id(ad_id);
		vo.setAd_password(ad_password);
		vo.setAd_nickname(ad_nickname);
		vo.setAd_grade(ad_grade);
		System.out.println(admin_info_pk);
		System.out.println(ad_id);
		System.out.println(ad_password);
		System.out.println(ad_nickname);
		System.out.println(ad_grade);
		int result = ynmAdminServiceImpl.noticeWriteIdCheck(vo); // 관리자인지 체크 
		System.out.println(result);
		if(result>0)
		{
			return "ynmAdmin/boardWrite";
		}
		else
		{
			return "ynmAdmin/adminError/boardWriteError";
		}
	}
	//공지사항 쓰기 
	@RequestMapping(value="/adminNoticeWrite.do")
	public Object adminNoticeWrite(HttpSession session ,HttpServletRequest request,Notice vo)
	{
		String adminId =  ((YNMAdmin)session.getAttribute("admin")).getAd_id();
		String writeId = request.getParameter("ad_id");
		String subject = request.getParameter("owBoardTitle");
		String contents = request.getParameter("boardInfo");
		String ad_nickname = request.getParameter("ad_nickname");
		vo.setSubject(subject);
		vo.setContents(contents);
		vo.setUserId(writeId);
		vo.setUserNickname(ad_nickname);
		int write = ynmAdminServiceImpl.adminNoticeWrite(vo);
		return "ynmAdmin/adminSuccess/boardInsertSuccess";
	}
	//관리자 전체보기
	@RequestMapping(value="/adminList.do")
	public Object adminList(HttpSession session,HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("admin")!=null) 
		{
		int currentPage = 1;
		if(request.getParameter("currentPage")==null) currentPage=1;
		else currentPage=Integer.parseInt(request.getParameter("currentPage"));
		int recordCountPerPage = 6; //1. 1페이지에10개씩보이게
		int naviCountPerPage = 5; //2.
		ArrayList<YNMAdmin> list = ynmAdminServiceImpl.adminListPaging(currentPage,recordCountPerPage);
		CouponPageData pageNavi = ynmAdminServiceImpl.adminGetTotal(currentPage,recordCountPerPage,naviCountPerPage);
		view.addObject("list",list);
		view.addObject("pageNaviData", pageNavi);
		view.setViewName("ynmAdmin/allAdminView");
		return view;
		}
		else
		{
			return "ynmAdmin/adminError/error";
		}
	}
	//공지사항  
	@RequestMapping(value="/boardAdmin.do")
	public Object boardAdmin(HttpSession session,HttpServletRequest request) throws Exception
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("admin")!=null) 
		{
			YNMAdmin admin = (YNMAdmin)session.getAttribute("admin");
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			int recordCountPerPage = 6; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<Notice> noticeList = ynmAdminServiceImpl.noticeListPaging(currentPage,recordCountPerPage);
			CouponPageData pageNavi = ynmAdminServiceImpl.noticeGetTotal(currentPage,recordCountPerPage,naviCountPerPage);
			view.addObject("noticeListData", noticeList);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmAdmin/boardAdmin");
			return view;
		}
		else
		{
			return "ynmAdmin/adminError/error";
		}
	}
	//일반회원 전체보기
		@RequestMapping(value="/allMemberView.do")
		public Object allMemberView(HttpSession session,HttpServletRequest request) 
		{
			ModelAndView view = new ModelAndView();
			if(session.getAttribute("admin")!=null) {
				int currentPage = 1;
				if(request.getParameter("currentPage")==null) currentPage=1;
				else currentPage=Integer.parseInt(request.getParameter("currentPage"));
				int recordCountPerPage = 8; //1. 1페이지에10개씩보이게
				int naviCountPerPage = 5; //2.
				ArrayList<YNMMember> list = ynmAdminServiceImpl.memberListPaging(currentPage,recordCountPerPage);
				CouponPageData pageNavi = ynmAdminServiceImpl.memberGetTotal(currentPage,recordCountPerPage,naviCountPerPage);
				view.addObject("list",list);
				view.addObject("pageNaviData", pageNavi);
				view.setViewName("ynmAdmin/allMemberView");
				return view;
			}
			else 
			{
				return "ynmAdmin/adminError/error";
			}
		}
	//점주 전체보기
		@RequestMapping(value="/allOwnerView.do")
		public Object allOwnerView(HttpSession session, HttpServletRequest request) 
		{
			ModelAndView view = new ModelAndView();
			if(session.getAttribute("admin")!=null) 
			{
				int currentPage = 1;
				if(request.getParameter("currentPage")==null) currentPage=1;
				else currentPage=Integer.parseInt(request.getParameter("currentPage"));
				int recordCountPerPage = 8; //1. 1페이지에10개씩보이게
				int naviCountPerPage = 5; //2.
				ArrayList<YNMOwner> list = ynmAdminServiceImpl.ownerListPaging(currentPage,recordCountPerPage);
				CouponPageData pageNavi = ynmAdminServiceImpl.ownerGetTotal(currentPage,recordCountPerPage,naviCountPerPage);
				view.addObject("list",list);
				view.addObject("pageNaviData", pageNavi);
				view.setViewName("ynmAdmin/allOwnerView");
				return view;
			}
			else 
			{
				return "ynmAdmin/adminError/error";
			}
		}	
	//점주 가게현황 
	@RequestMapping(value="/ownerStoreList.do")
	public ModelAndView ownerStoreList(HttpSession session ,HttpServletRequest request,StoreInfoPageData vo)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("admin")!=null) 
		{
			
			//
			int owEntirePk = Integer.parseInt(request.getParameter("owEntirePk"));
			Notice n = new Notice();
			vo.setOwEntireFk(owEntirePk);
			n.setNoticeNo(owEntirePk);
			System.out.println(owEntirePk);
			//페이징 
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			int recordCountPerPage = 2; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<StoreInfoPageData> list = ynmAdminServiceImpl.storeListPaging(currentPage,recordCountPerPage,vo);
			CouponPageData pageNavi = ynmAdminServiceImpl.storePageNavi(currentPage,recordCountPerPage,naviCountPerPage,vo);		
			view.addObject("storeList", list);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmAdmin/owStoreList");
			request.setAttribute("StoreInfo", n);
			return view;
		}
		else
		{
			view.setViewName("ynmAdmin/adminError/error");
			return view;
		}			
	}
	//가게 (강등)
	@RequestMapping(value="/storeNo.do")
	public Object storeNo(HttpSession session,HttpServletRequest request)
	{
		String owStoreInfoPk = request.getParameter("owStoreInfoPk");
		int list = ynmAdminServiceImpl.storeNo(owStoreInfoPk);
		return "ynmAdmin/adminSuccess/storeYesNo";
	}
	//가게 (수락)
	@RequestMapping(value="/storeYes.do")
	public Object storeYes(HttpSession session ,HttpServletRequest request)
	{
		String owStoreInfoPk = request.getParameter("owStoreInfoPk");
		int result = ynmAdminServiceImpl.storeYes(owStoreInfoPk);
		return "ynmAdmin/adminSuccess/storeYesNo";
	}
}