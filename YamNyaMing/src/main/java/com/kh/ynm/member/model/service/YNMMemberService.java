package com.kh.ynm.member.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ynm.member.model.vo.YNMAdmin;
import com.kh.ynm.member.model.vo.YNMMember;

public interface YNMMemberService {
	public int enrollAdmin(YNMAdmin vo);
	public YNMAdmin adminIdCheck(YNMAdmin vo);
}
