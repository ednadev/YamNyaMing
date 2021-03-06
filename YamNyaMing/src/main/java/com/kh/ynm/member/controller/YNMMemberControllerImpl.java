package com.kh.ynm.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.ynm.common.MyFileRenamePolicy;
import com.kh.ynm.common.controller.CommonControllerImpl;
import com.kh.ynm.common.model.vo.YNMTotalRefModel;
import com.kh.ynm.member.controller.YNMMemberController;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;

import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMFavorite;
import com.kh.ynm.member.model.vo.YNMFollow;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberSetting;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMReviewJjim;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchPaging;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMReviewLike;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

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
	@RequestMapping(value="/login.do")
	public String selectOneMember(HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPw(request.getParameter("memberPw"));
		YNMMember ym=ynmMemberServiceImpl.selectOneMember(vo);
		String viewPath=ynmMemberServiceImpl.viewPath(ym.getMemberUploadPhotoNo());
		ym.setPhotoViewRoute(viewPath);
		
		HttpSession session=request.getSession();

		if(CommonControllerImpl.loginType==true) {
			if(ym!=null) {
				session.setAttribute("member", ym);
				CommonControllerImpl.loginType=false;
				return "ynmMember/pwUpdateTest";
			}else {
				return "ynmMember/fail";
			}
		}else {
			if(ym!=null) {
				session.setAttribute("member", ym);
				YNMMemberSetting yms=ynmMemberServiceImpl.settingInfo(ym.getMemberEntireNo());
				session.setAttribute("set", yms);
				return "redirect:/index.jsp";
			}else {
				return "ynmOwner/ynmOwnerError/ownerLoginFail";
			}
		}
	}
	@Override
	@RequestMapping(value="/index.do")
	public String indexPage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession sessoin=request.getSession(false);

		return "redirect:/index.jsp";
	}


	//로그아웃
	@Override
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session=request.getSession(false);

		session.invalidate();

		return "redirect:/index.jsp";
	}

	//아이디 찾기
	@Override
	@RequestMapping(value="/memberIdSearch.do")
	public ModelAndView idSearch(HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		vo.setMemberEmail(request.getParameter("memberEmail"));
		vo.setMemberName(request.getParameter("memberName"));
		YNMMember ym=ynmMemberServiceImpl.idSearch(vo);
		ModelAndView view=new ModelAndView();
		if(ym!=null) {
			String memberName=ym.getMemberName();
			String resultMemberId=ym.getMemberId();
			String []memberId2=resultMemberId.split("");
			String memberId=memberId2[0]+memberId2[1];
			for(int i=2; i<memberId2.length; i++) {
				memberId+="*";
			}
			ym.setMemberId(memberId);

			view.addObject("id",ym);
			view.addObject("memberName",memberName);
			view.setViewName("ynmMember/idSearch");
			return view;
		}else
		{
			view.setViewName("ynmMember/memberError/SearchError");
			return view;
		}
	}
	
	
	//아이디 찾기
	@ResponseBody
	@Override
	@RequestMapping(value="/deleteBook.do")
	public String deleteBook(HttpServletRequest request, HttpServletResponse response) {
		int bookNo=Integer.parseInt(request.getParameter("bookNo"));
		int result=ynmMemberServiceImpl.deleteBook(bookNo);
		
		if(result>0) {
			String chk="1";
			return chk;
		}else {
			String chk="0";
			return chk;
		}
		
	}

	//비밀번호 찾기
	@Override
	@RequestMapping(value="/pwSearch.do")
	public ModelAndView pwSearch(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberEmail(request.getParameter("memberEmail"));
		YNMMember ym=ynmMemberServiceImpl.pwSearch(vo);

		ModelAndView view=new ModelAndView();
		if(ym!=null) {
			view.addObject("id",ym);
			view.setViewName("ynmMember/pwSearch");
			return view;
		}else {
			view.setViewName("ynmMember/memberError/SearchError");
			return view;
		}

	}

	//회원가입
	@Override
	@RequestMapping(value="/signUpMember.do")
	public String signUpMember(@RequestParam("avatarPhoto") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
		YNMMember ym=new YNMMember();
		ym.setMemberId(request.getParameter("memberId"));
		ym.setMemberPw(request.getParameter("memberPw"));
		ym.setMemberName(request.getParameter("memberName"));
		ym.setMemberNickName(request.getParameter("memberNickName"));
		ym.setMemberGender(request.getParameter("memberGender"));
		//yyyy-mm-dd 형태로 받아야함

		String mbBirthYear=request.getParameter("mbBirthYear");
		String mbBirthMonth=request.getParameter("mbBirthMonth");
		String mbBirthDay=request.getParameter("mbBirthDay");

		String memberBirth=mbBirthYear+"-"+mbBirthMonth+"-"+mbBirthDay;
		java.sql.Date birth = java.sql.Date.valueOf(memberBirth);
		ym.setMemberBirth(birth);

		ym.setMemberEmail(request.getParameter("memberEmail"));
		ym.setMemberPhone(request.getParameter("memberPhone"));

		if(file.getSize()>0) {
			String OriginName=file.getOriginalFilename();
			String remakeName=System.currentTimeMillis()+"_"+OriginName;

			String photoRoute=context.getRealPath("\\resources\\image\\member\\"+request.getParameter("memberId")+"\\avatar\\avatarimg");


			String photoViewRoute="\\"+request.getParameter("memberId")+"\\avatar\\avatarimg"+remakeName;
			File f=new File(photoRoute+remakeName);

			if(!f.exists()){
				f.mkdirs(); //디렉토리가 존재하지 않는다면 생성
			}
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
			ymup.setPhotoRoute(photoRoute+remakeName);
			ymup.setPhotoViewRoute(photoViewRoute);

			int result=ynmMemberServiceImpl.memberUploadPhoto(ymup);

			YNMMemberUploadPhoto ymupIndex=ynmMemberServiceImpl.memberIndexSelect(remakeName);


			ym.setMemberUploadPhotoNo(ymupIndex.getUploadPhotoNo());
			int result2=ynmMemberServiceImpl.signUpMember(ym);

			//회원가입 성공시
			return "redirect:/";
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);

			int result=ynmMemberServiceImpl.signUpMember(ym);
			return "redirect:/";
		}
	}
	//회원탈퇴
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

		return "ynmMember/Error";
	}
	//이메일로 로그인시 비밀번호 변경하기
	@Override
	@RequestMapping(value="/passwordUpdateMember.do")
	public String passwordUpdateMember(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		YNMMember ym=new YNMMember();
		session=request.getSession(false);
		ym.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		ym.setMemberEmail(((YNMMember)session.getAttribute("member")).getMemberEmail());
		ym.setMemberPw(request.getParameter("memberPw"));
		int result=ynmMemberServiceImpl.pwUpdateMember(ym);

		if(result>0) {
			return "redirect:/index.jsp";
		}else {
			return null;
		}

	}
	
	
	
	//내정보 비밀번호 변경
	@Override
	@RequestMapping(value="/pwChange.do")
	public ModelAndView pwChange(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view=new ModelAndView();
		YNMMember ym=new YNMMember();
		session=request.getSession(false);
		ym.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		ym.setMemberEmail(((YNMMember)session.getAttribute("member")).getMemberEmail());
		ym.setMemberPw(request.getParameter("memberPw"));
		int result=ynmMemberServiceImpl.pwUpdateMember(ym);

		if(result>0) {
			view=memberInfo(session,request,response);
			view.setViewName("ynmMember/myInfo");
		
		}else {
			view.setViewName("ynmMember/Error");
			
		}
		return view;

	}
	
	//내정보 닉네임 변경
	@Override
	@RequestMapping(value="/nickNameChange.do")
	public ModelAndView nickNameChange(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view=new ModelAndView();
		YNMMember ym=new YNMMember();
		session=request.getSession(false);
		ym.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		ym.setMemberEmail(((YNMMember)session.getAttribute("member")).getMemberEmail());
		ym.setMemberNickName(request.getParameter("memberNickName"));
		int result=ynmMemberServiceImpl.nickNameUpdateMember(ym);

		if(result>0) {
			view=memberInfo(session,request,response);
			view.setViewName("ynmMember/myInfo");
		
		}else {
			view.setViewName("ynmMember/Error");
			
		}
		return view;

	}

	//내 정보 보기
	@Override
	@RequestMapping(value="/memberInfo.do")
	public ModelAndView memberInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view=new ModelAndView();
		YNMMember vo=new YNMMember();
		session=request.getSession(false);
		if(((YNMMember)session.getAttribute("member"))!=null) {
			int memberEntireNo=(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			YNMMemberSetting yms=ynmMemberServiceImpl.settingInfo(memberEntireNo);

			YNMMember ym=ynmMemberServiceImpl.selectOneMember2(memberEntireNo);
			String viewPath=ynmMemberServiceImpl.viewPath(ym.getMemberUploadPhotoNo());
	

			int reservationTotal=ynmMemberServiceImpl.reservationTotal(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			int jjimTotal=ynmMemberServiceImpl.memberJjimTotal(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			int reviewTotal=ynmMemberServiceImpl.reviewTotal(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			int followTotal=ynmMemberServiceImpl.followTotal(((YNMMember)session.getAttribute("member")).getMemberEntireNo());

			int memberPoint=reviewTotal+reservationTotal;
			//찜한 가게 목록
			ArrayList<YNMFavorite> fList=ynmMemberServiceImpl.favoriteList(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			ym.setJjimTotal(jjimTotal);
			ym.setReservationTotal(reservationTotal);
			ym.setReviewTotal(reviewTotal);
			ym.setFollowTotal(followTotal);
			ym.setMemberPoint(memberPoint);
			//사용자 팔로잉 목록
			ArrayList<YNMFollow> followingList=ynmMemberServiceImpl.followInfo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			ArrayList<YNMMember> followingYmList=new ArrayList<YNMMember>();
			YNMMember followingYm=null;
			if(followingList.size()>0) {
				for(int i=0; i<followingList.size(); i++) {
					followingYm=ynmMemberServiceImpl.memberFollowing(followingList.get(i).getFollowMemberIdNo());
					int followingReviewTotal=ynmMemberServiceImpl.reviewTotal(followingList.get(i).getFollowMemberIdNo());
					int followingFollowTotal=ynmMemberServiceImpl.followTotal(followingList.get(i).getFollowMemberIdNo());
					followingYm.setFollowTotal(followingFollowTotal);
					followingYm.setReviewTotal(followingReviewTotal);
					followingYmList.add(followingYm);
				}
				for(int i=0; i<followingYmList.size(); i++) {
					String followingMemberViewPath=ynmMemberServiceImpl.viewPath(followingYmList.get(i).getMemberUploadPhotoNo());
					followingYmList.get(i).setPhotoViewRoute(followingMemberViewPath);
				}
				
			}
			//사용자 팔로워 목록
			ArrayList<YNMFollow> followerList=ynmMemberServiceImpl.followerInfo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());

			ArrayList<YNMMember> followerYmList=new ArrayList<YNMMember>();
		
			YNMMember followerYm=null;
			if(followerList.size()>0) {
				for(int i=0; i<followerList.size(); i++) {
					
					followerYm=ynmMemberServiceImpl.memberFollowing(followerList.get(i).getFollowerNo());
					int followingReviewTotal=ynmMemberServiceImpl.reviewTotal(followerList.get(i).getFollowerNo());
					int followingFollowTotal=ynmMemberServiceImpl.followTotal(followerList.get(i).getFollowerNo());
					followerYm.setFollowTotal(followingFollowTotal);
					followerYm.setReviewTotal(followingReviewTotal);
					followerYmList.add(followerYm);
				}
				for(int i=0; i<followerYmList.size(); i++) {
					String followingMemberViewPath=ynmMemberServiceImpl.viewPath(followerYmList.get(i).getMemberUploadPhotoNo());
					followerYmList.get(i).setPhotoViewRoute(followingMemberViewPath);
				}
				
			}
			if(followerList.size()>0 || followingList.size()>0) {
			for(int i=0; i<followerList.size(); i++) {
				for(int j=0; j<followingList.size(); j++) {
					if(followerList.get(i).getFollowerNo()== followingList.get(j).getFollowMemberIdNo()) {
						followerYmList.get(i).setFollowChk(1);
					}
				}
			}
			}
			//내 정보 리뷰
			ArrayList<YNMStoreReview> ysrList=new ArrayList<YNMStoreReview>();
			ArrayList<YNMStoreReview> ysrList2=new ArrayList<YNMStoreReview>();
			ArrayList<YNMFollow> foList=null;
			ArrayList<YNMReviewLike> lList=null;
			ArrayList<YNMReviewJjim> jList=null;
			ArrayList<YNMStoreReview> myYsrList=new ArrayList<YNMStoreReview>();
			ArrayList<YNMFollow> foList2=null;
			ArrayList<YNMReviewLike> lList2=null;
			ArrayList<YNMReviewJjim> jList2=null;
			ArrayList<YNMStoreReview> jjimYsrList=new ArrayList<YNMStoreReview>();
			if(session.getAttribute("member")!=null) {
				YNMMember member = (YNMMember)session.getAttribute("member");
					jjimYsrList=ynmMemberServiceImpl.jjimMyInfoReviewCheck(memberEntireNo);
					myYsrList=ynmMemberServiceImpl.myInfoReviewCheck(memberEntireNo);
					ysrList=ysrListGet(myYsrList);
					ysrList2=ysrListGet(jjimYsrList);
					foList= fListGet(ysrList, member.getMemberEntireNo());
					lList=lListGet(ysrList, member.getMemberEntireNo());
					jList=jListGet(ysrList, member.getMemberEntireNo());
					foList2= fListGet(jjimYsrList, member.getMemberEntireNo());
					lList2=lListGet(jjimYsrList, member.getMemberEntireNo());
					jList2=jListGet(jjimYsrList, member.getMemberEntireNo());
				
			}
			
			ArrayList<YNMSearch> storeAllList = ynmMemberServiceImpl.storeAllList(memberEntireNo);
			if(storeAllList.size()>0) 
			{
				if(storeAllList.size()>0) {
					for(int i=0; i<storeAllList.size(); i++){
						YNMSearch ys=ynmMemberServiceImpl.starAvg(storeAllList.get(i).getOwStoreInfoPk());
						if(ys!=null) {
							storeAllList.get(i).setStarAvg(ys.getStarAvg());
						}
					}
				}
				//search page 가게 찜여부 확인
				for(int i=0; i<storeAllList.size(); i++) {
					YNMFavorite yf = new YNMFavorite();
					yf.setMemberEntireNo(memberEntireNo);
					yf.setOwStoreInfoNo(storeAllList.get(i).getOwStoreInfoPk());
					int favoriteChk=ynmMemberServiceImpl.favoriteChk(yf);
					int favoriteTotal=ynmMemberServiceImpl.favoriteTotal(storeAllList.get(i).getOwStoreInfoPk());
					storeAllList.get(i).setFavoriteChk(favoriteChk);
					storeAllList.get(i).setFavoriteTotal(favoriteTotal);
				}
			}
			//예약 확인
			ArrayList<YNMBook> ybList=ynmMemberServiceImpl.bookselect(memberEntireNo);
			if(ybList.size()>0) {
				for(int i=0; i<ybList.size(); i++) {
					int storeWaitNum=ynmMemberServiceImpl.storeWaitNum(ybList.get(i).getStoreEntireNo());
					ybList.get(i).setBookTotal(storeWaitNum);
				}
			}
			
			ArrayList<YNMBook> ybLastList=ynmMemberServiceImpl.bookLastselect(memberEntireNo);
			
			if(ym!=null) {
				view.addObject("lastBook",ybLastList);
				view.addObject("book",ybList);
				view.addObject("storeAllList",storeAllList);
				view.addObject("jjimReview",ysrList2);
				view.addObject("review",ysrList);
				view.addObject("followerYm",followerYmList);
				view.addObject("followingYm",followingYmList);
				view.addObject("favorite",fList);
				view.addObject("info",ym);
				view.addObject("img",viewPath);
				view.addObject("setting",yms);
				view.setViewName("ynmMember/myInfo");
				return view;
			}
			else {
				return null;
			}
			}
		else {
			return null;
		}

	}
	
	
	//대기중인 사람들 
		@ResponseBody
		@RequestMapping(value="/storeWaitNum.do")
		public JSONArray storeWaitNum(HttpServletRequest request, HttpServletResponse response) {
				int storeEntireNo=Integer.parseInt(request.getParameter("storeEntireNo"));
				ArrayList<YNMMember> waitList=ynmMemberServiceImpl.waitList(storeEntireNo);
				
				JSONArray objArr = new JSONArray();
				for(int i = 0; i<waitList.size();i++) {
					YNMMember ym = waitList.get(i);
					JSONObject obj = new JSONObject();
					
					obj.put("memberEntireNo", ym.getMemberEntireNo());
					obj.put("memberNickName", ym.getMemberNickName());
					obj.put("photoViewRoute",ym.getPhotoViewRoute());
					obj.put("memberUploadPhotoNo",ym.getMemberUploadPhotoNo());
					obj.put("bookDateTime",ym.getBookDateAndTime2());
					objArr.add(obj);
		
		}
		return objArr;
				
		}
				
	
	//내정보 이미지 수정하기
	@ResponseBody
	@Override
	@RequestMapping(value="/updateMemberPhoto.do")
	public ModelAndView updateMemberPhoto(@RequestParam("avatarPhoto") MultipartFile file,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		YNMMember ym=new YNMMember();
		ModelAndView view=new ModelAndView();
		if(((YNMMember)session.getAttribute("member"))!=null) {
			vo=ynmMemberServiceImpl.selectOneMember2(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ym.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		}
		if(file.getSize()>0) {
			int uploadPhotoNo=((YNMMember)session.getAttribute("member")).getMemberUploadPhotoNo();
			String OriginName=file.getOriginalFilename();
			String remakeName=System.currentTimeMillis()+"_"+OriginName;
			String photoRoute=context.getRealPath("\\resources\\image\\member\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\avatar\\avatarimg");
			String photoViewRoute="\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\avatar\\avatarimg"+remakeName;
			File f=new File(photoRoute+remakeName);

			if(!f.exists()){
				f.mkdirs(); //디렉토리가 존재하지 않는다면 생성
			}		
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

			int result=ynmMemberServiceImpl.insertUploadPhoto(ymup);
//			if(result>0) {
//				int result2=ynmMemberServiceImpl.deleteUploadPhoto(((YNMMember)session.getAttribute("member")).getMemberUploadPhotoNo());
//			}
			
			YNMMemberUploadPhoto ymupIndex=ynmMemberServiceImpl.reviewIndexSelect(remakeName);
			
			ym.setMemberUploadPhotoNo(ymupIndex.getUploadPhotoNo());
			int result2=ynmMemberServiceImpl.updateMemberPhoto(ym);
			
			if(result2>0) {
				view=memberInfo(session,request,response);
				view.setViewName("ynmMember/myInfo");
			}else {
				view.setViewName("ynmMember/Error");

			}
		}else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);
			int result=ynmMemberServiceImpl.updateMemberPhoto(ym);
			//이미지 삭제
			if(result>0) {
				view=memberInfo(session,request,response);
				view.setViewName("ynmMember/myInfo");
			}else {
				view.setViewName("ynmMember/Error");

			}
		}
		return view;
	}
	//비밀번호 확인
	@Override
	@ResponseBody
	@RequestMapping(value="/pwCheck.do")
	public String pwCheck(HttpServletRequest request, HttpServletResponse response,Model model) {
		HttpSession session=request.getSession(false);
		String memberPw=request.getParameter("memberPw");
		String memberId=((YNMMember)session.getAttribute("member")).getMemberId();
		YNMMember vo=new YNMMember();
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		YNMMember ym=ynmMemberServiceImpl.selectOneMember(vo);

		if(ym==null) {
			String chk="0";
			return chk;
		}else {
			String chk="1";
			return chk;

		}
	}
	//아이디 유효성 검사
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
	//닉네임 유효성 검사
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
	//이메일 유효성 검사
	@Override
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(HttpServletRequest request, HttpServletResponse response,Model model) {
		String memberEmail=request.getParameter("memberEmail");
		YNMMember ym=ynmMemberServiceImpl.emailCheck(memberEmail);

		if(ym==null) {
			String chk="0";
			return chk;
		}else {
			String chk="1";
			return chk;

		}

	}
	//리뷰 table
	@Override
	@RequestMapping(value="/storeReviewInsert.do")
	public ModelAndView storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException {

		String path =context.getRealPath("\\resources\\image\\member\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\review\\review");
	
		String remakeName = "";
		String reviewImgList="";
		List<MultipartFile> files = multi.getFiles("reviewImgList");
		File file = new File(path);


		if(!file.exists()){
			file.mkdirs(); //디렉토리가 존재하지 않는다면 생성
		}
		if(files.get(0).getSize()>0) {
			for (int i = 0; i < files.size(); i++) {
				remakeName=System.currentTimeMillis()+"_"+files.get(i).getOriginalFilename();
				file = new File(path+remakeName);
				files.get(i).transferTo(file);
				String OriginName=files.get(i).getOriginalFilename();
				String photoRoute=path+remakeName;
				String photoViewRoute="\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\review\\review"+remakeName;
				YNMMemberUploadPhoto ymup=new YNMMemberUploadPhoto();
				ymup.setOriginName(OriginName);
				ymup.setRemakeName(remakeName);
				ymup.setPhotoRoute(photoRoute);
				ymup.setPhotoViewRoute(photoViewRoute);

				int result=ynmMemberServiceImpl.reviewUploadPhoto(ymup);
				YNMMemberUploadPhoto ymupIndex=ynmMemberServiceImpl.reviewIndexSelect(remakeName);

				if(i<files.size()-1) reviewImgList+=ymupIndex.getUploadPhotoNo()+",";
				else reviewImgList+=ymupIndex.getUploadPhotoNo();

			} 
		}

		YNMStoreReview ysr=new YNMStoreReview();
		ysr.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ysr.setOwnerEntireNo(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		ysr.setReviewContent(request.getParameter("reviewContent"));
		ysr.setReviewStar(Integer.parseInt(request.getParameter("reviewStar")));
		if(reviewImgList.equals("")) {
			ysr.setReviewImgList("0");
		}else {
			ysr.setReviewImgList(reviewImgList);
		}
		int result=ynmMemberServiceImpl.storeReviewInsert(ysr);
		int owStoreInfoPk=Integer.parseInt(request.getParameter("owStoreInfoPk"));
		ModelAndView view=new ModelAndView();
		if(result>0) {
			view=detailPage(request,response);


		}else {
			view.setViewName("ynmMember/Error");
		}
		return view;
	}
	
	public ArrayList<YNMFollow> fList(int memberNo)
	{
		
		return null;
	}

	//리뷰 정보 가져오기
	@Override
	@RequestMapping(value="/reviewCheck.do")
	public ModelAndView reviewCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view=new ModelAndView();
		HttpSession session=request.getSession(false);
			ArrayList<YNMStoreReview> ysrList=new ArrayList<YNMStoreReview>();
			int OwnerStoreEntireNo=Integer.parseInt(request.getParameter("owStoreInfoPk"));
			ysrList=ynmMemberServiceImpl.storeReviewCheck(OwnerStoreEntireNo);
			ArrayList<YNMFollow> fList=null;
			ArrayList<YNMReviewLike> lList=null;
			ArrayList<YNMReviewJjim> jList=null;
			ysrList=ysrListGet(ysrList);
			if(session.getAttribute("member")!=null) {
			YNMMember member = (YNMMember)session.getAttribute("member");
			fList= fListGet(ysrList, member.getMemberEntireNo());
			lList=lListGet(ysrList, member.getMemberEntireNo());
			jList=jListGet(ysrList, member.getMemberEntireNo());
			}
			// 평점 구하기
			int starSum=0;
			float starAvg=0;
			if(!ysrList.isEmpty()) {
			for(int i=0; i<ysrList.size(); i++ ) {
					starSum+=ysrList.get(i).getReviewStar();
				}
				starAvg=(float)starSum/ysrList.size();
			}
			if(!ysrList.isEmpty()) {
				view.addObject("starAvg",starAvg);
				view.addObject("review",ysrList);
				return view;
	
			}else {
				
				view.addObject("noReview"," 등록된 리뷰가 없습니다.");
				return view;
	
			}
	}
	
	public ArrayList<YNMStoreReview> ysrListGet(ArrayList<YNMStoreReview> ysrList){
		StringBuilder strBuilder = new StringBuilder();
		String[] imgArr;
		for(int i=0; i<ysrList.size(); i++) {
			if(i<ysrList.size()-1)strBuilder.append(ysrList.get(i).getReviewImgList()+","); 
			else strBuilder.append(ysrList.get(i).getReviewImgList()); 
		}
		imgArr = strBuilder.toString().split(",");

		ArrayList<YNMMemberUploadPhoto> imgList = ynmMemberServiceImpl.reviewImageList(imgArr);

		
		for(int i = 0; i<ysrList.size();i++)
		{
			YNMStoreReview tempStoreReview = ysrList.get(i);
			int likeTotal=ynmMemberServiceImpl.likeTotal(ysrList.get(i).getStoreReviewNo());
			int jjimTotal=ynmMemberServiceImpl.jjimTotal(ysrList.get(i).getStoreReviewNo());
			int reviewTotal=ynmMemberServiceImpl.reviewTotal(ysrList.get(i).getMemberEntireNo());
			int followTotal=ynmMemberServiceImpl.followTotal(ysrList.get(i).getMemberEntireNo());
			ysrList.get(i).setLikeTotal(likeTotal);
			ysrList.get(i).setJjimTotal(jjimTotal);
			ysrList.get(i).setFollowTotal(followTotal);
			ysrList.get(i).setReviewTotal(reviewTotal);

			ysrList.get(i).setMemberLikeInfo(ynmMemberServiceImpl.likeTotalMember(ysrList.get(i).getStoreReviewNo()));
			if(ysrList.get(i).getMemberLikeInfo().size()==0) {
				ysrList.get(i).setMemberLikeInfo(null);
			}
			
			if(imgList!=null && !imgList.isEmpty())
			{
				for(int j =0 ; j<imgList.size();j++) 
				{
					YNMMemberUploadPhoto tempPhoto = imgList.get(j);//''1,2,3, 이미지 스트링
					for(int s = 0; s<tempStoreReview.getReviewImgArr().length;s++)
					{
						String[] tempImgArr = tempStoreReview.getReviewImgArr();
						if(tempImgArr[s].equals(tempPhoto.getUploadPhotoNo()+""))
						{
							ysrList.get(i).setPhotoObjList(imgList.get(j));
						}
					}
				}
			}
		}
		
		if(ysrList.size()>0) {
		for(int i=0; i<ysrList.size();i++) {
			ArrayList<YNMStoreUnderReview> ysurList=ynmMemberServiceImpl.underReview(ysrList.get(i).getStoreReviewNo());
				ysrList.get(i).setYsurList(ysurList);
		}	
		}
		return ysrList;
	}
	
	public ArrayList<YNMFollow> fListGet(ArrayList<YNMStoreReview> ysrList,  int memberEntireNo ){
		int memberNo=memberEntireNo;
		ArrayList<YNMFollow> fList = ynmMemberServiceImpl.followInfo(memberNo);
		if(fList.size()==0) {
			fList=null;
		}else {
			for(int i=0; i<ysrList.size(); i++) {
				for(int j=0; j<fList.size(); j++) {
					if(ysrList.get(i).getMemberEntireNo()==fList.get(j).getFollowMemberIdNo()) {
							ysrList.get(i).setMyfollowChk(1);
							break;
						
					}
				}
			}
		}
		return fList;
	}
	
	public ArrayList<YNMReviewLike> lListGet(ArrayList<YNMStoreReview> ysrList,  int memberEntireNo ){
			int memberNo=memberEntireNo;
			ArrayList<YNMReviewLike> lList=ynmMemberServiceImpl.likeInfo(memberNo);
			if(lList.size()==0) {
				lList=null;
			}else {
				for(int i=0; i<ysrList.size(); i++) {
					for(int j=0; j<lList.size(); j++) {
						if(ysrList.get(i).getStoreReviewNo()==lList.get(j).getStoreReviewNo()) {
							if(memberNo==lList.get(j).getMemberEntireNo())
							{
								ysrList.get(i).setMyLikeChk(1);
								break;
							}
						}
					}
				}
			}
		
		return lList;
	}
	
	public ArrayList<YNMReviewJjim> jListGet(ArrayList<YNMStoreReview> ysrList,  int memberEntireNo) {
			int memberNo=memberEntireNo;
			ArrayList<YNMReviewJjim> jList=ynmMemberServiceImpl.jjimInfo(memberNo);

			if(jList.size()==0) {
				jList=null;
			}else {
				for(int i=0; i<ysrList.size(); i++) {
					for(int j=0; j<jList.size(); j++) {
						if(ysrList.get(i).getStoreReviewNo()==jList.get(j).getStoreReviewNo()) {
							if(memberNo==jList.get(j).getMemberEntireNo())
							{
								ysrList.get(i).setMyJjimChk(1);
								break;
							}
						}
					}
				}
			}
	return jList;
}
	
	//리뷰 대댓글 작성
	@ResponseBody
	@Override
	@RequestMapping(value="/storeUnderReviewInsert.do")
	public JSONObject storeUnderReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		int memberEntireNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		String underReviewContent=request.getParameter("underReviewContent");
		YNMStoreUnderReview ysur=new YNMStoreUnderReview();
		ysur.setMemberEntireNo(memberEntireNo);
		ysur.setStoreReviewNo(storeReviewNo);
		ysur.setUnderReviewContent(underReviewContent);
		System.out.println(storeReviewNo);
		System.out.println(memberEntireNo);
		System.out.println(underReviewContent);
		
		int result=ynmMemberServiceImpl.storeUnderReviewInsert(ysur);

			YNMMember ym = (YNMMember)session.getAttribute("member");
			JSONObject obj = new JSONObject();
			
			obj.put("memberNickName", ym.getMemberNickName());
			obj.put("photoViewRoute",ym.getPhotoViewRoute());
			obj.put("memberUploadPhotoNo",ym.getMemberUploadPhotoNo());
			obj.put("underReviewContent",ysur.getUnderReviewContent());
		return obj;
		
	}
	//좋아요 
	@Override
	@ResponseBody
	@RequestMapping(value="/likeInsert.do")
	public String likeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int memberEntireNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		YNMReviewLike yrl=new YNMReviewLike();
		yrl.setMemberEntireNo(memberEntireNo);
		yrl.setStoreReviewNo(storeReviewNo);
		int likeChk=ynmMemberServiceImpl.likeChk(yrl);
		if(likeChk>0) {
			int result=ynmMemberServiceImpl.deleteLike(yrl);
			String chk="1";
			return chk;
		}
		else {
			int result=ynmMemberServiceImpl.likeInsert(yrl);
			if(result>0) {
				String chk="2";
				return chk;
			}else {
				String chk="0";
				return chk;
			}
		}
	}

	//찜하기
	@Override
	@ResponseBody
	@RequestMapping(value="/jjimInsert.do")
	public String jjimInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int memberEntireNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		YNMReviewJjim yrj=new YNMReviewJjim();
		yrj.setMemberEntireNo(memberEntireNo);
		yrj.setStoreReviewNo(storeReviewNo);
		int likeChk=ynmMemberServiceImpl.jjimChk(yrj);
		//이미 찜햇으면 찜 버튼 클릭시 해제
		if(likeChk>0) {
			int result=ynmMemberServiceImpl.deletejjim(yrj);
			String chk="1";
			return chk;
		}
		//아닌경우 찜 하기
		else {
			int result=ynmMemberServiceImpl.jjimInsert(yrj);
			if(result>0) {
				String chk="2";
				return chk;
			}else {
				String chk="0";
				return chk;
			}
		}
	}

	@Override
	@ResponseBody
	@RequestMapping(value="/followInsert.do")
	public String followInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int followMemberIdNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		int followerNo=Integer.parseInt(request.getParameter("userMemberEntireNo"));

		YNMFollow yf=new YNMFollow();
		yf.setFollowMemberIdNo(followMemberIdNo);
		yf.setFollowerNo(followerNo);
		int likeChk=ynmMemberServiceImpl.followChk(yf);
		//이미 찜햇으면 찜 버튼 클릭시 해제
		if(likeChk>0) {
			int result=ynmMemberServiceImpl.deletefollow(yf);
			String chk="1";
			return chk;
		}
		//아닌경우 찜 하기
		else {
			int result=ynmMemberServiceImpl.followInsert(yf);
			if(result>0) {
				String chk="2";
				return chk;
			}else {
				String chk="0";
				return chk;
			}
		}
	}
	//즐겨찾기
	@Override
	@ResponseBody
	@RequestMapping(value="/favoriteInsert.do")
	public String favoriteInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int memberEntireNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		int owStoreInfoNo=Integer.parseInt(request.getParameter("owStoreInfoNo"));

		YNMFavorite yf=new YNMFavorite();
		yf.setMemberEntireNo(memberEntireNo);
		yf.setOwStoreInfoNo(owStoreInfoNo);
		int favoriteChk=ynmMemberServiceImpl.favoriteChk(yf);
		if(favoriteChk>0) {
			int result=ynmMemberServiceImpl.deletefavorite(yf);
			String chk="1";
			return chk;
		}
		else {
			int result=ynmMemberServiceImpl.favoriteInsert(yf);
			if(result>0) {
				String chk="2";
				return chk;
			}else {
				String chk="0";
				return chk;
			}
		}
	}
	//사용자 설정
	@Override
	@ResponseBody
	@RequestMapping(value="/setting.do")
	public String setting(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		YNMMemberSetting yms=new YNMMemberSetting();
		yms.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		yms.setThemePushUpdate(request.getParameter("themePushUpdate").charAt(0));
		yms.setAlarmPushReviewLike(request.getParameter("alarmPushReviewLike").charAt(0));
		yms.setAlarmPushReviewComment(request.getParameter("alarmPushReviewComment").charAt(0));
		yms.setAlarmPushReviewJjim(request.getParameter("alarmPushReviewJjim").charAt(0));
		yms.setAlarmPushFollow(request.getParameter("alarmPushFollow").charAt(0));
		yms.setMyinfoAgree(request.getParameter("myinfoAgree").charAt(0));
		yms.setAlarmEventEmail(request.getParameter("alarmEventEmail").charAt(0));
		yms.setAlarmEventSms(request.getParameter("alarmEventSms").charAt(0));
		yms.setMyinfoReviewOpen(request.getParameter("myinfoReviewOpen").charAt(0));
		yms.setMyinfoReviewJjim(request.getParameter("myinfoReviewJjim").charAt(0));
		yms.setMyinfoStoreJjim(request.getParameter("myinfoStoreJjim").charAt(0));
		int result=ynmMemberServiceImpl.updateSetting(yms);

		if(result>0) {
			return "success";
		}
		else
		{
			return "fail";
		}
	}

	// 사용자 검색
	@RequestMapping(value="/search.do")
	public ModelAndView search(HttpSession session, HttpServletRequest request) {
		
		ModelAndView view=new ModelAndView();
		String keyword = request.getParameter("keyword");
		String food = request.getParameter("food");
		String place = request.getParameter("place");
		session.setAttribute("keyword",keyword);
		session.setAttribute("food", food);
		session.setAttribute("place", place);
		String [] storeCateDetailName = request.getParameterValues("storeCateDetailName");
		String [] owBudget = request.getParameterValues("owBudget");
		String [] owSubInfo = request.getParameterValues("owSubInfo");
		String [] owDrinkListInfo = request.getParameterValues("owDrinkListInfo");
		
		YNMSearchPaging check = new YNMSearchPaging();

		check.setKeyword(keyword);
		check.setFood(food);
		check.setPlace(place);
		
		if(storeCateDetailName!=null) {
			ArrayList<String> storeCateDetailNameList = new ArrayList<String>();
			for (int i = 0; i<storeCateDetailName.length;i++) {
				storeCateDetailNameList.add(storeCateDetailName[i]);
			}
			
			check.setStoreCateDetailName(storeCateDetailNameList);
		}
		if(owBudget!=null) {
			ArrayList<String> owBudgetList = new ArrayList<String>();
			for (int i = 0; i<owBudget.length;i++ ) {
				owBudgetList.add(owBudget[i]);
			}
			check.setOwBudget(owBudgetList);
		}
		if(owSubInfo!=null) {
			ArrayList<String> owSubInfoList = new ArrayList<String>();
			for(int i = 0; i<owSubInfo.length;i++)
			{
				owSubInfoList.add(owSubInfo[i]);
			}
			check.setOwSubInfo(owSubInfoList);
		}
		if(owDrinkListInfo!=null) {
			ArrayList<String> owDrinkListInfoList = new ArrayList<String>();
			for(int i = 0; i<owDrinkListInfo.length;i++)
			{
				owDrinkListInfoList.add(owDrinkListInfo[i]);
			}
			check.setOwDrinkListInfo(owDrinkListInfoList);
		}
		

		int currentPage;

		if(request.getParameter("currentPage")==null)
		{
			currentPage=1;
		}
		else
		{
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		int recordCountPerPage = 9; //1. 1페이지에10개씩보이게
		int naviCountPerPage = 5; //2.
		
		ArrayList<YNMSearch> searchList = ynmMemberServiceImpl.getSearchList(currentPage, recordCountPerPage, check);
		YNMSearchPaging qpd= ynmMemberServiceImpl.searchPageNavi(currentPage,recordCountPerPage,naviCountPerPage, searchList.size(), check);
		
		
		if(searchList.size()>0) 
		{
			if(searchList.size()>0) {
				for(int i=0; i<searchList.size(); i++){
					YNMSearch ys=ynmMemberServiceImpl.starAvg(searchList.get(i).getOwStoreInfoPk());
					if(ys!=null) {
						searchList.get(i).setStarAvg(ys.getStarAvg());
					}
				}
			}
			
			//search page 가게 찜여부 확인
			for(int i=0; i<searchList.size(); i++) {
				int memberEntireNo=0;
				//로그인한 사용자 찜 여부 확인
				session=request.getSession(false);
				if(((YNMMember)session.getAttribute("member"))!=null) {
					memberEntireNo=((YNMMember)session.getAttribute("member")).getMemberEntireNo();
				}
				YNMFavorite yf = new YNMFavorite();
				yf.setMemberEntireNo(memberEntireNo);
				yf.setOwStoreInfoNo(searchList.get(i).getOwStoreInfoPk());
				int favoriteChk=ynmMemberServiceImpl.favoriteChk(yf);
				int favoriteTotal=ynmMemberServiceImpl.favoriteTotal(searchList.get(i).getOwStoreInfoPk());
				int storeWaitNum=ynmMemberServiceImpl.storeWaitNum(searchList.get(i).getOwStoreInfoPk());
				searchList.get(i).setFavoriteChk(favoriteChk);
				searchList.get(i).setFavoriteTotal(favoriteTotal);
				searchList.get(i).setStoreWaitNum(storeWaitNum);
			}
			view.addObject("storeCateDetailName",storeCateDetailName);
			view.addObject("owBudget",owBudget);
			view.addObject("owSubInfo",owSubInfo);
			view.addObject("owDrinkListInfo",owDrinkListInfo);
			view.addObject("searchList", searchList);
			view.addObject("pageNaviData",qpd);
			view.setViewName("ynmMember/search");
			return view;
		}else {
			view.addObject("storeCateDetailName",storeCateDetailName);
			view.addObject("owBudget",owBudget);
			view.addObject("owSubInfo",owSubInfo);
			view.addObject("owDrinkListInfo",owDrinkListInfo);
			view.setViewName("ynmMember/searchZero");
			return view;
		}
	}

	// 음식점 상세 페이지
	@RequestMapping(value="/detailPage.do")
	public ModelAndView detailPage(HttpServletRequest request, HttpServletResponse response) {
		YNMSearch vo = new YNMSearch();
		vo.setOwStoreInfoPk(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		YNMSearch store = ynmMemberServiceImpl.detailPage(vo);
		ArrayList<YNMSearch> storeImg = ynmMemberServiceImpl.detailPageImg(vo);
		ArrayList<YNMSearch> menuImg = ynmMemberServiceImpl.detailPageMenu(vo);
		int storeWaitNum=ynmMemberServiceImpl.storeWaitNum(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		store.setStoreWaitNum(storeWaitNum);
		int size=storeImg.size();
		int menuSize = menuImg.size();
		int memberEntireNo=0;
		//로그인한 사용자 찜 여부 확인
		HttpSession session=request.getSession(false);
		if(((YNMMember)session.getAttribute("member"))!=null) {
		memberEntireNo=((YNMMember)session.getAttribute("member")).getMemberEntireNo();
		}
		YNMFavorite yf=new YNMFavorite();
		yf.setMemberEntireNo(memberEntireNo);
		yf.setOwStoreInfoNo(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		int favoriteChk=ynmMemberServiceImpl.favoriteChk(yf);
		int favoriteTotal=ynmMemberServiceImpl.favoriteTotal(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		store.setFavoriteTotal(favoriteTotal);
		ModelAndView view=new ModelAndView();

		view=reviewCheck(request,response);
		if(store!=null && storeImg!=null) {
			view.addObject("favoriteChk",favoriteChk);
			view.addObject("store", store);
			view.addObject("size", size);
			view.addObject("storeImg", storeImg);
			view.addObject("menuImg",menuImg);
			view.addObject("menuSize",menuSize);
			view.setViewName("ynmMember/detailPage");
			return view;
		}else {
			return null;
		}

	}
	//예약하기 팝업창
	@RequestMapping(value="/reservation.do")
	public ModelAndView reservation(HttpServletRequest request, HttpServletResponse response) {
		YNMSearch vo = new YNMSearch();
		vo.setOwStoreInfoPk(Integer.parseInt(request.getParameter("owStoreInfoPk")));
		YNMSearch reservation = ynmMemberServiceImpl.detailPage(vo);

		ModelAndView view=new ModelAndView();
		if(reservation!=null) {
			view.addObject("reservation",reservation);
			view.setViewName("ynmMember/reservation");
			return view;
		}
		return null;
	}   
	//좋아요한 사람들 
	@ResponseBody
	@RequestMapping(value="/likeTotalMemberInfo.do")
	public JSONArray likeTotalMemberInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession(false);
		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		ArrayList<YNMMember> likeMemberList=ynmMemberServiceImpl.likeTotalMemberInfo(storeReviewNo);
		int likeTotal=ynmMemberServiceImpl.likeTotal(storeReviewNo);
		for(int i=0; i<likeMemberList.size(); i++) {
			int reviewTotal=ynmMemberServiceImpl.reviewTotal(likeMemberList.get(i).getMemberEntireNo());
			int followTotal=ynmMemberServiceImpl.followTotal(likeMemberList.get(i).getMemberEntireNo());
			likeMemberList.get(i).setFollowTotal(followTotal);
			likeMemberList.get(i).setReviewTotal(reviewTotal);
			likeMemberList.get(i).setLikeTotal(likeTotal);
			
				if((YNMMember)session.getAttribute("member")!=null) {
				ArrayList<YNMFollow> followingList=ynmMemberServiceImpl.followInfo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
					if(followingList.size()>0) {
					for(int j=0; j<followingList.size(); j++) {
						if(likeMemberList.get(i).getMemberEntireNo()==followingList.get(j).getFollowMemberIdNo()) {
							likeMemberList.get(i).setFollowChk(1);
						}
						
						}
					}
				}
		}
		JSONArray objArr = new JSONArray();
		for(int i = 0; i<likeMemberList.size();i++) {
			YNMMember ym = likeMemberList.get(i);
			JSONObject obj = new JSONObject();
			
			obj.put("memberEntireNo", ym.getMemberEntireNo());
			obj.put("memberNickName", ym.getMemberNickName());
			obj.put("followTotal", ym.getFollowTotal());
			obj.put("reviewTotal",ym.getReviewTotal());
			obj.put("photoViewRoute",ym.getPhotoViewRoute());
			obj.put("followChk", ym.getFollowChk());
			obj.put("memberUploadPhotoNo",ym.getMemberUploadPhotoNo());
			objArr.add(obj);
		}
		return objArr;
	}  
	
	//예약하기 삽입
	@Override
	@RequestMapping(value="/bookInsert.do")
	public ModelAndView bookInsert(HttpSession session, HttpServletRequest request) {
		
		YNMBook yb=new YNMBook();
		yb.setMemberEntireNo( ((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		
		String bookDate = request.getParameter("bookDateAndTime1");
		String bookTime = request.getParameter("bookDateAndTime2");
		String bookOrderCount=request.getParameter("bookOrderCount");
		String storeEntireNo=request.getParameter("storeEntireNo");
		String bookType=request.getParameter("bookType");
		String bookPartyCount=request.getParameter("bookPartyCount");
		String bookOption=request.getParameter("bookOption");
		
		yb.setBookOrderCount(Integer.parseInt(bookOrderCount));
		yb.setStoreEntireNo(Integer.parseInt(storeEntireNo));
		yb.setBookType(bookType);
		yb.setBookPartyCount(Integer.parseInt(bookPartyCount));
		yb.setBookOption(bookOption);
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
			sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
			java.util.Date utilDate = sdf.parse(bookDate +" " +  bookTime);
			Date date = new Date(utilDate.getTime());
			yb.setBookDateAndTime(date);
			yb.setBookDateAndTime2(bookDate +" " +  bookTime);
			System.out.println(sdf.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ModelAndView view = new ModelAndView();
		int result = ynmMemberServiceImpl.bookInsert(yb);
		view.addObject("reservationResult", result);
		view.setViewName("redirect:/");
		return view;
	}


	
	@RequestMapping(value="/otherMember.do")
	public ModelAndView test(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("memberEntireNo"));
			int memberEntireNo=(Integer.parseInt(request.getParameter("memberEntireNo")));

			YNMMember ym=ynmMemberServiceImpl.selectOneMember2(memberEntireNo);
			String viewPath=ynmMemberServiceImpl.viewPath(ym.getMemberUploadPhotoNo());

			int reservationTotal=ynmMemberServiceImpl.reservationTotal(memberEntireNo);
			int jjimTotal=ynmMemberServiceImpl.memberJjimTotal(memberEntireNo);
			int reviewTotal=ynmMemberServiceImpl.reviewTotal(memberEntireNo);
			int followTotal=ynmMemberServiceImpl.followTotal(memberEntireNo);

			int memberPoint=reviewTotal+reservationTotal;
			//찜한 가게 목록
			ArrayList<YNMFavorite> fList=ynmMemberServiceImpl.favoriteList(memberEntireNo);
			ym.setJjimTotal(jjimTotal);
			ym.setReservationTotal(reservationTotal);
			ym.setReviewTotal(reviewTotal);
			ym.setFollowTotal(followTotal);
			ym.setMemberPoint(memberPoint);
			//사용자 팔로잉 목록
			ArrayList<YNMFollow> followingList=ynmMemberServiceImpl.followInfo(memberEntireNo);
			ArrayList<YNMFollow> followingList2=null;
	
			ArrayList<YNMMember> followingYmList=new ArrayList<YNMMember>();
			YNMMember followingYm=null;
			if(followingList.size()>0) {
				for(int i=0; i<followingList.size(); i++) {
					followingYm=ynmMemberServiceImpl.memberFollowing(followingList.get(i).getFollowMemberIdNo());
					int followingReviewTotal=ynmMemberServiceImpl.reviewTotal(followingList.get(i).getFollowMemberIdNo());
					int followingFollowTotal=ynmMemberServiceImpl.followTotal(followingList.get(i).getFollowMemberIdNo());
					followingYm.setFollowTotal(followingFollowTotal);
					followingYm.setReviewTotal(followingReviewTotal);
					followingYmList.add(followingYm);
				}
				for(int i=0; i<followingYmList.size(); i++) {
					String followingMemberViewPath=ynmMemberServiceImpl.viewPath(followingYmList.get(i).getMemberUploadPhotoNo());
					followingYmList.get(i).setPhotoViewRoute(followingMemberViewPath);
				}
				
			}
			//사용자 팔로워 목록
			ArrayList<YNMFollow> followerList=ynmMemberServiceImpl.followerInfo(memberEntireNo);
			ArrayList<YNMFollow> followerList2=null;
			ArrayList<YNMMember> followerYmList=new ArrayList<YNMMember>();

			YNMMember followerYm=null;
			if(followerList.size()>0) {
				for(int i=0; i<followerList.size(); i++) {
					
					followerYm=ynmMemberServiceImpl.memberFollowing(followerList.get(i).getFollowerNo());
					int followingReviewTotal=ynmMemberServiceImpl.reviewTotal(followerList.get(i).getFollowerNo());
					int followingFollowTotal=ynmMemberServiceImpl.followTotal(followerList.get(i).getFollowerNo());
					followerYm.setFollowTotal(followingFollowTotal);
					followerYm.setReviewTotal(followingReviewTotal);
					followerYmList.add(followerYm);
				}
				for(int i=0; i<followerYmList.size(); i++) {
					String followingMemberViewPath=ynmMemberServiceImpl.viewPath(followerYmList.get(i).getMemberUploadPhotoNo());
					followerYmList.get(i).setPhotoViewRoute(followingMemberViewPath);
				}
				
			}
				if(followerList.size()>0 || followingList.size()>0) {
				followingList2=ynmMemberServiceImpl.followInfo(memberEntireNo);
				followerList2=ynmMemberServiceImpl.followerInfo(memberEntireNo);
				for(int i=0; i<followingList.size(); i++) {
					for(int j=0; j<followingList2.size(); j++) {
						if(followingList.get(i).getFollowMemberIdNo()==followingList2.get(j).getFollowMemberIdNo()) {
							followingYmList.get(i).setFollowChk(1);
						}
					}
				}
				for(int i=0; i<followerList.size(); i++) {
					for(int j=0; j<followingList2.size(); j++) {
						if(followerList.get(i).getFollowerNo()==followingList2.get(j).getFollowMemberIdNo()) {
							followerYmList.get(i).setFollowerChk(1);
						}
					}
				}
				
			}

			//내 정보 리뷰
			ArrayList<YNMStoreReview> ysrList=new ArrayList<YNMStoreReview>();
			ArrayList<YNMStoreReview> ysrList2=new ArrayList<YNMStoreReview>();
			ArrayList<YNMFollow> foList=null;
			ArrayList<YNMReviewLike> lList=null;
			ArrayList<YNMReviewJjim> jList=null;
			ArrayList<YNMStoreReview> myYsrList=new ArrayList<YNMStoreReview>();
			ArrayList<YNMFollow> foList2=null;
			ArrayList<YNMReviewLike> lList2=null;
			ArrayList<YNMReviewJjim> jList2=null;
			ArrayList<YNMStoreReview> jjimYsrList=new ArrayList<YNMStoreReview>();
		
					jjimYsrList=ynmMemberServiceImpl.jjimMyInfoReviewCheck(memberEntireNo);
					myYsrList=ynmMemberServiceImpl.myInfoReviewCheck(memberEntireNo);
					ysrList=ysrListGet(myYsrList);
					ysrList2=ysrListGet(jjimYsrList);
					foList= fListGet(ysrList,memberEntireNo);
					lList=lListGet(ysrList, memberEntireNo);
					jList=jListGet(ysrList, memberEntireNo);
					foList2= fListGet(jjimYsrList, memberEntireNo);
					lList2=lListGet(jjimYsrList,memberEntireNo);
					jList2=jListGet(jjimYsrList,memberEntireNo);
				
			
			ArrayList<YNMSearch> storeAllList = ynmMemberServiceImpl.storeAllList(memberEntireNo);
			if(storeAllList.size()>0) 
			{
				if(storeAllList.size()>0) {
					for(int i=0; i<storeAllList.size(); i++){
						YNMSearch ys=ynmMemberServiceImpl.starAvg(storeAllList.get(i).getOwStoreInfoPk());
						if(ys!=null) {
							storeAllList.get(i).setStarAvg(ys.getStarAvg());
						}
					}
				}
				//search page 가게 찜여부 확인
				for(int i=0; i<storeAllList.size(); i++) {
					int memberEntireNo2=0;
					//로그인한 사용자 찜 여부 확인
					session=request.getSession(false);
					if(((YNMMember)session.getAttribute("member"))!=null) {
						memberEntireNo2=((YNMMember)session.getAttribute("member")).getMemberEntireNo();
					}
					YNMFavorite yf = new YNMFavorite();
					yf.setMemberEntireNo(memberEntireNo2);
					yf.setOwStoreInfoNo(storeAllList.get(i).getOwStoreInfoPk());
					int favoriteChk=ynmMemberServiceImpl.favoriteChk(yf);
					int favoriteTotal=ynmMemberServiceImpl.favoriteTotal(storeAllList.get(i).getOwStoreInfoPk());
					storeAllList.get(i).setFavoriteChk(favoriteChk);
					storeAllList.get(i).setFavoriteTotal(favoriteTotal);
				}
			}
			
		
			ModelAndView view=new ModelAndView();
			view=search(session,request);
			if(ym!=null) {
				view.addObject("storeAllList",storeAllList);
				view.addObject("jjimReview",ysrList2);
				view.addObject("review",ysrList);
				view.addObject("followerYm",followerYmList);
				view.addObject("followingYm",followingYmList);
				view.addObject("favorite",fList);
				view.addObject("info",ym);
				view.addObject("img",viewPath);
				view.setViewName("ynmMember/otherInfo");
				return view;
			}
			else {
				return null;
			}
	}
	@ResponseBody
	@Override
	@RequestMapping(value="/reviewDetail.do")
	public JSONArray reviewDetail(HttpServletRequest request, HttpSession session) {
		
		YNMStoreReview ysr=ynmMemberServiceImpl.reviewDetail(request.getParameter("storeReviewNo"));
		String [] imgArr=ysr.getReviewImgList().split(",");
		ArrayList<YNMMemberUploadPhoto> imgList = ynmMemberServiceImpl.reviewImageList(imgArr);
		
		JSONArray objArr = new JSONArray();
		for(int i = 0; i<imgList.size();i++) {
			YNMMemberUploadPhoto ym = imgList.get(i);
			JSONObject obj = new JSONObject();
			
			obj.put("photoViewRoute", ym.getPhotoViewRoute());

			objArr.add(obj);
		}
		return objArr;
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

