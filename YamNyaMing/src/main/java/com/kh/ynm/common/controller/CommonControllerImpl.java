package com.kh.ynm.common.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class CommonControllerImpl implements CommonController {
	private static String authReturn = "";
	
	@Autowired
    private JavaMailSenderImpl javaMailSenderImpl;
	
	@Override
	public String emailChk(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/emailAccessKey.do", method = RequestMethod.POST)
	public String returnEmailKey(HttpServletRequest request, HttpSession session) {
		return authReturn;
	}
	
	@RequestMapping(value = "/emailConCheck.do", method = RequestMethod.POST)
	public String RegisterPost(RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		String email = request.getParameter("ownerEmail");
		authReturn = new TempKey().getKey(6, true);
		//HTML 메일
		htmlMail(email);
       
		return null;
	}
	public void htmlMail(String email)
	{
		 MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
	        try {
				mimeMessage.setFrom(new InternetAddress("ynmmanager@gmail.com"));
				   mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));
			        mimeMessage.setSubject("얌냐밍 회원가입 인증번호 메일");
			        mimeMessage.setText("<b>메일 내용입니다.</b><br>인증키 :"+authReturn, "UTF-8", "html");
			        javaMailSenderImpl.send(mimeMessage);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
	}
	
	public void normalEmail(String email)
	{
		   //일반 텍스트메일
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

        simpleMailMessage.setFrom("ynmmanager@gmail.com");

        simpleMailMessage.setTo(email);

        simpleMailMessage.setSubject("Simple 테스트 메일");

        simpleMailMessage.setText("메일 내용입니다.");

       

        javaMailSenderImpl.send(simpleMailMessage);


	}
}
