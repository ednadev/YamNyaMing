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
import com.kh.ynm.member.controller.YNMMemberController;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.BoardPager;
import com.kh.ynm.member.model.vo.PagingTest;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMFollow;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.member.model.vo.YNMReviewJjim;
import com.kh.ynm.member.model.vo.YNMSearch;
import com.kh.ynm.member.model.vo.YNMSearchCheck;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMReviewLike;
import com.kh.ynm.member.model.vo.YNMStoreReview;
import com.kh.ynm.member.model.vo.YNMStoreUnderReview;
import com.kh.ynm.member.model.vo.pagingTest2;
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
		if(ym!=null) {
			session.setAttribute("member", ym);
			return "redirect:/index.jsp";
		}else {
			return "ynmMember/fail";
		}

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
	@RequestMapping(value="/idSearch.do")
	public ModelAndView idSearch(HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		vo.setMemberEmail(request.getParameter("memberEmail"));
		vo.setMemberName(request.getParameter("memberName"));
		YNMMember ym=ynmMemberServiceImpl.idSearch(vo);
		String memberName=ym.getMemberName();
		String resultMemberId=ym.getMemberId();
		String []memberId2=resultMemberId.split("");
		String memberId=memberId2[0]+memberId2[1];
		for(int i=2; i<memberId2.length; i++) {
			memberId+="*";
		}
		ym.setMemberId(memberId);
		
		ModelAndView view=new ModelAndView();
		if(ym!=null) {

			view.addObject("id",ym);
			view.addObject("memberName",memberName);
			view.setViewName("ynmMember/idsearch");
			return view;
		}else
		{
			return null;
		}
	}
	
	//비밀번호 변경
	@Override
	@RequestMapping(value="/pwSearch.do")
	public String passwordUpdateMember(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		return null;
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
			return "ynmMember/loginMember";
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);

			int result=ynmMemberServiceImpl.signUpMember(ym);
			return "ynmMember/loginMember";
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

	//내 정보 보기
	@Override
	@RequestMapping(value="/memberInfo.do")
	public Object memberInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMember vo=new YNMMember();
		session=request.getSession(false);
		vo.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		vo.setMemberPw(request.getParameter("memberPw"));

		YNMMember ym=ynmMemberServiceImpl.selectOneMember(vo);
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
	public String storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException {
		
		String path =context.getRealPath("\\resources\\image\\member\\"+((YNMMember)session.getAttribute("member")).getMemberId()+"\\review\\review");
		String remakeName = "";
		String reviewImgList="";
		List<MultipartFile> files = multi.getFiles("reviewImgList");
		File file = new File(path);
		 
		if(!file.exists()){
			 file.mkdirs(); //디렉토리가 존재하지 않는다면 생성
	        }



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


	
		YNMStoreReview ysr=new YNMStoreReview();
		ysr.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ysr.setReviewTitle(request.getParameter("reviewTitle"));
		ysr.setOwnerEntireNo(Integer.parseInt(request.getParameter("ownerStoreEntireNo")));
		ysr.setReviewContent(request.getParameter("reviewContent"));
		ysr.setReviewStar(request.getParameter("reviewStar"));
		ysr.setReviewImgList(reviewImgList);
		int result=ynmMemberServiceImpl.storeReviewInsert(ysr);
		return null;
	}

	//리뷰 정보 가져오기
	@Override
	@RequestMapping(value="/reviewCheck.do")
	public ModelAndView reviewCheck(HttpServletRequest request, HttpServletResponse response) {
		YNMMemberUploadPhoto ymup=new YNMMemberUploadPhoto();
		int OwnerStoreEntireNo=Integer.parseInt(request.getParameter("OwnerStoreEntireNo"));

		YNMStoreInfo ysi=ynmMemberServiceImpl.storeInfo(OwnerStoreEntireNo);
		ArrayList<YNMStoreReview> ysrList=ynmMemberServiceImpl.storeReviewCheck(OwnerStoreEntireNo);

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
			ysrList.get(i).setLikeTotal(likeTotal);
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
				if(ysi!=null && !ysrList.isEmpty()) {
				view.addObject("storeInfo",ysi);
				view.addObject("review",ysrList);
				view.setViewName("ynmMember/reviewTest");
				return view;
					
				}
				return null;
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
	public String likeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
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
	public String jjimInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
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
	public String followInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
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
	
	


	// �쓬�떇�젏 寃��깋
	@RequestMapping(value="/search.do")
	public Object search(HttpSession session, HttpServletRequest request) {
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

		YNMSearchCheck check = new YNMSearchCheck();

		ArrayList<YNMSearch> list = ynmMemberServiceImpl.search(check);
		ModelAndView view = new ModelAndView();
		if(!list.isEmpty()) {
			view.addObject("search",list);
			view.setViewName("ynmMember/search");
			return view;
		}
		return null;

	}
	

	// 음식점 상세 페이지
	@RequestMapping(value="/detailPage.do")
	public String detailPage() {
		return "ynmMember/detailPage";	
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


	@RequestMapping(value = "/pagingTest.do")
	public ModelAndView boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") PagingTest pt) {

		int currentPage;

		if(req.getParameter("currentPage")==null)
		{
			currentPage=1;
		}
		else
		{
			currentPage=Integer.parseInt(req.getParameter("currentPage"));
		}

		pagingTest2 qpd=ynmMemberServiceImpl.testAll(currentPage);

		ModelAndView view=new ModelAndView();
		if(qpd!=null) {
			view.addObject("test",qpd);
			view.setViewName("ynmMember/paging");
			return view;
		}
		return null;
	}
}
