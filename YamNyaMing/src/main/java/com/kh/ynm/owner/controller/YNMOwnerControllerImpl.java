package com.kh.ynm.owner.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.common.controller.CommonControllerImpl;
import com.kh.ynm.common.model.vo.YNMTotalRefModel;
import com.kh.ynm.member.model.vo.YNMBook;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.owner.model.service.YNMOwnerServiceImpl;
import com.kh.ynm.owner.model.vo.BookSearchVo;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreBoardData;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
import com.kh.ynm.owner.model.vo.StoreMenuData;
import com.kh.ynm.owner.model.vo.StorePageData;
import com.kh.ynm.owner.model.vo.StoreTitleData;
import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreDetailInfo;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

@Controller
public class YNMOwnerControllerImpl implements YNMOwnerController{
	
	
	@Autowired private ServletContext servletContext;

	@Autowired
	@Qualifier(value="ynmOwnerService")
	private YNMOwnerServiceImpl ynmOwnerServiceImpl;
	
	
	@Override
	@RequestMapping(value="/ownerLogin.do")
	public String selectOneOwner(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String owId = request.getParameter("memberId");
		String owPw = request.getParameter("memberPw");
		YNMOwner owner = new YNMOwner();
		owner.setOwId(owId);
		owner.setOwPw(owPw);
		YNMOwner resultOwner = ynmOwnerServiceImpl.selectOneOwner(owner);
		if(resultOwner!=null)
		{
			session.setAttribute("owner", resultOwner);
			if(session.getAttribute("member")!=null)
			{
				session.removeAttribute("member");
			}
			return "redirect:/";
		}
		else
		{// 로그인 실패.
			return "ynmOwner/ynmOwnerError/ownerLoginFail";
		}
		
	}
	
	@Override
	@RequestMapping(value="/ownerSignOut.do")
	public String ynmOwnerSignOut(HttpSession session, @RequestParam String owId, @RequestParam String owPw) {
		return null;
	}
	
	

	@Override
	@RequestMapping(value="/ownerAddStore.do")
	public String addStore(MultipartHttpServletRequest mainImgFile,MultipartHttpServletRequest menuImgFile, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			YNMStoreInfo storeInfo = new YNMStoreInfo();
			storeInfo.setOwEntireFk(owner.getOwEntirePk());
			storeInfo.setOwStoreBizNum(request.getParameter("owStoreBizNum"));
			storeInfo.setOwStoreName(request.getParameter("owStoreName"));
			String tel = request.getParameter("regionTel")+request.getParameter("owTel");
			storeInfo.setOwStoreTel(tel);
			storeInfo.setOwBigTypeFk(YNMTotalRefModel.getCateMainIndex(request.getParameter("owStoreBigType")));
		    storeInfo.setOwSmallTypeFk(YNMTotalRefModel.getCateDetailIndex(request.getParameter("owStoreSmallType")));
			storeInfo.setOwStoreMapInfo("");
			storeInfo.setOwStoreUrl(request.getParameter("owStoreUrl"));
			String addr = request.getParameter("postNum") + request.getParameter("addrStreet") + request.getParameter("detailAddr");
			storeInfo.setOwStoreAddr(addr);
			String owStoreWorkingTime = request.getParameter("workingWeek")+" " + 
					request.getParameter("owStoreWorkingTimeStart") +"-" + request.getParameter("owStoreWorkingTimeEnd") + 
					" " + request.getParameter("extWorkingOption");
			storeInfo.setOwStoreWorkingTime(owStoreWorkingTime); 
			
			int result = ynmOwnerServiceImpl.ynmStoreAdd(storeInfo);
			// 가게 등록이 완료됐으면.
			if(result>0) {
				// 가게 인덱스
				int storeInfoIndex = ynmOwnerServiceImpl.ynmSelectStoreIndex(storeInfo.getOwStoreBizNum());
				int menuType = Integer.parseInt(request.getParameter("storeMenuType"));
				YNMStoreDetailInfo detailInfo = new YNMStoreDetailInfo();
				detailInfo.setOwStoreInfoFk(storeInfoIndex);// 설명할 가게 인덱스
				String[] tips = request.getParameterValues("owStoreTip");
				String tip="";
				for(int i= 0; i<tips.length;i++)
				{
					if(tips[i]!=null && tips[i].length()>0) {
						tip += tips[i];
						if(i<tips.length-1) {
							if(tips[i+1].length()>0) tip+=",";
						}
					}else {
						break;
					}
					
				}
				// 대표 이미지 등록
				List<MultipartFile> files = mainImgFile.getFiles("mainImgFile");
				String uploadPhotoImg = "";
				if(files.size()>0) {
					String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeHeadPhoto\\headPhoto_");
					String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeHeadPhoto\\");
					for (int i = 0; i < files.size(); i++) 
					{
						String originName= files.get(i).getOriginalFilename();
						String remakeName= System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
						
						File f=new File(photoRoute + remakeName);
						//해당 디렉토리의 존재여부를 확인
						if(!f.exists()){
							//없다면 생성
							f.mkdirs(); 
						}
						try {
							files.get(i).transferTo(f);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						
						OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
						uploadPhoto.setOwPhotoTypeFk(3);
						uploadPhoto.setStoreInfoFk(storeInfoIndex);
						uploadPhoto.setOriginName(originName);
						uploadPhoto.setRemakeName("headPhoto_" + remakeName);
						uploadPhoto.setPhotoRoute(photoSaveRoute);
						
						int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
						if(photoUpload>0) {
							int photoIndex =ynmOwnerServiceImpl.photoSelectWithName("headPhoto_" +remakeName);
							if(i<files.size()-1) uploadPhotoImg+=photoIndex+",";
							else uploadPhotoImg+=photoIndex;
						}else {
							System.out.println("이미지 업로드 실패");
							break;
						}
					}
				}
				
				detailInfo.setOwStoreTip(tip);
				detailInfo.setOwStoreLineComment(request.getParameter("owStoreLineComment"));
				detailInfo.setStoreBigType(YNMTotalRefModel.getCateMainIndex(request.getParameter("owStoreBigType")));
				detailInfo.setStoreSmallType(YNMTotalRefModel.getCateDetailIndex(request.getParameter("owStoreSmallType")));
				detailInfo.setRecommandMenu(request.getParameter("owStoreRecommandMenuList"));
				detailInfo.setStoreTableInfo(request.getParameter("owStoreTableInfo"));
				detailInfo.setBudgetInfo(request.getParameter("owBudget"));
				detailInfo.setOwSubInfo(request.getParameter("owSubInfo"));
				detailInfo.setOwDrinkListInfo(request.getParameter("owDrinkListInfo"));
				detailInfo.setOwStoreMenuTypeFk(menuType);//설명타입
				detailInfo.setOwStoreHeadPhoto(uploadPhotoImg);

				switch(detailInfo.getOwStoreMenuTypeFk()) {
					case 1:// 이미지 등록 정보
						List<MultipartFile> filesMenu = menuImgFile.getFiles("menuImageFile");
						if(filesMenu.size()>0) {
							String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\menuP_");
							String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\");
							String menuPhotoList = "";
							for (int i = 0; i < filesMenu.size(); i++)
							{
								String originName= filesMenu.get(i).getOriginalFilename();
								String remakeName=  System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
								
								File f=new File(photoRoute+remakeName);
								//해당 디렉토리의 존재여부를 확인
								if(!f.exists()){
									//없다면 생성
									f.mkdirs(); 
								}
								try {
									filesMenu.get(i).transferTo(f);
								} catch (IllegalStateException e) {
									e.printStackTrace();
								} catch (IOException e) {
									e.printStackTrace();
								}
								
								OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
								uploadPhoto.setOwPhotoTypeFk(4);
								uploadPhoto.setStoreInfoFk(storeInfoIndex);
								uploadPhoto.setOriginName(originName);
								uploadPhoto.setRemakeName("menuP_" +remakeName);
								uploadPhoto.setPhotoRoute(photoSaveRoute);
								
								int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
								if(photoUpload>0) {
									int photoIndex =ynmOwnerServiceImpl.photoSelectWithName("menuP_" +remakeName);
									if(i<filesMenu.size()-1) menuPhotoList+=photoIndex+",";
									else menuPhotoList+=photoIndex;
								}else {
									System.out.println("이미지 업로드 실패");
									break;
								}
							}
							detailInfo.setOwStoreMenuInfoDetail(menuPhotoList);
							
						}
						break;
					case 2:// 메뉴 등록 정보
						String [] menuCateArr = request.getParameterValues("menuCategoryTitle");
						String [] menuArr = request.getParameterValues("owRecommandMenu");
						String [] menuPriceArr = request.getParameterValues("owRecommandMenuPrice");
						String [] menuExplainArr = request.getParameterValues("owMenuExplain");
						String menuInfoList = "";
						for(int i = 0; i<menuCateArr.length;i++)
						{
							MenuInfo menuInfo = new MenuInfo();
							String menuId = System.currentTimeMillis()+"_"+owner.getOwEntirePk()+"_"+menuArr[i];
							menuInfo.setOwStoreInfoFk(storeInfoIndex);
							menuInfo.setMenuId(menuId);
							menuInfo.setMenuTitle(menuCateArr[i]);
							menuInfo.setSubTitle(menuArr[i]);
							menuInfo.setExplain(menuExplainArr[i]);
							menuInfo.setMenuCost(Integer.parseInt(menuPriceArr[i]));
							
							int menuResult = ynmOwnerServiceImpl.ownerMenuUpload(menuInfo);
							if(menuResult>0)
							{
								int menuIndex =  ynmOwnerServiceImpl.selectMenuWithId(menuId);
								if(i<menuCateArr.length-1) menuInfoList+=menuIndex+",";
								else menuInfoList+=menuIndex;
							}
							else
							{
								System.out.println("메뉴 인서트 실패");
								break;
							}
							
						}
						detailInfo.setOwStoreMenuInfoDetail(menuInfoList);
						break;
				}
				detailInfo.setOwStoreCostType("ko");
				
				int detailInfoResult = ynmOwnerServiceImpl.storeDetailInfo(detailInfo);
			}
			 
			
			return "redirect:/";
		}
		return "ynmOwner/notLogin";
	}


	@Override
	@RequestMapping(value="/ownerSignUp.do")
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner) {
		int result = ynmOwnerServiceImpl.ynmOwnerSignUp(owner);
		if(result>0)
		{
			YNMOwner resultOwner = ynmOwnerServiceImpl.selectOneOwner(owner);
			if(resultOwner!=null)
			{
				session.setAttribute("owner", resultOwner);
				if(session.getAttribute("member")!=null)
				{
					session.removeAttribute("member");
				}
				return "redirect:/";
			}
			else
			{// 로그인 실패.
				return "ynmOwner/ynmOwnerError/ownerLoginFail";
			}
		}
		else
		{
			return "ynmOwner/signUpFail";
		}
	}
	
	
	@Override
	@ResponseBody
	@RequestMapping(value="/ownerIdChk.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ownerId = request.getParameter("ownerId");
		YNMOwner owner = ynmOwnerServiceImpl.idCheck(ownerId);
		if(owner!=null) return "y";
		else return "n";
	}

	@Override
	@RequestMapping(value="/ownerLogout.do")
	public String ynmOwnerLogout(HttpSession session) {
		if(session.getAttribute("owner")!=null)
		{
			session.removeAttribute("owner");
			session.removeAttribute("ownerReCheck");
			session.invalidate();
		}
		return "redirect:/";
	}

	@Override
	@RequestMapping(value="/couponEnroll.do")
	public Object couponAdd(HttpSession session,HttpServletRequest request ) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null)
		{
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			CouponEnroll couponEnroll = new CouponEnroll();
			couponEnroll.setOwEntireFk(owner.getOwEntirePk());
			couponEnroll.setOwStoreInfoFk(currentSelectStoreIndex(session));
			couponEnroll.setOwCouponName(request.getParameter("owCouponName"));
			couponEnroll.setOwCouponCount(Integer.parseInt(request.getParameter("couponCount")));
			Date startDate= new Date();
			Date expireDate= new Date();
			try {
				startDate = sdf.parse(request.getParameter("couponStartDate"));
				expireDate = sdf.parse(request.getParameter("couponExpireDate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			couponEnroll.setOwCouponStartDate(startDate);
			couponEnroll.setOwCouponExpireDate(expireDate);
			couponEnroll.setOwCouponDetail(request.getParameter("couponDetail"));
			
			int result = ynmOwnerServiceImpl.couponEnroll(couponEnroll);
			if(result>0)
			{
				return couponShowList(session,request);
			}
			else {
		
				view.setViewName("ynmOwner/ynmOwnerError/couponEnrollFail");
				return view;
			}
		}
		return null;
	}
	
	@Override
	@RequestMapping(value="/couponManage.do")
	public ModelAndView couponShowList(HttpSession session,HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			
			int storeIndex = currentSelectStoreIndex(session);
			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<CouponEnroll> couponList = ynmOwnerServiceImpl.couponListPaging(currentPage,recordCountPerPage, owner.getOwEntirePk() , storeIndex);
//			System.out.println("확인 " + couponList.get(0).getOwCouponDuringDate());
			CouponPageData pageNavi = ynmOwnerServiceImpl.couponPageNavi(currentPage,recordCountPerPage,naviCountPerPage,owner.getOwEntirePk() , storeIndex);
			view.addObject("couponListData", couponList);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmOwner/couponManagePage");
		}else
		{
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@ResponseBody
	@RequestMapping("/couponUpdate.do")
	public String couponUpdate(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("owner")!=null)
		{
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			CouponEnroll couponEnroll = new CouponEnroll();
			couponEnroll.setOwCouponInfoPk(Integer.parseInt(request.getParameter("couponIndex")));
			couponEnroll.setOwEntireFk(owner.getOwEntirePk());
			couponEnroll.setOwStoreInfoFk(currentSelectStoreIndex(session));
			couponEnroll.setOwCouponName(request.getParameter("couponName"));
			couponEnroll.setOwCouponCount(Integer.parseInt(request.getParameter("couponCount")));
			Date startDate= new Date();
			Date expireDate= new Date();
			System.out.println("업데이트 " + request.getParameter("couponStartDate"));
//			try {
//				startDate = sdf.parse(request.getParameter("couponStartDate"));
//				expireDate = sdf.parse(request.getParameter("couponExpireDate"));
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
//			couponEnroll.setOwCouponStartDate(startDate);
//			couponEnroll.setOwCouponExpireDate(expireDate);
			couponEnroll.setOwCouponDetail(request.getParameter("couponExplain"));
			
			int result = ynmOwnerServiceImpl.couponUpdate(couponEnroll);
			return result+"";
		}
		return "0";
	}
	
//	@Override
//	public Strin
	
	@Override
	@RequestMapping("/ownerIdPassChk.do")
	public String ownerIdPassCheck(HttpSession session,HttpServletRequest request)
	{
		String owId = request.getParameter("owIdBeforeCheck");
		String owPw = request.getParameter("owPwBeforeCheck");
		
		YNMOwner owner = new YNMOwner();
		owner.setOwId(owId);
		owner.setOwPw(owPw);
		YNMOwner resultOwner = ynmOwnerServiceImpl.selectOneOwner(owner);
		if(resultOwner!=null)
		{
			session.setAttribute("ownerReCheck", resultOwner);
			return "ynmOwner/ownerInfo";
		}
		else
		{// 로그인 실패.
			return "ynmOwner/ynmOwnerError/idPassReCheckFail";
		}
	}
	
	@Override
	@RequestMapping("/ownerInfoUpdate.do")
	public String ownerInfoUpdate(HttpSession session, YNMOwner owner)
	{
		int result = ynmOwnerServiceImpl.ynmOwnerInfoUpdate(owner);
		if(result>0)return  "ynmOwner/ownerMyPage";
		else return "ynmOwner/ynmOwnerError/ownerInfoUpdateFail";
	}

	@RequestMapping("/ownerMyPage.do")
	public ModelAndView myPageMain(HttpSession session, HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			view = storeManageEnrollList(session, request);
			view.setViewName("ynmOwner/ownerMyPage");
		}else {
			view.setViewName("ynmOwner/notLogin");
		}
		return view;
	}
	
	public ModelAndView storeManageEnrollList(HttpSession session, HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			int ownerIndex = owner.getOwEntirePk();
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));

			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<StoreTitleData> storeInfoList = ynmOwnerServiceImpl.ynmStoreInfoList(ownerIndex, currentPage,recordCountPerPage);
			StorePageData spd = ynmOwnerServiceImpl.ynmStoreNavi(currentPage,recordCountPerPage,naviCountPerPage,ownerIndex);
			view.addObject("storeTitleInfo", storeInfoList);
			view.addObject("pageNaviData",spd);
		}else {
			view.setViewName("ynmOwner/");
		}
		return view;
	}
	
	public int currentSelectStoreIndex(HttpSession session)
	{
		if(session.getAttribute("currentStoreIndex")!=null)
		{
			return Integer.parseInt(session.getAttribute("currentStoreIndex").toString());
		}else
		{
			int ownerIndex = ((YNMOwner)session.getAttribute("owner")).getOwEntirePk();
			int storeFirstIndex = ynmOwnerServiceImpl.selectStoreIndex(ownerIndex);
			session.setAttribute("currentStoreIndex", storeFirstIndex);
			return storeFirstIndex;
		}
	}
	
	@Override
	@RequestMapping("/storeManage.do")
	public ModelAndView storeList(HttpSession session, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			int ownerIndex = owner.getOwEntirePk();
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));

			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<StoreTitleData> storeInfoList = ynmOwnerServiceImpl.ynmStoreInfoList(ownerIndex, currentPage,recordCountPerPage);
			StorePageData spd = ynmOwnerServiceImpl.ynmStoreNavi(currentPage,recordCountPerPage,naviCountPerPage,ownerIndex);
			view.addObject("storeTitleInfo", storeInfoList);
			view.addObject("pageNaviData",spd);
			if(storeInfoList.size()>0) {
				if(session.getAttribute("currentStoreIndex")==null) {//request.getParameter("storeIndex")==null) {
					StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeInfoList.get(0).getOwStoreInfoPk());
					view.addObject("storeInfoPageData", storeInfoPD);
//					view.addObject("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
					/*가게를 들어가면 점주가 처음 등록한 인덱스를 세션에 저장함.*/
					session.setAttribute("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
				}else
				{
					int storeIndex = currentSelectStoreIndex(session);//request.getParameter("storeIndex"));
					StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeIndex);
					view.addObject("storeInfoPageData", storeInfoPD);
				}
			}
			view.setViewName("ynmOwner/storeManagePage");
		}else {
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@Override
	@RequestMapping("/storeInfoPage.do")
	public ModelAndView storeDetailInfo(HttpSession session, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			view = storeList(session, request);
			int storeIndex = (request.getParameter("storeIndex")!=null)?
							 Integer.parseInt(request.getParameter("storeIndex")):
								 currentSelectStoreIndex(session);
			session.setAttribute("currentStoreIndex", storeIndex);
			StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeIndex);
			view.addObject("storeInfoPageData", storeInfoPD);
			view.setViewName("ynmOwner/storeManagePage");
		}
		else
		{
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@Override
	@RequestMapping("/storeInfoEdit.do")
	public ModelAndView storeInfoEdit(HttpSession session, HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			StoreInfoPageData storeInfoPD = new StoreInfoPageData();
			storeInfoPD.setOwStoreInfoPk(currentSelectStoreIndex(session));
			storeInfoPD.setOwStoreName(request.getParameter("owStoreName"));
			storeInfoPD.setOwStoreTel(request.getParameter("owStoreTel"));
			storeInfoPD.setOwStoreAddr(request.getParameter("owStoreAddr"));
			storeInfoPD.setOwStoreUrl(request.getParameter("owStoreUrl"));
			storeInfoPD.setOwStoreWorkingTime(request.getParameter("owStoreWorkingTime"));
			storeInfoPD.setBudgetInfo(request.getParameter("budgetInfo"));
			storeInfoPD.setOwStoreLineComment(request.getParameter("owStoreLineComment"));
			storeInfoPD.setOwStoreTip(request.getParameter("owStoreTip"));
			storeInfoPD.setRecommandMenu(request.getParameter("recommandMenu"));
			storeInfoPD.setOwBigTypeFk(YNMTotalRefModel.getCateMainIndex(request.getParameter("owBigTypeFk")));
			storeInfoPD.setOwSmallTypeFk(YNMTotalRefModel.getCateDetailIndex(request.getParameter("owSmallTypeFk")));//Integer.getParameter);
			storeInfoPD.setStoreTableInfo(request.getParameter("storeTableInfo"));
			storeInfoPD.setOwSubInfo(request.getParameter("owSubInfo"));
			storeInfoPD.setOwDrinkListInfo(request.getParameter("owDrinkListInfo"));
			
			
			int result = ynmOwnerServiceImpl.storeInfoEdit(storeInfoPD);
			if(result>0)
			{
				int resultDetail = ynmOwnerServiceImpl.storeInfoDetailEdit(storeInfoPD);
				if(resultDetail>0)
				{
					view = storeDetailInfo(session, request);
				}
				else System.out.println("상세정보 업데이트 실패");
			}
			else System.out.println("일반정보 업데이트 실패");
		}else {
			view.setViewName("ynmOwner/");
		}
		return view;
	}
	
	@Override
	@RequestMapping("/storePageTypeLoad.do")
	public ModelAndView storePageTypeLoad(HttpSession session,  HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			String storeTapType = request.getParameter("storeTapType")!=null?request.getParameter("storeTapType"):"정보";
			int storeIndex = currentSelectStoreIndex(session);//request.getParameter("storeIndex"));
			int tapOrder = 0;
			
			view = storeManageEnrollList(session, request);
			if(storeTapType.equals("정보")){
				tapOrder = 0;
				view = storeDetailInfo(session,request);
			}else if(storeTapType.equals("포토")) {
				tapOrder = 1;
				view.addObject("headPhotoList", storeHeadPhotoList(3,storeIndex));
			}else if(storeTapType.equals("리뷰")) {
				tapOrder = 2;
			}else if(storeTapType.equals("메뉴")) {
				StoreMenuData storeMenuData = ynmOwnerServiceImpl.storeMenuData(storeIndex); 
				String menuInfo  = storeMenuData.getMenuInfoList();
				int menuType = storeMenuData.getMenuType();
				if(menuType==1) // 사진용
				{
					ArrayList<OwnerUploadPhoto> menuPhotoList = storeHeadPhotoList(4,storeIndex);
					view.addObject("menuPhotoList",menuPhotoList);
				}
				else if(menuType==2)  // 직접 입력함.
				{
					ArrayList<MenuInfo> menuInfoList = storeMenuInfoList(storeIndex);
					ArrayList<String> menuTitleList = new ArrayList<String>();
					for(int i = 0; i<menuInfoList.size();i++)
					{
						if(!menuTitleList.contains(menuInfoList.get(i).getMenuTitle()))
						{
							menuTitleList.add(menuInfoList.get(i).getMenuTitle());
						}
					}
					if(menuInfoList.size()>0)view.addObject("firstMenutitle", menuTitleList.get(0));
					view.addObject("menuTitleGroup", menuTitleList );
					view.addObject("menuInfoList",menuInfoList);
				}
				view.addObject("menuInfoData", storeMenuData);
				tapOrder = 3;
			}else if(storeTapType.equals("지도")) {
				tapOrder = 4;
			}
			
			view.addObject("storeTapType", tapOrder);
			view.setViewName("ynmOwner/storeManagePage");
		}else {
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/storeHeadPhotoDelete.do")
	public String storeHeadPhotoDelete(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("owner")!=null) {
			OwnerUploadPhoto paramVo = new OwnerUploadPhoto();
			paramVo.setOwStorePhotoPk(Integer.parseInt(request.getParameter("photoIndex")));
			paramVo.setPhotoRoute(request.getParameter("photoRoute"));
			paramVo.setRemakeName(request.getParameter("photoRemakeName"));
			paramVo.setStoreDetailPk(Integer.parseInt(request.getParameter("detailPk")));
			int result = ynmOwnerServiceImpl.storeHeadPhotoDelete(paramVo);
			if(result>0)
			{
				String [] headPhotoArr = request.getParameter("headPhotoList").split(",");
				String updateHeadPhotoArr = "";
				for(int i = 0; i<headPhotoArr.length;i++)
				{
					if(!headPhotoArr[i].equals(request.getParameter("photoIndex"))) {
						updateHeadPhotoArr += headPhotoArr[i];
						if(i<headPhotoArr.length-1) updateHeadPhotoArr +=",";
					}
				}
				paramVo.setHeadStoreList(updateHeadPhotoArr);
				File file = new File(paramVo.getPhotoRoute() +"/" + paramVo.getRemakeName());
				if(file.exists())
				{
					file.delete();
					return "delSuccess";
				}else {
					return "delFail";
				}
			}
			else {
				return "dbDelFail";
			}
		}else
		{
			
		}
		return null;
	}
	
	@RequestMapping("/storeHeadPhotoUpload.do")
	public ModelAndView storeHeadPhotoUpload(MultipartHttpServletRequest mainImgFile, HttpSession session,  HttpServletRequest request)
	{
		List<MultipartFile> files = mainImgFile.getFiles("mainImgFile");
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			if(files.size()>0) {
				String uploadPhotoImg = "";
				int tapOrder  = 1;
				int storeInfoIndex = currentSelectStoreIndex(session);//request.getParameter("storeIndex"));
				String storeTapType = request.getParameter("storeTapType");
				String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeHeadPhoto\\headPhoto_");
				String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeHeadPhoto\\");
				for (int i = 0; i < files.size(); i++) 
				{
					String originName= files.get(i).getOriginalFilename();
					String remakeName= System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
					File f=new File(photoRoute + remakeName);
					//해당 디렉토리의 존재여부를 확인
					if(!f.exists()){
						//없다면 생성
						f.mkdirs(); 
					}
					try {
						files.get(i).transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
					uploadPhoto.setOwPhotoTypeFk(3);
					uploadPhoto.setStoreInfoFk(storeInfoIndex);
					uploadPhoto.setOriginName(originName);
					uploadPhoto.setRemakeName("headPhoto_" + remakeName);
					uploadPhoto.setPhotoRoute(photoSaveRoute);
					
					int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
					if(photoUpload>0) {
						int photoIndex =ynmOwnerServiceImpl.photoSelectWithName("headPhoto_" +remakeName);
						if(i<files.size()-1) uploadPhotoImg+=photoIndex+",";
						else uploadPhotoImg+=photoIndex;
					}else {
						System.out.println("이미지 업로드 실패");
						break;
					}
//					view = storePageTypeLoad(session, request);
					view = storeManageEnrollList(session, request);
					view.addObject("headPhotoList", storeHeadPhotoList(3,storeInfoIndex));
					view.addObject("storeTapType", tapOrder);
				}
			}
		}else {
			view.setViewName("ynmOwner/notLoginError");
		}
		return view;
	}
	
	@Override
	public ArrayList<OwnerUploadPhoto> storeHeadPhotoList(int photoType,int storeInfoIndex)
	{
		OwnerUploadPhoto paramVo = new OwnerUploadPhoto();
		paramVo.setOwPhotoTypeFk(photoType);
		paramVo.setStoreInfoFk(storeInfoIndex);
		ArrayList<OwnerUploadPhoto> photoList = ynmOwnerServiceImpl.headPhotoList(paramVo);
		return photoList;
	}
	
	@Override
	public ArrayList<MenuInfo> storeMenuInfoList(int storeIndex)
	{
		ArrayList<MenuInfo> menuList = ynmOwnerServiceImpl.storeMenuInfoList(storeIndex);		
		return menuList;
	}
	
	
	@Override
	@ResponseBody
	@RequestMapping("/menuTextNewAdd.do")
	public JSONObject menuTextNewAdd(HttpSession session,  HttpServletRequest request)
	{
		JSONObject obj = new JSONObject();
		if(session.getAttribute("owner")!=null)
		{
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			String menuCate = request.getParameter("menuCate");
			String menu = request.getParameter("menu");
			String menuPrice = request.getParameter("menuPrice");
			String menuExplain = request.getParameter("menuExplain");
			int storeIndex = currentSelectStoreIndex(session);//request.getParameter("storeIndex"));
			
			StoreMenuData storeMenuData = ynmOwnerServiceImpl.storeMenuData(storeIndex); 
			String menuInfoList = storeMenuData.getMenuInfoList();
			MenuInfo menuInfo = new MenuInfo();
			String menuId = System.currentTimeMillis()+"_"+owner.getOwEntirePk()+"_"+menu;
			
			menuInfo.setOwStoreInfoFk(storeIndex);
			menuInfo.setMenuId(menuId);
			menuInfo.setMenuTitle(menuCate);
			menuInfo.setSubTitle(menu);
			menuInfo.setExplain(menuExplain);
			menuInfo.setMenuCost(Integer.parseInt(menuPrice));
			
			int menuResult = ynmOwnerServiceImpl.ownerMenuUpload(menuInfo);
			
			if(menuResult>0)
			{
				int menuIndex =  ynmOwnerServiceImpl.selectMenuWithId(menuId);
				if(menuIndex>0) {
					menuInfoList+=menuIndex;
		
					obj.put("result", "success");
					obj.put("storeIndex", storeIndex);
					obj.put("menuId", menuId);
					obj.put("menuCate", menuCate);
					obj.put("menuTitle", menu);
					obj.put("menuExplain", menuExplain);
					obj.put("menuCost", menuPrice);
					return obj;
				}else {
					obj.put("result", "menuIndexGetFail");
					return obj;
				}
			}
			else
			{
				obj.put("result", "insertFail");
				return obj;
			}
				
		}
		else {
			obj.put("result", "ownerNoneFail");
			return obj;
		}
	}
	
	@ResponseBody
	@RequestMapping("/textMenuUpdate.do")
	public String textMenuUpdate(HttpSession session, HttpServletRequest request)
	{
		int menuIndex = Integer.parseInt(request.getParameter("menuIndex"));
		String menuSubTitle = request.getParameter("menuSubTitle");
		String menuExplain  = request.getParameter("menuExplain");
		int menuCost = Integer.parseInt(request.getParameter("menuCost"));
		
		MenuInfo menuInfo = new MenuInfo();
		menuInfo.setOwMenuInfoPk(menuIndex);
		menuInfo.setSubTitle(menuSubTitle);
		menuInfo.setExplain(menuExplain);
		menuInfo.setMenuCost(menuCost);
		
		int menuUpdate = ynmOwnerServiceImpl.textMenuUpdate(menuInfo);
		
		return menuUpdate + "";
	}
	

	@RequestMapping("/storeMenuPhotoUpload.do")
	public ModelAndView storeMenuPhotoUpload(MultipartHttpServletRequest menuImageFile, HttpSession session,  HttpServletRequest request)
	{
		List<MultipartFile> files = menuImageFile.getFiles("menuImageFile");
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			if(files.size()>0) {
				int tapOrder  = 3;
				int storeInfoIndex = currentSelectStoreIndex(session);//request.getParameter("storeIndex"));
				String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\menuP_");
				String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\");
				StoreMenuData storeMenuData = new StoreMenuData();
				storeMenuData.setMenuType(1);
				for(int i = 0; i<files.size();i++)
				{
					String originName= files.get(i).getOriginalFilename();
					String remakeName= System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
					File f=new File(photoRoute + remakeName);
					//해당 디렉토리의 존재여부를 확인
					if(!f.exists()){
						//없다면 생성
						f.mkdirs(); 
					}
					try {
						files.get(i).transferTo(f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
					uploadPhoto.setOwPhotoTypeFk(4);
					uploadPhoto.setStoreInfoFk(storeInfoIndex);
					uploadPhoto.setOriginName(originName);
					uploadPhoto.setRemakeName("menuP_" + remakeName);
					uploadPhoto.setPhotoRoute(photoSaveRoute);
					
		
					int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
					if(photoUpload>0) {
							
					}else {
						System.out.println("이미지 업로드 실패");
					}
				}
				view = storeManageEnrollList(session, request);
				view.addObject("menuInfoData", storeMenuData);
				view.addObject("menuPhotoList", storeHeadPhotoList(4,storeInfoIndex));
				view.addObject("storeTapType", tapOrder);
				view.setViewName("ynmOwner/storeManagePage");
			}
		}else {
			view.setViewName("ynmOwner/notLoginError");
		}
		return view;
	}

	@ResponseBody
	@RequestMapping("/textMenuDelete.do")
	public String menuTextDelete(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("owner")!=null)
		{
			int menuIndex = currentSelectStoreIndex(session);
			
			int deleteResult  = ynmOwnerServiceImpl.menuTextDelete(menuIndex);
			if(deleteResult>0)
			{
				return "success";
			}
			else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("/bookListInStore.do")
	public JSONArray bookListLoadWithStoreIndex(HttpSession session,  HttpServletRequest request)
	{
		JSONArray objArr = new JSONArray();
		if(session.getAttribute("owner")!=null) {
			BookSearchVo bookSearch = new BookSearchVo();
			bookSearch.setStoreIndex(currentSelectStoreIndex(session));//request.getParameter("storeIndex")));
			bookSearch.setBookYear(Integer.parseInt(request.getParameter("currentYear")));
			bookSearch.setBookMonth(Integer.parseInt(request.getParameter("currentMonth")));
			bookSearch.setBookType(request.getParameter("bookType").charAt(0));
			ArrayList<YNMBook> bookList = ynmOwnerServiceImpl.bookListLoadWidthStoreIndex(bookSearch);
			for(int i = 0; i<bookList.size();i++)
			{
				YNMBook book = bookList.get(i);
				JSONObject obj = new JSONObject();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
				try {
					java.util.Date utilDate = sdf.parse(book.getBookDateAndTime2());
					Calendar calendar = GregorianCalendar.getInstance(); 
					calendar.setTime(utilDate);  
					calendar.get(Calendar.HOUR);        
					calendar.get(Calendar.MONTH);   
					obj.put("id", book.getBookNo());
					obj.put("myOrder", (i+1));
					obj.put("title" ,book.getBookName()+"님의 예약" + "-" +book.getBookNo() + "-" + book.getBookOption());
					obj.put("start", book.getBookDateAndTime2());
					obj.put("year", calendar.get(Calendar.YEAR));
					obj.put("month", calendar.get(Calendar.MONTH));
					obj.put("day", calendar.get(Calendar.DAY_OF_MONTH));
					obj.put("hour", calendar.get(Calendar.HOUR_OF_DAY));
					obj.put("minute", calendar.get(Calendar.MINUTE));
					obj.put("bookType", book.getBookType());
					obj.put("bookState", YNMTotalRefModel.bookState(book.getBookState()));
	//				obj.put("end",  sdf.format(book.getBookDate()));
					objArr.add(obj);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}else
		{
			
		}
		return objArr;
	}
	@ResponseBody
	@RequestMapping("/bookCancelOwner.do")
	public String cancelBookAsOwner(HttpSession session,  HttpServletRequest request)
	{
		int bookIndex = Integer.parseInt(request.getParameter("bookIndex"));
		String bookReason = request.getParameter("bookOption");
		String bookState = request.getParameter("bookState");
		YNMBook bookVo = new YNMBook();
		bookVo.setBookNo(bookIndex);
		bookVo.setBookOption(bookReason);
		bookVo.setBookState(bookState.charAt(0));
		int result = ynmOwnerServiceImpl.cancelBookAsOwner(bookVo);
		return result+"";
	}
	
	@ResponseBody
//	@RequestMapping(value="/uploadBoardPhoto.do", method=RequestMethod.POST, produces="text/plain")
	public JSONObject uploadBoardPhoto(HttpSession session, MultipartFile m_request)
	{
		JSONObject json = new JSONObject();
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\boardP_");
			String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\");
			String originName= "test0101";//m_request.getOriginalFilename();
			String remakeName=  System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
			
			File f=new File(photoRoute+remakeName);
			//해당 디렉토리의 존재여부를 확인
			if(!f.exists()){
				//없다면 생성
				f.mkdirs(); 
			}
			byte[] data;
			try {
				data = m_request.getBytes();
				FileOutputStream fos = new FileOutputStream(photoRoute + remakeName);
				fos.write(data);
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		


			
//            MultipartFile mFile = m_request.getFile(uploadFile);
//            String fileName = mFile.getOriginalFilename();
//            System.out.println("실제 파일 이름 : " +fileName);
//             
//            try {
//                mFile.transferTo(new File(photoRoute+remakeName));
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
			
			
			OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
			uploadPhoto.setOwPhotoTypeFk(5);
			uploadPhoto.setStoreInfoFk(currentSelectStoreIndex(session));
			uploadPhoto.setOriginName(originName);
			uploadPhoto.setRemakeName("boardP_" +remakeName);
			uploadPhoto.setPhotoRoute(photoSaveRoute);

			int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
			if(photoUpload>0) {
				json.put("result", "successPhoto");
			}else {
				json.put("result", "failPhotoUpload");
			}
		}
		return json;
	}

	@ResponseBody 
	@RequestMapping(value = "/uploadBoardPhoto.do", method = RequestMethod.POST)
	public JSONObject uploadFile(HttpSession session, MultipartHttpServletRequest request) 
	{ 
		JSONObject json = new JSONObject();
		
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\boardP_");
			String photoSaveRoute = servletContext.getRealPath("\\resources\\image\\owner\\"+owner.getOwId()+"\\storeMenuPhoto\\");
			
			Iterator<String> itr = request.getFileNames(); 
			if(itr.hasNext()) { 
				MultipartFile mpf = request.getFile(itr.next()); 
				String originName= mpf.getOriginalFilename();//"test0101";//m_request.getOriginalFilename();
				String remakeName=  System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
	//			System.out.println(mpf.getOriginalFilename() +" uploaded!"); 
				//just temporary save file info into ufile 
//					System.out.println("file length : " + mpf.getBytes().length); 
//					System.out.println("file name : " + mpf.getOriginalFilename()); 
				File f=new File(photoRoute+remakeName);
				//해당 디렉토리의 존재여부를 확인
				if(!f.exists()){
					//없다면 생성
					f.mkdirs(); 
				}
				try {
					mpf.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				byte[] data;
				try {
					data = mpf.getBytes();
					FileOutputStream fos = new FileOutputStream(photoRoute);// + remakeName);
					fos.write(data);
					fos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				// DB에 추가
				OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
				uploadPhoto.setOwPhotoTypeFk(5);
				uploadPhoto.setStoreInfoFk(currentSelectStoreIndex(session));
				uploadPhoto.setOriginName(originName);
				uploadPhoto.setRemakeName("boardP_" +remakeName);
				uploadPhoto.setPhotoRoute(photoSaveRoute);

				int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
				if(photoUpload>0) {
					OwnerUploadPhoto owPhotoR = ynmOwnerServiceImpl.selectOwnerPhoto(uploadPhoto);
					json.put("src", owPhotoR.getOwPhotoViewRoute());
					json.put("result", "successPhoto");
				}else {
					json.put("result", "failPhotoUpload");
				}
				
				return json; 
			}
		} else {
			return json;
		} 
		return json;
	}

	

	@RequestMapping("/boardAdd.do")
	public String ownerBoardAdd(HttpSession session,  HttpServletRequest request)
	{
		if(session.getAttribute("owner")!=null)
		{
			YNMOwner owner = new YNMOwner();
//			int ownerIndex = owner.getOwEntirePk();
			int storeIndex = currentSelectStoreIndex(session);
			String boardTitle = request.getParameter("owBoardTitle");
			String boardContent = request.getParameter("boardInfo");
			
			StoreBoardData storeBoardData = new StoreBoardData();
			storeBoardData.setOwStoreInfoFk(storeIndex);
			storeBoardData.setOwBoardTitle(boardTitle);
			storeBoardData.setOwBoardContent(boardContent);
			
			int result  = ynmOwnerServiceImpl.ownerBoardAdd(storeBoardData);
		}
		return "ynmOwner/boardManagePage";
	}
	
	// 점장 게시판 관리 페이지
	@Override
	@RequestMapping(value="/boardOwner.do")
	public ModelAndView boardMngPage(HttpSession session,  HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) 
		{
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			int currentPage = 1;
			if(request.getParameter("currentPage")==null) currentPage=1;
			else currentPage=Integer.parseInt(request.getParameter("currentPage"));
			
			int storeIndex = currentSelectStoreIndex(session);
			
			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<StoreBoardData> boardList = ynmOwnerServiceImpl.storeBoardList(currentPage,recordCountPerPage,storeIndex);
			CouponPageData pageNavi = ynmOwnerServiceImpl.storeBoardNavi(currentPage,recordCountPerPage,naviCountPerPage,storeIndex);
			
			view.addObject("boardListData", boardList);
			view.addObject("pageNaviData", pageNavi);
			view.addObject("currentBoardTap", 0);
			view.setViewName( "ynmOwner/boardManagePage");
		}
		return view;
	}
	
	// 점장 게시판 관리 페이지
	@Override
	@RequestMapping(value="/boardSelect.do")
	public ModelAndView boardSelect(HttpSession session,  HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null)
		{
			int boardIndex = Integer.parseInt(request.getParameter("boardIndex"));
			
			StoreBoardData storeBoardData = ynmOwnerServiceImpl.boardSelect(boardIndex);
			view.addObject("storeBoardData", storeBoardData);
			view.addObject("currentBoardTap", 1);// 한개만  보이는거 
			view.setViewName("ynmOwner/boardManagePage");
		}
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookCheck.do")
	public JSONArray bookCheck(HttpSession session, HttpServletRequest request)
	{
		JSONArray resultObj = new JSONArray();
		if(session.getAttribute("member")!=null)
		{
			int memberIndex = Integer.parseInt(request.getParameter("memberIndex"));
			ArrayList<Integer> bookedStoreIndex = ynmOwnerServiceImpl.bookedStoreIndex(memberIndex);
			for(int i = 0; i<bookedStoreIndex.size();i++)
			{
				ArrayList<YNMBook> bookList = ynmOwnerServiceImpl.bookCheck(bookedStoreIndex.get(i));
				
			}
			
		}
		return resultObj;
	}
}
