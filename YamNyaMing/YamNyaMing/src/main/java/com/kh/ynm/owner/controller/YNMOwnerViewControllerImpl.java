package com.kh.ynm.owner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class YNMOwnerViewControllerImpl implements YNMOwnerViewController{

	@Override
	@RequestMapping(value="/ynmOwnerTest.do")
	public String ynmOwnerTest() {
		return "ynmOwner/ynmOwnerTest";
	}
}
