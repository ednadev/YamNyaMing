package com.kh.ynm.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.vo.YNMMember;
import com.kh.ynm.member.model.vo.YNMMemberCheck;
import com.kh.ynm.owner.model.vo.YNMOwner;

@Service
@Aspect
public class MemberPasswordAdvice {
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.signUpMember(..))")
	public void encrytionPass() {}
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.selectOneMember(..))")
	public void login() {}
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.signOutMember(..))")
	public void deleteMember() {}
	
	@Pointcut("execution(* com.kh.ynm.member.model.service.*ServiceImpl.memberInfo(..))")
	public void myInfo() {}
	
	@Pointcut("execution(* com.kh.ynm.owner.model.service.*ServiceImpl.ynmOwnerSignUp(..))")
	public void ownerSignUp() {}
	
	@Pointcut("execution(* com.kh.ynm.owner.model.service.*ServiceImpl.selectOneOwner(..))")
	public void selectOneOwner() {}

	
	
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
	
	@Before("deleteMember()")
	public void deleteMember(JoinPoint jp)throws Exception{
		YNMMember ym=(YNMMember)(jp.getArgs()[0]);
		String userPw=ym.getMemberPw();
		String encryPw=SHA256Util.encryData(userPw);
		ym.setMemberPw(encryPw);
	}
	@Before("myInfo()")
	public void myInfo(JoinPoint jp)throws Exception{
		YNMMemberCheck ymc=(YNMMemberCheck)(jp.getArgs()[0]);
		String userPw=ymc.getMemberPw();
		String encryPw=SHA256Util.encryData(userPw);
		ymc.setMemberPw(encryPw);
	}
	
	@Before("ownerSignUp()")
	public void ownerSignUp(JoinPoint jp)throws Exception{
		YNMOwner yo=(YNMOwner)(jp.getArgs()[0]);
		String ownerPw=yo.getOwPw();
		String encryPw=SHA256Util.encryData(ownerPw);
		yo.setOwPw(encryPw);
	}
	
	@Before("selectOneOwner()")
	public void selectOneOwner(JoinPoint jp)throws Exception{
		YNMOwner yo=(YNMOwner)(jp.getArgs()[0]);
		String ownerPw=yo.getOwPw();
		String encryPw=SHA256Util.encryData(ownerPw);
		yo.setOwPw(encryPw);
	}
	
	
}
