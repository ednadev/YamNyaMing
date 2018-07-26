package com.kh.ynm.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.admin.model.service.YNMAdminServiceImpl;
import com.kh.ynm.admin.model.vo.AdminStatistics;
import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

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
				return "ynmAdmin/adminInfo";	
			}else
			{
				return "ynmAdmin/ynmAdmin";
			}
		}
		@RequestMapping(value="/boardAdmin.do")
		public String boardAdmin(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/boardAdmin";	
		}

		@RequestMapping(value="/statAdmin.do")
		public Object statAdmin(HttpSession session,AdminStatistics vo) 
		{
			AdminStatistics state =  ynmAdminServiceImpl.statAdmin();
			ModelAndView view = new ModelAndView();
			
			
			//오늘날짜
			String today = new java.text.SimpleDateFormat("MM/dd").format(new java.util.Date());
			state.setToday(today);
			//어제날짜
			Calendar c1 = new GregorianCalendar();
			c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String yesterday = sdf.format(c1.getTime()); // String으로 저장
			state.setYesterday(yesterday);
			//2일전
			Calendar c2 = new GregorianCalendar();
			c2.add(Calendar.DATE, -2); // 오늘날짜로부터 -1
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String threeday = sdf1.format(c2.getTime()); // String으로 저장
			state.setThreeday(threeday);
			//3일전
			Calendar c3 = new GregorianCalendar();
			c3.add(Calendar.DATE, -3); // 오늘날짜로부터 -1
			SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String fourday = sdf2.format(c3.getTime()); // String으로 저장
			state.setFourday(fourday);
			//4일전
			Calendar c4 = new GregorianCalendar();
			c4.add(Calendar.DATE, -4); // 오늘날짜로부터 -1
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String fiveday = sdf3.format(c4.getTime()); // String으로 저장
			state.setFiveday(fiveday);
			//5일전
			Calendar c5 = new GregorianCalendar();
			c5.add(Calendar.DATE, -5); // 오늘날짜로부터 -1
			SimpleDateFormat sdf4 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String sixday = sdf4.format(c5.getTime()); // String으로 저장
			state.setSixday(sixday);
			//6일전
			Calendar c6 = new GregorianCalendar();
			c6.add(Calendar.DATE, -6); // 오늘날짜로부터 -1
			SimpleDateFormat sdf5 = new SimpleDateFormat("MM/dd"); // 날짜 포맷 
			String sevenday = sdf5.format(c6.getTime()); // String으로 저장
			state.setSevenday(sevenday);
			view.addObject("list",state);
			view.setViewName("ynmAdmin/mainAdmin");
			return view;
		}
		
		@RequestMapping(value="/adminInfo.do")
		public String adminInfo(HttpSession session,YNMAdmin vo) 
		{
			
			return "ynmAdmin/adminInfo";	
		}

		@RequestMapping(value="/ownerBlock.do")
		public String ownerBlock(HttpSession session,YNMOwner vo)
		{
			int result = ynmAdminServiceImpl.ownerBlock(vo);
			if(result>0)
			{
				return "ynmAdmin/allOwnerView";	
			}
			else
			{
				return "ynmAdmin/enrollFailed";	
			}
		}
		@RequestMapping(value="/storeList.do")
		public String storeList(HttpSession session,YNMStoreInfo vo)
		{
			ArrayList<YNMStoreInfo> list = ynmAdminServiceImpl.storeList();

	        	String data="1";
	            return data; 
	        
		}
		
		
		
}