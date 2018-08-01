package com.kh.ynm.common.controller;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsSend {
	  public static void main(String[] args) {
		    String api_key = "NCSIT9GVDRIEXWK8";
		    String api_secret = "VJQY5LQYZMIHDIVRB2VB7YXMH9KRGYAK";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", "01096120530");
		    params.put("from", "01050243705");
		    params.put("type", "SMS");
		    params.put("text", "Coolsms Testing Message!");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		  }
}
