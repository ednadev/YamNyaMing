package com.kh.ynm.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import com.kh.ynm.common.MyFileRenamePolicy;
import com.kh.ynm.common.controller.CommonControllerImpl;
import com.kh.ynm.member.controller.YNMMemberController;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;

import com.kh.ynm.member.model.vo.YNMBook;
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
				return "redirect:/index.jsp";
			}else {
				return "ynmMember/memberError/loginError";
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

		return null;
	}
	//비밀번호 변경하기
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

	//내 정보 보기
	@Override
	@RequestMapping(value="/memberInfo.do")
	public Object memberInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		session=request.getSession(false);
		vo.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());

		YNMMember ym=ynmMemberServiceImpl.selectOneMember2(vo);
		String viewPath=ynmMemberServiceImpl.viewPath(ym.getMemberUploadPhotoNo());


		ModelAndView view=new ModelAndView();
		if(ym!=null) {

			view.addObject("info",ym);
			view.addObject("img",viewPath);
			view.setViewName("ynmMember/infoTest");
			return view;
		}
		else {

		}
		return null;
	}

	//내정보 수정하기
	@Override
	@RequestMapping(value="/updateMember.do")
	public String updateMember(@RequestParam("avatarPhoto") MultipartFile file,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session=request.getSession(false);

		YNMMember ym=new YNMMember();
		ym.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ym.setMemberNickName(request.getParameter("memberNickName"));
		ym.setMemberEmail(request.getParameter("memberEmail"));

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
			ymup.setUploadPhotoNo(uploadPhotoNo);
			ymup.setOriginName(OriginName);
			ymup.setRemakeName(remakeName);
			ymup.setPhotoRoute(photoRoute);
			ymup.setPhotoViewRoute(photoViewRoute);

			int result=ynmMemberServiceImpl.updateUploadPhoto(ymup);

			int result2=ynmMemberServiceImpl.updateMember(ym);

			//이미지 변경 수정
			return null;
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);

			int result=ynmMemberServiceImpl.updateMember(ym);
			//이미지 삭제
			return null;
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
	//예약하기 삽입
	@Override
	@RequestMapping(value="/bookInsert.do")
	public String bookInsert(YNMBook yb) {
		ynmMemberServiceImpl.bookInsert(yb);
		return null;
	}

	//예약정보 가져오기
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
	public ModelAndView storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException {



		String path =context.getRealPath("\\resources\\image\\member\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\review\\review");
		System.out.println(context.getRealPath("/"));
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
				System.out.println(result);
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

	//리뷰 정보 가져오기
	@Override
	@RequestMapping(value="/reviewCheck.do")
	public ModelAndView reviewCheck(HttpServletRequest request, HttpServletResponse response) {
		YNMMemberUploadPhoto ymup=new YNMMemberUploadPhoto();
		YNMStoreReview ysr=new YNMStoreReview();
		YNMFollow yf=new YNMFollow();
		int OwnerStoreEntireNo=Integer.parseInt(request.getParameter("owStoreInfoPk"));
		ArrayList<YNMStoreReview> ysrList=ynmMemberServiceImpl.storeReviewCheck(OwnerStoreEntireNo);
		HttpSession session=request.getSession(false);
		ArrayList<YNMFollow> fList=null;
		ArrayList<YNMReviewLike> lList=null;
		ArrayList<YNMReviewJjim> jList=null;
		int starSum=0;
		float starAvg=0;
		if(!ysrList.isEmpty()) {
		for(int i=0; i<ysrList.size(); i++ ) {
				starSum+=ysrList.get(i).getReviewStar();
			}
		starAvg=starSum/ysrList.size();
		}
		
		if(session.getAttribute("member") !=null) {
			int memberNo=(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			fList=ynmMemberServiceImpl.followInfo(memberNo);
			if(fList.size()==0) {
				fList=null;
			}
		}
		if(session.getAttribute("member") !=null) {
			int memberNo=(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			lList=ynmMemberServiceImpl.likeInfo(memberNo);
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
		}
		if(session.getAttribute("member") !=null) {
			int memberNo=(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
			jList=ynmMemberServiceImpl.jjimInfo(memberNo);
			System.out.println(jList.size());
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
		}




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
					YNMMemberUploadPhoto tempPhoto = imgList.get(j);
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


		ModelAndView view=new ModelAndView();
		if(!ysrList.isEmpty()) {
			view.addObject("starAvg",starAvg);
			view.addObject("review",ysrList);
			view.addObject("follow",fList);
			view.addObject("lList",lList);
			view.addObject("jList",jList);
			return view;

		}else {
			view.addObject("noReview"," 등록된 리뷰가 없습니다.");
			return view;

		}
	}
	//리뷰 대댓글 작성
	@Override
	@RequestMapping(value="/storeUnderReviewInsert.do")
	public String storeUnderReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
		int result=ynmMemberServiceImpl.storeUnderReviewInsert(ysur);
		return null;
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

	@Override
	@RequestMapping(value="/settingInfo.do")
	public ModelAndView settingInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session=request.getSession(false);
		int memberEntireNo=((YNMMember)session.getAttribute("member")).getMemberEntireNo();
		YNMMemberSetting yms=ynmMemberServiceImpl.settingInfo(memberEntireNo);

		ModelAndView view = new ModelAndView();
		if(yms!=null) {
			view.addObject("setting",yms);
			view.setViewName("ynmMember/memberSetting");
			return view;
		}else {
			return null;
		}

	}	

	// 사용자 검색
	@RequestMapping(value="/search.do")
	public ModelAndView search(HttpSession session, HttpServletRequest request) {
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
		check.setStoreCateDetailName(storeCateDetailName);
		check.setOwBudget(owBudget);
		check.setOwSubInfo(owSubInfo);
		check.setOwDrinkListInfo(owDrinkListInfo);


		int currentPage;

		if(request.getParameter("currentPage")==null)
		{
			currentPage=1;
		}
		else
		{
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}

		YNMSearchPaging qpd=ynmMemberServiceImpl.search(currentPage,check);

		
		JSONObject resultMap=new JSONObject();
		//JSONObject객체 자체가 기본적으로 MAP형태이기 때문에 키:값 형태로 사용하면 됨

		int index = 0;
		while(index<(qpd.getNoticelist()).size()) {
			YNMSearch search = qpd.getNoticelist().get(index);
			JSONObject result = new JSONObject();
			result.put("owStoreInfoPk", search.getOwStoreInfoPk());
			result.put("owStoreName", search.getOwStoreName());
			result.put("owStoreAddr", search.getOwStoreAddr());
			resultMap.put(index, result);
			index++;
		}


		ModelAndView view=new ModelAndView();
		if(qpd!=null) {
			view.addObject("resultMap",resultMap);
			view.addObject("search",qpd);
			view.setViewName("ynmMember/search");
			return view;
		}else {
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
		int size=storeImg.size();

		ModelAndView view=new ModelAndView();

		view=reviewCheck(request,response);
		if(store!=null && storeImg!=null) {
			view.addObject("store", store);
			view.addObject("size", size);
			view.addObject("storeImg", storeImg);
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
		String info = request.getParameter("owStoreInfoPk");
		System.out.println(info);
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
	//좋아요한 사람들 팝업창
	@RequestMapping(value="/likeTotalMemberInfo.do")
	public ModelAndView likeTotalMemberInfo(HttpServletRequest request, HttpServletResponse response) {

		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		ArrayList<YNMMember> likeMemberList=ynmMemberServiceImpl.likeTotalMemberInfo(storeReviewNo);
		int likeTotal=ynmMemberServiceImpl.likeTotal(storeReviewNo);
		for(int i=0; i<likeMemberList.size(); i++) {
			int reviewTotal=ynmMemberServiceImpl.reviewTotal(likeMemberList.get(i).getMemberEntireNo());
			int followTotal=ynmMemberServiceImpl.followTotal(likeMemberList.get(i).getMemberEntireNo());
			likeMemberList.get(i).setFollowTotal(followTotal);
			likeMemberList.get(i).setReviewTotal(reviewTotal);
		}

		ModelAndView view=new ModelAndView();
		if(!likeMemberList.isEmpty()) {
			view.addObject("likeMemberList",likeMemberList);
			view.addObject("likeTotal",likeTotal);
			view.setViewName("ynmMember/likeTotalMemberInfo");
			return view;
		}else {
			view.setViewName("ynmMember/Error");
			return view;
		}
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

	@RequestMapping(value="/test.do")
	public String test(HttpServletRequest request) {
		String test=request.getParameter("name");
		return "ynmMember/test";
	}
}

