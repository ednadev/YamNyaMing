package com.kh.ynm.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.vo.YNMMember;

@Service
@Aspect
public class MemberPasswordAdvice {
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.signUpMember(..))")
	public void encrytionPass() {}
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.selectOneMember(..))")
	public void login() {}
	
	@Before("login()")
	public void login(JoinPoint jp)throws Exception{
		YNMMember ym=(YNMMember)(jp.getArgs()[0]);
		String userPw=ym.getMemberPw();
		String encryPw=SHA256Util.encryData(userPw);
		ym.setMemberPw(encryPw);
	}
	
	@Before("encrytionPass()")
	public void passwordEncrytion(JoinPoint jp)throws Exception{
		YNMMember ym=(YNMMember)(jp.getArgs()[0]);
		
		String userPw=ym.getMemberPw();
		String encryPw=SHA256Util.encryData(userPw);
		ym.setMemberPw(encryPw);
	}
}
