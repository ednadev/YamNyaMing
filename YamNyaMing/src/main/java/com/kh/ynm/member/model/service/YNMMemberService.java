package com.kh.ynm.member.model.service;

import com.kh.ynm.member.model.vo.YNMAdmin;

public interface YNMMemberService {
	public int enrollAdmin(YNMAdmin vo);
	public int adminIdCheck(String id);
}
