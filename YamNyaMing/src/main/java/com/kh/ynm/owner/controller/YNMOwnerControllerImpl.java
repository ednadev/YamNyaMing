package com.kh.ynm.owner.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberUploadPhoto;
import com.kh.ynm.owner.model.service.YNMOwnerServiceImpl;
import com.kh.ynm.owner.model.vo.CouponEnroll;
import com.kh.ynm.owner.model.vo.CouponPageData;
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
import com.kh.ynm.owner.model.vo.StoreInfoPageData;
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
			storeInfo.setOwBigTypeFk(1);
			storeInfo.setOwSmallTypeFk(1);
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
				detailInfo.setStoreBigType(1);
				detailInfo.setStoreSmallType(1);
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
		return null;
	}


	@Override
	@RequestMapping(value="/ownerSignUp.do")
	public String ynmOwnerSignUp(HttpSession session, YNMOwner owner) {
		int result = ynmOwnerServiceImpl.ynmOwnerSignUp(owner);
		return "redirect:/";
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
			couponEnroll.setOwStoreInfoFk(1);
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
			
			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<CouponEnroll> couponList = ynmOwnerServiceImpl.couponListPaging(currentPage,recordCountPerPage, owner.getOwEntirePk() , 1);
			CouponPageData pageNavi = ynmOwnerServiceImpl.couponPageNavi(currentPage,recordCountPerPage,naviCountPerPage,owner.getOwEntirePk() , 1);
			view.addObject("couponListData", couponList);
			view.addObject("pageNaviData", pageNavi);
			view.setViewName("ynmOwner/couponManagePage");
		}else
		{
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
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
		System.out.println("비밀번호 확인 체크" + resultOwner!=null);
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
		}
		return view;
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
				if(request.getParameter("storeIndex")==null) {
					view.addObject("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
					StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeInfoList.get(0).getOwStoreInfoPk());
					view.addObject("storeInfoPageData", storeInfoPD);
					view.addObject("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
				}else
				{
					int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
					view.addObject("currentStoreIndex", storeIndex);
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
			int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
			StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeIndex);
			view.addObject("storeInfoPageData", storeInfoPD);
			view.addObject("currentStoreIndex", storeIndex);
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
		StoreInfoPageData storeInfoPD = new StoreInfoPageData();
		storeInfoPD.setOwStoreInfoPk(Integer.parseInt(request.getParameter("storeIndex")));
		storeInfoPD.setOwStoreName(request.getParameter("owStoreName"));
		storeInfoPD.setOwStoreTel(request.getParameter("owStoreTel"));
		storeInfoPD.setOwStoreAddr(request.getParameter("owStoreAddr"));
		storeInfoPD.setOwStoreUrl(request.getParameter("owStoreUrl"));
		storeInfoPD.setOwStoreWorkingTime(request.getParameter("owStoreWorkingTime"));
		storeInfoPD.setBudgetInfo(request.getParameter("budgetInfo"));
		storeInfoPD.setOwStoreLineComment(request.getParameter("owStoreLineComment"));
		storeInfoPD.setOwStoreTip(request.getParameter("owStoreTip"));
		storeInfoPD.setRecommandMenu(request.getParameter("recommandMenu"));
		storeInfoPD.setOwBigTypeFk(1);//Integer.parseInt(request.getParameter("owBigTypeFk")));
		storeInfoPD.setOwSmallTypeFk(1);//Integer.getParameter);
		storeInfoPD.setStoreTableInfo(request.getParameter("storeTableInfo"));
		storeInfoPD.setOwSubInfo(request.getParameter("owSubInfo"));
		storeInfoPD.setOwDrinkListInfo(request.getParameter("owDrinkListInfo"));
		ModelAndView view = new ModelAndView();
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
		return view;
	}
	
	@Override
	@RequestMapping("/storePageTypeLoad.do")
	public ModelAndView storePageTypeLoad(HttpSession session,  HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			String storeTapType = request.getParameter("storeTapType");
			int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
			int tapOrder = 0;
			
			view = storeManageEnrollList(session, request);
			if(storeTapType.equals("정보")){
				tapOrder = 0;
				view = storeDetailInfo(session,request);
			}else if(storeTapType.equals("포토")) {
				tapOrder = 1;
				view.addObject("headPhotoList", storeHeadPhotoList(storeIndex));
			}else if(storeTapType.equals("리뷰")) {
				tapOrder = 2;
			}else if(storeTapType.equals("메뉴")) {
				tapOrder = 3;
			}else if(storeTapType.equals("지도")) {
				tapOrder = 4;
			}
			
			view.addObject("currentStoreIndex",storeIndex);
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
				
				int detailInfoUpdate = ynmOwnerServiceImpl.storeDetailInfoHeadPhotoUpdate(paramVo);
				if(detailInfoUpdate>0) {
					File file = new File(paramVo.getPhotoRoute() +"/" + paramVo.getRemakeName());
					if(file.exists())
					{
						file.delete();
						return "delSuccess";
					}else {
						return "delFail";
					}
				}else {
					
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
	
	@RequestMapping("/storeHeadPhotoUpload")
	public ModelAndView storeHeadPhotoUpload(MultipartHttpServletRequest mainImgFile, HttpSession session,  HttpServletRequest request)
	{
		List<MultipartFile> files = mainImgFile.getFiles("mainImgFile");
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			YNMOwner owner = (YNMOwner)session.getAttribute("owner");
			if(files.size()>0) {
				String uploadPhotoImg = "";
				int tapOrder  = 1;
				int storeInfoIndex = Integer.parseInt(request.getParameter("storeIndex"));
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
					view = storePageTypeLoad(session, request);
					view.addObject("headPhotoList", storeHeadPhotoList(storeInfoIndex));
					view.addObject("storeTapType", tapOrder);
				}
			}
		}
		return view;
	}
	
	@Override
	public ArrayList<OwnerUploadPhoto> storeHeadPhotoList(int storeInfoIndex)
	{
		OwnerUploadPhoto paramVo = new OwnerUploadPhoto();
		paramVo.setOwPhotoTypeFk(3);
		paramVo.setStoreInfoFk(storeInfoIndex);
		ArrayList<OwnerUploadPhoto> photoList = ynmOwnerServiceImpl.headPhotoList(paramVo);
		return photoList;
	}
	
	@Override
	public ArrayList<MenuInfo> storeMenuInfoList(int storeInfoIndex)
	{
//		int menuType = ynmOwnerServiceImpl.storeMenuInfoList(storeInfoIndex); 
				
		return null;
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

			System.out.println("전체 내 데이터" +ownerIndex );
			int recordCountPerPage = 5; //1. 1페이지에10개씩보이게
			int naviCountPerPage = 5; //2.
			ArrayList<StoreTitleData> storeInfoList = ynmOwnerServiceImpl.ynmStoreInfoList(ownerIndex, currentPage,recordCountPerPage);
			StorePageData spd = ynmOwnerServiceImpl.ynmStoreNavi(currentPage,recordCountPerPage,naviCountPerPage,ownerIndex);
			view.addObject("storeTitleInfo", storeInfoList);
			view.addObject("pageNaviData",spd);
			if(storeInfoList.size()>0) {
				if(request.getParameter("storeIndex")==null) {
					view.addObject("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
					StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeInfoList.get(0).getOwStoreInfoPk());
					view.addObject("storeInfoPageData", storeInfoPD);
					view.addObject("currentStoreIndex", storeInfoList.get(0).getOwStoreInfoPk());
				}else
				{
					int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
					System.out.println("머임??");
					view.addObject("currentStoreIndex", storeIndex);
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
			int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
			StoreInfoPageData storeInfoPD = ynmOwnerServiceImpl.storeInfoPageDataGet(storeIndex);
			view.addObject("storeInfoPageData", storeInfoPD);
			view.addObject("currentStoreIndex", storeIndex);
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
		StoreInfoPageData storeInfoPD = new StoreInfoPageData();
		storeInfoPD.setOwStoreInfoPk(Integer.parseInt(request.getParameter("storeIndex")));
		storeInfoPD.setOwStoreName(request.getParameter("owStoreName"));
		storeInfoPD.setOwStoreTel(request.getParameter("owStoreTel"));
		storeInfoPD.setOwStoreAddr(request.getParameter("owStoreAddr"));
		storeInfoPD.setOwStoreUrl(request.getParameter("owStoreUrl"));
		storeInfoPD.setOwStoreWorkingTime(request.getParameter("owStoreWorkingTime"));
		storeInfoPD.setBudgetInfo(request.getParameter("budgetInfo"));
		storeInfoPD.setOwStoreLineComment(request.getParameter("owStoreLineComment"));
		storeInfoPD.setOwStoreTip(request.getParameter("owStoreTip"));
		storeInfoPD.setRecommandMenu(request.getParameter("recommandMenu"));
		storeInfoPD.setOwBigTypeFk(1);//Integer.parseInt(request.getParameter("owBigTypeFk")));
		storeInfoPD.setOwSmallTypeFk(1);//Integer.getParameter);
		storeInfoPD.setStoreTableInfo(request.getParameter("storeTableInfo"));
		storeInfoPD.setOwSubInfo(request.getParameter("owSubInfo"));
		storeInfoPD.setOwDrinkListInfo(request.getParameter("owDrinkListInfo"));
		ModelAndView view = new ModelAndView();
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
		return view;
	}
	
	@Override
	@RequestMapping("/storePageTypeLoad.do")
	public ModelAndView storePageTypeLoad(HttpSession session,  HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			String storeTapType = request.getParameter("storeTapType");
			int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
			System.out.println("현재 가게 인덱스 " + storeIndex);
			int tapOrder = 0;
			
			view = storeManageEnrollList(session, request);
			if(storeTapType.equals("정보")){
				tapOrder = 0;
				view = storeDetailInfo(session,request);
			}else if(storeTapType.equals("포토")) {
				tapOrder = 1;
				OwnerUploadPhoto paramVo = new OwnerUploadPhoto();
				paramVo.setOwPhotoTypeFk(3);
				paramVo.setStoreInfoFk(storeIndex);
				ArrayList<OwnerUploadPhoto> photoList = ynmOwnerServiceImpl.headPhotoList(paramVo);
				view.addObject("headPhotoList", photoList);
			}else if(storeTapType.equals("리뷰")) {
				tapOrder = 2;
			}else if(storeTapType.equals("메뉴")) {
				tapOrder = 3;
			}else if(storeTapType.equals("지도")) {
				tapOrder = 4;
			}
			
			view.addObject("currentStoreIndex",storeIndex);
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
				
				int detailInfoUpdate = ynmOwnerServiceImpl.storeDetailInfoHeadPhotoUpdate(paramVo);
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


}
