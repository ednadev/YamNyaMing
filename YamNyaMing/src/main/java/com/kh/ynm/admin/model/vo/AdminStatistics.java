package com.kh.ynm.admin.model.vo;


public class AdminStatistics {
	private String today;
	private String yesterday;
	private String threeday;
	private String fourday;
	private String fiveday;
	private String sixday;
	private String sevenday;
	private int boy;
	private int girl;
	private int age1020;
	private int age2030;
	private int age3040;
	private int age4050;
	private int age5060;
	private int age60;
	private int time0910;
	private int time1112;
	private int time1314;
	private int time1516;
	private int time1718;
	private int time1924;
	private int korea;
	private int china;
	private int japan;
	private int usa;
	private int dessert;
	private int ownerall;
	private int memberall;
	private int todaynewowner;
	private int todaynewmember;
	private int yesterdaynewowner;
	private int yesternewmember;
	private int threedaynewowner;
	private int threedaynewmember;
	private int fourdaynewowner;
	private int fourdaynewmember;
	private int fivedaynewowner;
	private int fivedaynewmember;
	private int sixdaynewowner;
	private int sixdaynewmember;
	private int sevendaynewowner;
	private int sevendaynewmember;
	private int member7day;
	private int member15day;
	private int member30day;
	private int owner7day;
	private int owner15day;
	private int owner30day;
	private int deletememtoday;
	private int deleteowtoday;
	private int deleteyestermemday;
	private int deleteowyestermemday;
	private int deletememthreeday;
	private int deleteowthreeday;
	private int deletememfourday;
	private int deleteowfourday;
	private int deletememfiveday;
	private int deleteowfiveday;
	private int deletememsixday;
	private int deleteowsixday;
	private int deletememsevenday;
	private int deleteowsevenday;
	private int deletemem7day;
	private int deleteow7day;
	private int deletemem15day;
	private int deleteow15day;
	private int deletemem30day;
	private int deleteow30day;
	public AdminStatistics(String today, String yesterday, String threeday, String fourday, String fiveday,
			String sixday, String sevenday, int boy, int girl, int age1020, int age2030, int age3040, int age4050,
			int age5060, int age60, int time0910, int time1112, int time1314, int time1516, int time1718, int time1924,
			int korea, int china, int japan, int usa, int dessert, int ownerall, int memberall, int todaynewowner,
			int todaynewmember, int yesterdaynewowner, int yesternewmember, int threedaynewowner, int threedaynewmember,
			int fourdaynewowner, int fourdaynewmember, int fivedaynewowner, int fivedaynewmember, int sixdaynewowner,
			int sixdaynewmember, int sevendaynewowner, int sevendaynewmember, int member7day, int member15day,
			int member30day, int owner7day, int owner15day, int owner30day, int deletememtoday, int deleteowtoday,
			int deleteyestermemday, int deleteowyestermemday, int deletememthreeday, int deleteowthreeday,
			int deletememfourday, int deleteowfourday, int deletememfiveday, int deleteowfiveday, int deletememsixday,
			int deleteowsixday, int deletememsevenday, int deleteowsevenday, int deletemem7day, int deleteow7day,
			int deletemem15day, int deleteow15day, int deletemem30day, int deleteow30day) {
		super();
		this.today = today;
		this.yesterday = yesterday;
		this.threeday = threeday;
		this.fourday = fourday;
		this.fiveday = fiveday;
		this.sixday = sixday;
		this.sevenday = sevenday;
		this.boy = boy;
		this.girl = girl;
		this.age1020 = age1020;
		this.age2030 = age2030;
		this.age3040 = age3040;
		this.age4050 = age4050;
		this.age5060 = age5060;
		this.age60 = age60;
		this.time0910 = time0910;
		this.time1112 = time1112;
		this.time1314 = time1314;
		this.time1516 = time1516;
		this.time1718 = time1718;
		this.time1924 = time1924;
		this.korea = korea;
		this.china = china;
		this.japan = japan;
		this.usa = usa;
		this.dessert = dessert;
		this.ownerall = ownerall;
		this.memberall = memberall;
		this.todaynewowner = todaynewowner;
		this.todaynewmember = todaynewmember;
		this.yesterdaynewowner = yesterdaynewowner;
		this.yesternewmember = yesternewmember;
		this.threedaynewowner = threedaynewowner;
		this.threedaynewmember = threedaynewmember;
		this.fourdaynewowner = fourdaynewowner;
		this.fourdaynewmember = fourdaynewmember;
		this.fivedaynewowner = fivedaynewowner;
		this.fivedaynewmember = fivedaynewmember;
		this.sixdaynewowner = sixdaynewowner;
		this.sixdaynewmember = sixdaynewmember;
		this.sevendaynewowner = sevendaynewowner;
		this.sevendaynewmember = sevendaynewmember;
		this.member7day = member7day;
		this.member15day = member15day;
		this.member30day = member30day;
		this.owner7day = owner7day;
		this.owner15day = owner15day;
		this.owner30day = owner30day;
		this.deletememtoday = deletememtoday;
		this.deleteowtoday = deleteowtoday;
		this.deleteyestermemday = deleteyestermemday;
		this.deleteowyestermemday = deleteowyestermemday;
		this.deletememthreeday = deletememthreeday;
		this.deleteowthreeday = deleteowthreeday;
		this.deletememfourday = deletememfourday;
		this.deleteowfourday = deleteowfourday;
		this.deletememfiveday = deletememfiveday;
		this.deleteowfiveday = deleteowfiveday;
		this.deletememsixday = deletememsixday;
		this.deleteowsixday = deleteowsixday;
		this.deletememsevenday = deletememsevenday;
		this.deleteowsevenday = deleteowsevenday;
		this.deletemem7day = deletemem7day;
		this.deleteow7day = deleteow7day;
		this.deletemem15day = deletemem15day;
		this.deleteow15day = deleteow15day;
		this.deletemem30day = deletemem30day;
		this.deleteow30day = deleteow30day;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getYesterday() {
		return yesterday;
	}
	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}
	public String getThreeday() {
		return threeday;
	}
	public void setThreeday(String threeday) {
		this.threeday = threeday;
	}
	public String getFourday() {
		return fourday;
	}
	public void setFourday(String fourday) {
		this.fourday = fourday;
	}
	public String getFiveday() {
		return fiveday;
	}
	public void setFiveday(String fiveday) {
		this.fiveday = fiveday;
	}
	public String getSixday() {
		return sixday;
	}
	public void setSixday(String sixday) {
		this.sixday = sixday;
	}
	public String getSevenday() {
		return sevenday;
	}
	public void setSevenday(String sevenday) {
		this.sevenday = sevenday;
	}
	public int getBoy() {
		return boy;
	}
	public void setBoy(int boy) {
		this.boy = boy;
	}
	public int getGirl() {
		return girl;
	}
	public void setGirl(int girl) {
		this.girl = girl;
	}
	public int getAge1020() {
		return age1020;
	}
	public void setAge1020(int age1020) {
		this.age1020 = age1020;
	}
	public int getAge2030() {
		return age2030;
	}
	public void setAge2030(int age2030) {
		this.age2030 = age2030;
	}
	public int getAge3040() {
		return age3040;
	}
	public void setAge3040(int age3040) {
		this.age3040 = age3040;
	}
	public int getAge4050() {
		return age4050;
	}
	public void setAge4050(int age4050) {
		this.age4050 = age4050;
	}
	public int getAge5060() {
		return age5060;
	}
	public void setAge5060(int age5060) {
		this.age5060 = age5060;
	}
	public int getAge60() {
		return age60;
	}
	public void setAge60(int age60) {
		this.age60 = age60;
	}
	public int getTime0910() {
		return time0910;
	}
	public void setTime0910(int time0910) {
		this.time0910 = time0910;
	}
	public int getTime1112() {
		return time1112;
	}
	public void setTime1112(int time1112) {
		this.time1112 = time1112;
	}
	public int getTime1314() {
		return time1314;
	}
	public void setTime1314(int time1314) {
		this.time1314 = time1314;
	}
	public int getTime1516() {
		return time1516;
	}
	public void setTime1516(int time1516) {
		this.time1516 = time1516;
	}
	public int getTime1718() {
		return time1718;
	}
	public void setTime1718(int time1718) {
		this.time1718 = time1718;
	}
	public int getTime1924() {
		return time1924;
	}
	public void setTime1924(int time1924) {
		this.time1924 = time1924;
	}
	public int getKorea() {
		return korea;
	}
	public void setKorea(int korea) {
		this.korea = korea;
	}
	public int getChina() {
		return china;
	}
	public void setChina(int china) {
		this.china = china;
	}
	public int getJapan() {
		return japan;
	}
	public void setJapan(int japan) {
		this.japan = japan;
	}
	public int getUsa() {
		return usa;
	}
	public void setUsa(int usa) {
		this.usa = usa;
	}
	public int getDessert() {
		return dessert;
	}
	public void setDessert(int dessert) {
		this.dessert = dessert;
	}
	public int getOwnerall() {
		return ownerall;
	}
	public void setOwnerall(int ownerall) {
		this.ownerall = ownerall;
	}
	public int getMemberall() {
		return memberall;
	}
	public void setMemberall(int memberall) {
		this.memberall = memberall;
	}
	public int getTodaynewowner() {
		return todaynewowner;
	}
	public void setTodaynewowner(int todaynewowner) {
		this.todaynewowner = todaynewowner;
	}
	public int getTodaynewmember() {
		return todaynewmember;
	}
	public void setTodaynewmember(int todaynewmember) {
		this.todaynewmember = todaynewmember;
	}
	public int getYesterdaynewowner() {
		return yesterdaynewowner;
	}
	public void setYesterdaynewowner(int yesterdaynewowner) {
		this.yesterdaynewowner = yesterdaynewowner;
	}
	public int getYesternewmember() {
		return yesternewmember;
	}
	public void setYesternewmember(int yesternewmember) {
		this.yesternewmember = yesternewmember;
	}
	public int getThreedaynewowner() {
		return threedaynewowner;
	}
	public void setThreedaynewowner(int threedaynewowner) {
		this.threedaynewowner = threedaynewowner;
	}
	public int getThreedaynewmember() {
		return threedaynewmember;
	}
	public void setThreedaynewmember(int threedaynewmember) {
		this.threedaynewmember = threedaynewmember;
	}
	public int getFourdaynewowner() {
		return fourdaynewowner;
	}
	public void setFourdaynewowner(int fourdaynewowner) {
		this.fourdaynewowner = fourdaynewowner;
	}
	public int getFourdaynewmember() {
		return fourdaynewmember;
	}
	public void setFourdaynewmember(int fourdaynewmember) {
		this.fourdaynewmember = fourdaynewmember;
	}
	public int getFivedaynewowner() {
		return fivedaynewowner;
	}
	public void setFivedaynewowner(int fivedaynewowner) {
		this.fivedaynewowner = fivedaynewowner;
	}
	public int getFivedaynewmember() {
		return fivedaynewmember;
	}
	public void setFivedaynewmember(int fivedaynewmember) {
		this.fivedaynewmember = fivedaynewmember;
	}
	public int getSixdaynewowner() {
		return sixdaynewowner;
	}
	public void setSixdaynewowner(int sixdaynewowner) {
		this.sixdaynewowner = sixdaynewowner;
	}
	public int getSixdaynewmember() {
		return sixdaynewmember;
	}
	public void setSixdaynewmember(int sixdaynewmember) {
		this.sixdaynewmember = sixdaynewmember;
	}
	public int getSevendaynewowner() {
		return sevendaynewowner;
	}
	public void setSevendaynewowner(int sevendaynewowner) {
		this.sevendaynewowner = sevendaynewowner;
	}
	public int getSevendaynewmember() {
		return sevendaynewmember;
	}
	public void setSevendaynewmember(int sevendaynewmember) {
		this.sevendaynewmember = sevendaynewmember;
	}
	public int getMember7day() {
		return member7day;
	}
	public void setMember7day(int member7day) {
		this.member7day = member7day;
	}
	public int getMember15day() {
		return member15day;
	}
	public void setMember15day(int member15day) {
		this.member15day = member15day;
	}
	public int getMember30day() {
		return member30day;
	}
	public void setMember30day(int member30day) {
		this.member30day = member30day;
	}
	public int getOwner7day() {
		return owner7day;
	}
	public void setOwner7day(int owner7day) {
		this.owner7day = owner7day;
	}
	public int getOwner15day() {
		return owner15day;
	}
	public void setOwner15day(int owner15day) {
		this.owner15day = owner15day;
	}
	public int getOwner30day() {
		return owner30day;
	}
	public void setOwner30day(int owner30day) {
		this.owner30day = owner30day;
	}
	public int getDeletememtoday() {
		return deletememtoday;
	}
	public void setDeletememtoday(int deletememtoday) {
		this.deletememtoday = deletememtoday;
	}
	public int getDeleteowtoday() {
		return deleteowtoday;
	}
	public void setDeleteowtoday(int deleteowtoday) {
		this.deleteowtoday = deleteowtoday;
	}
	public int getDeleteyestermemday() {
		return deleteyestermemday;
	}
	public void setDeleteyestermemday(int deleteyestermemday) {
		this.deleteyestermemday = deleteyestermemday;
	}
	public int getDeleteowyestermemday() {
		return deleteowyestermemday;
	}
	public void setDeleteowyestermemday(int deleteowyestermemday) {
		this.deleteowyestermemday = deleteowyestermemday;
	}
	public int getDeletememthreeday() {
		return deletememthreeday;
	}
	public void setDeletememthreeday(int deletememthreeday) {
		this.deletememthreeday = deletememthreeday;
	}
	public int getDeleteowthreeday() {
		return deleteowthreeday;
	}
	public void setDeleteowthreeday(int deleteowthreeday) {
		this.deleteowthreeday = deleteowthreeday;
	}
	public int getDeletememfourday() {
		return deletememfourday;
	}
	public void setDeletememfourday(int deletememfourday) {
		this.deletememfourday = deletememfourday;
	}
	public int getDeleteowfourday() {
		return deleteowfourday;
	}
	public void setDeleteowfourday(int deleteowfourday) {
		this.deleteowfourday = deleteowfourday;
	}
	public int getDeletememfiveday() {
		return deletememfiveday;
	}
	public void setDeletememfiveday(int deletememfiveday) {
		this.deletememfiveday = deletememfiveday;
	}
	public int getDeleteowfiveday() {
		return deleteowfiveday;
	}
	public void setDeleteowfiveday(int deleteowfiveday) {
		this.deleteowfiveday = deleteowfiveday;
	}
	public int getDeletememsixday() {
		return deletememsixday;
	}
	public void setDeletememsixday(int deletememsixday) {
		this.deletememsixday = deletememsixday;
	}
	public int getDeleteowsixday() {
		return deleteowsixday;
	}
	public void setDeleteowsixday(int deleteowsixday) {
		this.deleteowsixday = deleteowsixday;
	}
	public int getDeletememsevenday() {
		return deletememsevenday;
	}
	public void setDeletememsevenday(int deletememsevenday) {
		this.deletememsevenday = deletememsevenday;
	}
	public int getDeleteowsevenday() {
		return deleteowsevenday;
	}
	public void setDeleteowsevenday(int deleteowsevenday) {
		this.deleteowsevenday = deleteowsevenday;
	}
	public int getDeletemem7day() {
		return deletemem7day;
	}
	public void setDeletemem7day(int deletemem7day) {
		this.deletemem7day = deletemem7day;
	}
	public int getDeleteow7day() {
		return deleteow7day;
	}
	public void setDeleteow7day(int deleteow7day) {
		this.deleteow7day = deleteow7day;
	}
	public int getDeletemem15day() {
		return deletemem15day;
	}
	public void setDeletemem15day(int deletemem15day) {
		this.deletemem15day = deletemem15day;
	}
	public int getDeleteow15day() {
		return deleteow15day;
	}
	public void setDeleteow15day(int deleteow15day) {
		this.deleteow15day = deleteow15day;
	}
	public int getDeletemem30day() {
		return deletemem30day;
	}
	public void setDeletemem30day(int deletemem30day) {
		this.deletemem30day = deletemem30day;
	}
	public int getDeleteow30day() {
		return deleteow30day;
	}
	public void setDeleteow30day(int deleteow30day) {
		this.deleteow30day = deleteow30day;
	}

	

}
