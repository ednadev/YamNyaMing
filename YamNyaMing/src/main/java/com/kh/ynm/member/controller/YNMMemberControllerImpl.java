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
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
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

		if(file.getSize()>0) {
			String OriginName=file.getOriginalFilename();
			String remakeName=System.currentTimeMillis()+"_"+OriginName;
			String photoRoute="C:\\Users\\minho\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\image\\"+remakeName;
			String photoViewRoute="\\image\\"+remakeName;
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


//			ym.setMemberAvatar(ymupIndex.getUploadPhotoNo());
			int result2=ynmMemberServiceImpl.signUpMember(ym);

			//�쉶�썝媛��엯 �꽦怨듭떆
			return null;
		}
		else {
			int memberUploadPhotoNo=1;
			ym.setMemberUploadPhotoNo(memberUploadPhotoNo);

			int result=ynmMemberServiceImpl.signUpMember(ym);
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
			String photoRoute="C:\\Users\\minho\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\image\\"+remakeName;
			String photoViewRoute="\\image\\"+remakeName;
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

	//리뷰 table
	@Override
	@RequestMapping(value="/storeReviewInsert.do")
	public String storeReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) throws IOException {
		String path ="C:\\Users\\minho\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\image\\";
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
			String photoViewRoute="\\image\\"+remakeName;
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
		return null;
	}
	//���뙎湲� �벑濡�
	@Override
	@RequestMapping(value="/storeUnderReviewInsert.do")
	public String storeUnderReviewInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
		int result=ynmMemberServiceImpl.storeUnderReviewInsert(ysur);

		return null;
	}

	@Override
	@RequestMapping(value="/likeInsert.do")
	public String likeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,YNMStoreUnderReview ysur) {
		int memberEntireNo=Integer.parseInt(request.getParameter("memberEntireNo"));
		int storeReviewNo=Integer.parseInt(request.getParameter("storeReviewNo"));
		YNMReviewLike yrl=new YNMReviewLike();
		yrl.setMemberEntireNo(memberEntireNo);
		yrl.setStoreReviewNo(storeReviewNo);
		int likeChk=ynmMemberServiceImpl.likeChk(yrl);
		if(likeChk>0) {
			String chk="0";
			return chk;
		}
		else {
			int result=ynmMemberServiceImpl.likeInsert(yrl);
			if(result>0) {
				String chk="1";
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

	//	@RequestMapping(value = "/pagingTest.do")
	//    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") PagingTest pt) {
	//
	//        
	//    ///////paging : S//////////////////////////////
	//     
	//    int pageSize = pt.getPageSize();// 한페이지에 나오는 게시물 개수
	//    int pageIndex = pt.getPageIndex(); //현재 선택한 페이지 number
	//    int pageGroupSize = pt.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
	//    int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
	//    int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호
	// 
	//    pt.setStartRow(startRow);
	//    pt.setEndRow(endRow);
	//    int count = ynmMemberServiceImpl.boardCount(pt); //게시물 총 개수
	// 
	//    int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
	//    int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);
	//     
	//    List<PagingTest> boardList = ynmMemberServiceImpl.boardList(pt);
	//     
	//    modelMap.put("pageIndex", pageIndex);
	//    modelMap.put("pageSize", pageSize);
	//    modelMap.put("count", count);
	//    modelMap.put("pageGroupSize", pageGroupSize);
	//    modelMap.put("nowPageGroup", nowPageGroup);
	//    modelMap.put("pageGroupCount", pageGroupCount);
	//    modelMap.put("articleList", boardList);
	//    modelMap.put("boardSearchVO", pt);
	//     
	//        return "ynmMember/paging";
	//    }

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

	@Override
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String enrollMember() {
		// TODO Auto-generated method stub
		return null;
	}
}
