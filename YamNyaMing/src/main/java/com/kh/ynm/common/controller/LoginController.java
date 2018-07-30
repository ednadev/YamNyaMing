package com.kh.ynm.common.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.ynm.member.model.vo.YNMMemberNaverLogin;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
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
		YNMMemberNaverLogin ymnl=new YNMMemberNaverLogin();
        
        //JSON데이터를 넣어 JSON Object 로 만들어 준다.
        try {
        	
        	JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(apiResult);
			JSONObject responseInfoArray = (JSONObject) jsonObject.get("response");
		
			
			ymnl.setNaverId((responseInfoArray.get("id")).toString());
			ymnl.setNaverNickName((responseInfoArray.get("nickname")).toString());
            ymnl.setNaverImage((responseInfoArray.get("profile_image")).toString());
            ymnl.setAge((responseInfoArray.get("age")).toString());
			ymnl.setGender((responseInfoArray.get("gender")).toString());
			ymnl.setEmail((responseInfoArray.get("email")).toString());
			ymnl.setName((responseInfoArray.get("name")).toString());
			ymnl.setBirthday((responseInfoArray.get("birthday")).toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		session.setAttribute("naver", ymnl);

        /* 네이버 로그인 성공 페이지 View 호출 */
		return "ynmMember/naverSuccess";
	}

	
	
	
}
