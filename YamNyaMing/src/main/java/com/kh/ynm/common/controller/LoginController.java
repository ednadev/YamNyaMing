package com.kh.ynm.common.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberNaverLogin;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Autowired
	@Qualifier(value="ynmMemberService")
	private YNMMemberServiceImpl ynmMemberServiceImpl;
	/* NaverLoginBO */
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버 
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "ynmMember/naverlogin";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/YamNyaMing/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBo.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBo.getUserProfile(oauthToken);
	    System.out.println(apiResult);
		model.addAttribute("result", apiResult);
        //JSON데이터를 넣어 JSON Object 로 만들어 준다.
        try {
        	JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(apiResult);
			JSONObject responseInfoArray = (JSONObject) jsonObject.get("response");
        	YNMMember vo=new YNMMember();
    		vo.setMemberId("naver"+(responseInfoArray.get("id")).toString());
    		vo.setMemberPw("naverPw");
    		YNMMember ymnls=new YNMMember();
    		ymnls=ynmMemberServiceImpl.selectOneMember(vo);

        	if(ymnls!=null) {
                String viewPath=ynmMemberServiceImpl.viewPath(ymnls.getMemberUploadPhotoNo());
                ymnls.setPhotoViewRoute(viewPath);
            	session.setAttribute("member", ymnls);
        	}else {
        	YNMMember ymnl=new YNMMember();
        	ymnl.setMemberId("naver"+(responseInfoArray.get("id")).toString());
			ymnl.setMemberPw("naverPw");
			ymnl.setMemberName((responseInfoArray.get("name")).toString());
			ymnl.setMemberNickName("Naver"+(responseInfoArray.get("nickname")).toString());
			ymnl.setMemberGender((responseInfoArray.get("gender")).toString());
			ymnl.setMemberEmail("Naver"+(responseInfoArray.get("email")).toString());
			ymnl.setMemberUploadPhotoNo(1);
			ymnl.setMemberPhone("00000000000");
			
			String memberBirth="1992"+"-"+"11"+"-"+"16";
			java.sql.Date birth = java.sql.Date.valueOf(memberBirth);
			ymnl.setMemberBirth(birth);
			
//			ymnl.((responseInfoArray.get("birthday")).toString());
			
			int result=ynmMemberServiceImpl.signUpMember(ymnl);
			String viewPath=ynmMemberServiceImpl.viewPath(ymnl.getMemberUploadPhotoNo());
            ymnl.setPhotoViewRoute(viewPath);
			session.setAttribute("member", ymnl);
        	}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


        /* 네이버 로그인 성공 페이지 View 호출 */
		return "ynmMember/naverSuccess";
	}

	
	
	
}
