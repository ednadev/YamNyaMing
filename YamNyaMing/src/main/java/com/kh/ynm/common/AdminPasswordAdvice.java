package com.kh.ynm.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.kh.ynm.admin.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMemberCheck;

@Service
@Aspect
public class AdminPasswordAdvice{
	@Pointcut("execution (* com.kh.ynm.admin.model.service.*ServiceImpl.enrollAdmin(..))")
	public void encrytionPass() {}
	
	@Pointcut("execution(* com.kh.ynm.admin.model.service.*ServiceImpl.adminLogin(..))")
	public void login() {}
	
	
	@Before("encrytionPass()")
	public void passwordEncrytion(JoinPoint jp)throws Exception{
		YNMAdmin vo = (YNMAdmin)(jp.getArgs()[0]);
		String userPw = vo.getAd_password();//유저비밀번호
		String encryPw = SHA256Util.encryData(userPw);
		vo.setAd_password(encryPw);
		System.out.println("비번 암호화 완료 ^^ ");
		System.out.println("암호화 전 : "+userPw);
		System.out.println("암호화 후 : "+encryPw);
	}
	@Before("login()")
	public void login(JoinPoint jp)throws Exception{
		YNMAdmin vo = (YNMAdmin)(jp.getArgs()[0]);
		String userPw = vo.getAd_password();//유저비밀번호
		String encryPw = SHA256Util.encryData(userPw);
		vo.setAd_password(encryPw);
		System.out.println("비번 암호화 완료 ^^ ");
		System.out.println("암호화 전 : "+userPw);
		System.out.println("암호화 후 : "+encryPw);
	}

}