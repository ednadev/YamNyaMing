package com.kh.ynm.common.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
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
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ynm.common.model.service.CommonServiceImpl;
import com.kh.ynm.common.model.vo.StoreCategoryDetail;
import com.kh.ynm.common.model.vo.StoreCategoryMain;
import com.kh.ynm.common.model.vo.YNMTotalRefModel;
import com.kh.ynm.member.model.service.YNMMemberServiceImpl;
import com.kh.ynm.member.model.vo.YNMMember;


@Controller
public class CommonControllerImpl implements CommonController {
	private static String authReturn = "";
	public static boolean loginType=false;
	private String emailType="";
	@Autowired
	@Qualifier(value="ynmMemberService")
	private YNMMemberServiceImpl ynmMemberServiceImpl;
	
	@Autowired
	@Qualifier(value="commonService")
	private CommonServiceImpl commonServiceImpl;
	
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
		String email = request.getParameter("emailConfirm");
		authReturn = new TempKey().getKey(6, true);
		emailType="emailAccessKey";
		//HTML 메일
		htmlMail(email);
       
		return null;
	}
	
	@RequestMapping(value = "/idSend.do", method = RequestMethod.POST)
	public String idSend(RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		String email = request.getParameter("emailConfirm");
		String memberName=request.getParameter("memberName");
		System.out.println(email);
		System.out.println(memberName);
		YNMMember vo=new YNMMember();
		vo.setMemberEmail(email);
		vo.setMemberName(memberName);
		YNMMember ym=ynmMemberServiceImpl.idSearch(vo);
		
		authReturn = ym.getMemberId();
		
		emailType="idSend";
		//HTML 메일
		htmlMail(email);
       
		return "ynmMember/idSearch";
	}
	
	@RequestMapping(value = "/pwSend.do", method = RequestMethod.POST)
	public String pwSend(RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		String email = request.getParameter("emailConfirm");
		String memberId=request.getParameter("memberId");
		authReturn = new TempKey().getKey(6, true);
		YNMMember vo=new YNMMember();
		vo.setMemberEmail(email);
		vo.setMemberId(memberId);
		vo.setMemberPw(authReturn);
		int result=ynmMemberServiceImpl.pwUpdateMember(vo);
		loginType=true;
		
		
		emailType="pwSend";
		//HTML 메일
		htmlMail(email);
       
		return "ynmMember/pwSearch";
	}
	
	public void htmlMail(String email)
	{
		 MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
	        try {
					mimeMessage.setFrom(new InternetAddress("ynmmanager@gmail.com"));
					mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));
					
					if(emailType.equals("emailAccessKey")) {
			        mimeMessage.setSubject("얌냐밍 회원가입 인증번호 메일");
			        mimeMessage.setText("<b>메일 내용입니다.</b><br>인증키 :"+authReturn, "UTF-8", "html");
					}else if(emailType.equals("idSend")) {
					mimeMessage.setSubject("얌냐밍 회원 아이디 메일");
					mimeMessage.setText("<b>메일 내용입니다.</b><br>아이디 :"+authReturn, "UTF-8", "html");
					}else
					{
					mimeMessage.setSubject("얌냐밍 회원 비밀번호 메일");
					mimeMessage.setText("<b>메일 내용입니다.</b><br>임시 비밀번호 :"+authReturn, "UTF-8", "html");	
					}
			        
			        
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
	
	@RequestMapping("/totalRefLoad.do")
	public Object totalRefLoad(HttpSession session , HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		HashMap<String, StoreCategoryMain> cateMainMap = commonServiceImpl.storeCategoryLoad();
		HashMap<String, StoreCategoryDetail> cateDetailMap = commonServiceImpl.storeCateDetailLoad();
		
		if(cateMainMap.size()>0 && cateDetailMap.size()>0)
		{
			view.addObject("mainCate", cateMainMap);
			view.addObject("detailCate", cateDetailMap);
			view.setViewName("redirect:/");
			YNMTotalRefModel totalRefModel = new YNMTotalRefModel();
			totalRefModel.setCateMainList( cateMainMap);
			totalRefModel.setCateDetailList(cateDetailMap);
			session.setAttribute("totalRefModel", totalRefModel);
		}
		view.setViewName("redirect:/");
		return view; 
	}
	
	public String bookState(String bookState)
	{
//		switch(bookState)
//		{
//			
//		}
		return "";
	}
	
	
}
