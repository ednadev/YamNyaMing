package com.kh.ynm.common.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class CommonControllerImpl implements CommonController {
	private static String authReturn = "";

	@RequestMapping(value = "/emailConCheck.do", method = RequestMethod.POST)
	public String RegisterPost(RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		rttr.addFlashAttribute("authmsg" , "가입시 사용한 이메일로 인증해줌");
		String email = request.getParameter("ownerEmail");
		create(email);
		return "confirm";
	}

	@Override
	public String emailChk(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Inject
	private JavaMailSender mailSender;


	@Transactional
	public void create(String email) throws Exception {
		String key = new TempKey().getKey(50, false); // 인증키 생성
		authReturn = key;
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[ALMOM 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append(
						"<a href='http://localhost/user/emailConfirm?user_email=").append(mailSender).
						append("&key=").append(key).append("'target='_blenk'>이메일 인증 확인(이 링크를 클릭하면 회원가입이 완료됩니다.)</a>").toString());
		sendMail.setFrom("ynmmanager@gmail.com","[얌냐밍 회원가입]");
		sendMail.setTo(email);
		sendMail.send();
	}


}
