package com.kh.ynm.owner.model.service;

import com.kh.ynm.owner.model.vo.YNMOwner;
import com.kh.ynm.owner.model.vo.YNMStoreInfo;

public interface YNMOwnerService {
	// 회원가입
	public int ynmOwnerSignUp(YNMOwner owner);
	
	// 회원 선택(로그인, 정보 가져오기)
	public YNMOwner selectOneOwner(YNMOwner owner);
		
	// 
	public YNMOwner selectOneOwner(String ownerId);
	
	// 가게 추가
	public int ynmStoreAdd(YNMStoreInfo storeInfo);
	
	// 아이디 체크
	public YNMOwner idCheck(String ownerId);
}