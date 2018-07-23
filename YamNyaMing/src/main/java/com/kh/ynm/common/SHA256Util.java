package com.kh.ynm.common;

import java.security.MessageDigest;

public class SHA256Util {
	public static String encryData(String data) throws Exception{
		// MessageDigest ��ü�� ����ؼ� SHA-256���� ��ȣȭ �� ���ֵ��� ��ü ����
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		
		// ��ȣȭ�� ����� �����͸� ����Ʈ �迭�� �ٲپ MessageDigest��ü�� �־���
		// update �޼ҵ��� �Ű������� byte �迭�� �ʿ�� ��
		mDigest.update(data.getBytes());
		
		// �ش� ������ SHA-256 ����  ��ȣȭ�� ������ Byte�� ����
		byte[] msgStr = mDigest.digest();
		
		StringBuffer sbuf = new StringBuffer();
		
		//���� ������ 16������ �ٲپ� �ֱ� ���� �˰���
		for(int i = 0; i<msgStr.length;i++)
		{
			byte tmpStrByte = msgStr[i];
			String tmpEnctext = Integer.toString((tmpStrByte & 0xff) + 0x100,16).substring(1);
			sbuf.append(tmpEnctext);
		}
		return sbuf.toString();
	}
}
