package com.kh.ynm.common;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	public File rename(File oldFile) {
		long currentTimeValue=Calendar.getInstance().getTimeInMillis();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		String currentTime=sdf.format(new Date(currentTimeValue));
		
		int randomSu=new Random().nextInt(1000000);
		
		String oldFileName=oldFile.getName();
		String ext=null;
		int dot=oldFileName.lastIndexOf(".");
		
		if(dot>-1) {
			ext=oldFileName.substring(dot);
		}
		else
		{
			ext="";
		}
			
			String newFileName=currentTime+"_"+randomSu+ext;
			
			File newFile=new File(oldFile.getParent(),newFileName);
	
		
		
		return newFile;
	
	
	}

}