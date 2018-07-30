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
			view.setViewName("ynmOwner/storeManagePage");
		}else {
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@Override
	@RequestMapping("/storeDetailInfo.do")
	public ModelAndView storeDetailInfo(HttpSession session, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		if(session.getAttribute("owner")!=null) {
			int storeIndex = Integer.parseInt(request.getParameter("storeIndex"));
			
		}
		else
		{
			view.setViewName("ynmOwner/ynmOwnerError/notLoginError");
		}
		return view;
	}
	
	@RequestMapping("/testDetailPage.do")
	public String testDetailPage()
	{
		return "ynmMember/detailPage";
	}

}
