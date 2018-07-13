package com.kh.ynm.member.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.ynm.member.model.dao.YNMMemberDAO;

@Service("ynmMemberService")
public class YNMMemberServiceImpl implements YNMMemberService{
	@Resource(name="ynmMemberDAO")
	private YNMMemberDAO memberDAO;
}
