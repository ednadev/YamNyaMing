package com.kh.ynm.common.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonController {
	public String emailChk(HttpServletRequest request, HttpServletResponse response)  throws IOException;
}
