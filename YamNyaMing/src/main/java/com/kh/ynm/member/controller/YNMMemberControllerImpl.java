package com.kh.ynm.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.common.MyFileRenamePolicy;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
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
	
	//濡쒓렇�씤
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
	
	//濡쒓렇�븘�썐
	@Override
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		session=request.getSession(false);
		
		session.invalidate();
		
		return "redirect:/index.jsp";

	}
	
	//�쉶�썝 媛��엯
	@Override
	@RequestMapping(value="/signUpMember.do")
	public String signUpMember(@RequestParam("avatarPhoto") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
		

			YNMMember ym=new YNMMember();
			ym.setMemberId(request.getParameter("memberId"));
			ym.setMemberPw(request.getParameter("memberPw"));
			ym.setMemberName(request.getParameter("memberName"));
			ym.setMemberNickName(request.getParameter("memberNickName"));
			ym.setMemberGender(request.getParameter("memberGender"));
			//yyyy-mm-dd �삎�깭濡� 諛쏆븘�빞�븿
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
		
		
		ym.setMemberUploadPhotoNo(ymupIndex.getUploadPhotoNo());
		
		int result2=ynmMemberServiceImpl.signUpMember(ym);
		
		//�쉶�썝媛��엯 �꽦怨듭떆
		return null;
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);
			
			int result=ynmMemberServiceImpl.signUpMember(ym);
			//�쉶�썝媛��엯 �꽦怨듭떆
			return null;
		}
		
		
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
	
	//�궡�젙蹂� �솗�씤
	@Override
	@RequestMapping(value="/memberInfo.do")
	public Object memberInfo(HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		YNMMemberCheck vo=new YNMMemberCheck();
		session=request.getSession(false);
		vo.setMemberId(((YNMMember)session.getAttribute("member")).getMemberId());
		vo.setMemberPw(request.getParameter("memberPw"));
		
		YNMMemberCheck ymc=ynmMemberServiceImpl.memberInfo(vo);
		System.out.println(ymc.getPhotoViewRoute());
		ModelAndView view=new ModelAndView();
	if(ymc!=null) {
			
			view.addObject("info",ymc);
			view.addObject("img",ymc.getPhotoViewRoute());
			view.setViewName("ynmMember/infoTest");
			return view;
		}
		else {
			
			return null;
		}
	}
	
	//鍮꾨�踰덊샇 蹂�寃�
	@Override
	@RequestMapping(value="/passwordUpdateMember.do")
	public String passwordUpdateMember(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		
		return null;
	}
	
	//�궡�젙蹂� �닔�젙
	@Override
	@RequestMapping(value="/updateMember.do")
	public String updateMember(@RequestParam("avatarPhoto") MultipartFile file,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		session=request.getSession(false);
		
		YNMMember ym=new YNMMember();
		ym.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ym.setMemberNickName(request.getParameter("memberNickName"));
		ym.setMemberEmail(request.getParameter("memberEmail"));
		//�씠誘몄� �벑濡� �뀒�씠釉� �닔�젙
		if(file.getSize()>0) {
			int uploadPhotoNo=((YNMMember)session.getAttribute("member")).getMemberUploadPhotoNo();
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
		ymup.setUploadPhotoNo(uploadPhotoNo);
		ymup.setOriginName(OriginName);
		ymup.setRemakeName(remakeName);
		ymup.setPhotoRoute(photoRoute);
		ymup.setPhotoViewRoute(photoViewRoute);
		
		int result=ynmMemberServiceImpl.updateUploadPhoto(ymup);
		
		int result2=ynmMemberServiceImpl.updateMember(ym);
		
		//�닔�젙 �꽦怨듭떆
		return null;
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);
			
			int result=ynmMemberServiceImpl.updateMember(ym);
			//�닔�젙 �떎�뙣�떆
			return null;
		}
		
		

	}
	
	//�쉶�썝 媛��엯�떆 �븘�씠�뵒 �쑀�슚�꽦 寃��궗
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
	//�쉶�썝 媛��엯�떆 �땳�꽕�엫 �쑀�슚�꽦 寃��궗
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
	
	
	//�삁�빟�븯湲� table
	//�삁�빟 �븯湲�
	@Override
	@RequestMapping(value="/bookInsert.do")
	public String bookInsert(YNMBook yb) {
		ynmMemberServiceImpl.bookInsert(yb);
		return null;
	}
	
	//�삁�빟 �젙蹂� �솗�씤
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
	
	
	
	//由щ럭 table
	
	//�뙎湲� �벑濡�
	@Override
	@RequestMapping(value="/storeReviewInsert.do")
	public String storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException {
		String path = "C:\\Users\\user1\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\memberPhoto\\";

		String remakeName = "";
		String reviewImgList="";
		List<MultipartFile> files = multi.getFiles("reviewImgList");
		File file = new File(path);
		

		for (int i = 0; i < files.size(); i++) {
					remakeName=System.currentTimeMillis()+"_"+files.get(i).getOriginalFilename();
			       file = new File(path+remakeName);
			       files.get(i).transferTo(file);
			       String OriginName=files.get(i).getOriginalFilename();
			       String photoRoute=path+remakeName;
			       String photoViewRoute="\\memberPhoto\\"+remakeName;
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
		
		
		YNMStoreReview ysr=new YNMStoreReview();
		
		ysr.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
		ysr.setReviewContent(request.getParameter("reviewContent"));
		ysr.setReviewTitle(request.getParameter("reviewTitle"));
		ysr.setOwnerEntireNo(Integer.parseInt(request.getParameter("ownerStoreEntireNo")));
		ysr.setReviewStar(request.getParameter("reviewStar"));
		ysr.setReviewImgList(reviewImgList);
		
		
		int result=ynmMemberServiceImpl.storeReviewInsert(ysr);
	
		return null;
	}
	
	//�뙎湲� 遺덈윭�삤湲�
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
	
	//���뙎湲� �벑濡�
	@Override
	@RequestMapping(value="/storeUnderReviewInsert.do")
	public String storeUnderReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
		int result=ynmMemberServiceImpl.storeUnderReviewInsert(ysur);
	
		return null;
	}
	
	
	
	// �쓬�떇�젏 寃��깋
	@RequestMapping(value="/search.do")
	public String search(HttpSession session, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		String food = request.getParameter("food");
		String place = request.getParameter("place");
		session.setAttribute("keyword",keyword);
		session.setAttribute("food", food);
		session.setAttribute("place", place);
		return "ynmMember/search";
	}
	


}
