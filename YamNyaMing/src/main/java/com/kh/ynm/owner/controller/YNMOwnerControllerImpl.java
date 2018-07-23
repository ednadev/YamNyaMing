package com.kh.ynm.owner.controller;

import java.io.File;
import java.io.IOException;
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
import com.kh.ynm.owner.model.vo.MenuInfo;
import com.kh.ynm.owner.model.vo.OwnerUploadPhoto;
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
	public String addStore(@RequestParam("mainImgFile") MultipartHttpServletRequest mainImgFile,@RequestParam("menuImageFile") MultipartHttpServletRequest menuImgFile, HttpSession session, HttpServletRequest request) {
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
				int storeInfoIndex = ynmOwnerServiceImpl.ynmSelectStoreIndex(request.getParameter("owStoreBizNum"));
				int menuType = Integer.parseInt(request.getParameter("storeMenuType"));
				YNMStoreDetailInfo detailInfo = new YNMStoreDetailInfo();
				detailInfo.setOwStoreInfoFk(storeInfoIndex);// 설명할 가게 인덱스
				String[] tips = request.getParameterValues("owStoreTip");
				String tip="";
				for(int i= 0; i<tips.length;i++)
				{
					if(tips[i]!=null && tips[i].length()>0) {
						tip += tips[i];
					}else {
						break;
					}
					if(i<tips.length-1) tip+=",";
				}
				// 대표 이미지 등록
				List<MultipartFile> files = mainImgFile.getFiles("mainImgFile");
				if(files.size()>0) {
					String photoRoute= servletContext.getRealPath("\\resources\\image\\owner\\")+owner.getOwId()+"\\storeHeadPhoto\\";
					File f=new File(photoRoute);
					for (int i = 0; i < files.size(); i++) 
					{
						String originName= files.get(i).getOriginalFilename();
						String remakeName= "storeHeadPhoto_" + System.currentTimeMillis()+"_"+owner.getOwId()+"_" + originName;
						String photoViewRoute=servletContext.getRealPath("\\resources\\image\\owner\\")+owner.getOwId()+"\\storeHeadPhoto\\"+remakeName;
						
						OwnerUploadPhoto uploadPhoto = new OwnerUploadPhoto();
						uploadPhoto.setOwPhotoTypeFk(3);
						uploadPhoto.setStoreInfoFk(storeInfoIndex);
						uploadPhoto.setOriginName(originName);
						uploadPhoto.setRemakeName(remakeName);
						uploadPhoto.setPhotoRoute(photoRoute);
						
						int photoUpload=ynmOwnerServiceImpl.ownerPhotoUpload(uploadPhoto);
						
						int photoIndex =ynmOwnerServiceImpl.photoSelectWithName(remakeName);
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
					}
				}
				
				
				detailInfo.setOwStoreTip(tip);
				detailInfo.setOwStoreLineComment(request.getParameter("owStoreLineComment"));
				detailInfo.setStoreBigType(1);
				detailInfo.setStoreSmallType(1);
				detailInfo.setRecommandMenu(request.getParameter("owRecommandMenu"));
				detailInfo.setStoreTableInfo(request.getParameter("owStoreTableInfo"));
				detailInfo.setBudgetInfo(request.getParameter("owBudget"));
				detailInfo.setOwSubInfo(request.getParameter("owSubInfo"));
				detailInfo.setOwDrinkListInfo(request.getParameter("owDrinkListInfo"));
				detailInfo.setOwStoreMenuTypeFk(menuType);//설명타입

				switch(menuType) {
					case 1:// 이미지 등록 정보
						
						break;
					case 2:// 메뉴 등록 정보
						String [] menuCateArr = request.getParameterValues("menuCategoryTitle");
						String [] menuArr = request.getParameterValues("owRecommandMenu");
						String [] menuPriceArr = request.getParameterValues("owRecommandMenuPrice");
						String [] menuExplainArr = request.getParameterValues("owMenuExplain");
						break;
				
				}
				detailInfo.setOwStoreCostType("ko");
			}
			 
			
			
			return "ynmOwner/storeEnrollOwner";
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
		}
		return "redirect:/";
	}
	

}
