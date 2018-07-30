package com.kh.ynm.owner.model.vo;

public class StoreTitleData {
	private int owStoreInfoPk;
	private int owEntireFk;
	private String owStoreName;
	private String owStoreTip;
	private String owPhotoRoute;
	private String owRemakeName;
	private String owPhotoViewRoute;
	private float storeStarPoint;
	
	public StoreTitleData() {}

	
	
	public float getStoreStarPoint() {
		return storeStarPoint;
	}



	public void setStoreStarPoint(float storeStarPoint) {
		this.storeStarPoint = storeStarPoint;
	}



	public int getOwStoreInfoPk() {
		return owStoreInfoPk;
	}

	public void setOwStoreInfoPk(int owStoreInfoPk) {
		this.owStoreInfoPk = owStoreInfoPk;
	}

	public int getOwEntireFk() {
		return owEntireFk;
	}

	public void setOwEntireFk(int owEntireFk) {
		this.owEntireFk = owEntireFk;
	}

	public String getOwStoreName() {
		return owStoreName;
	}

	public void setOwStoreName(String owStoreName) {
		this.owStoreName = owStoreName;
	}

	public String getOwStoreTip() {
		return owStoreTip;
	}

	public void setOwStoreTip(String owStoreTip) {
		this.owStoreTip = owStoreTip;
	}

	public String getOwPhotoRoute() {
		return owPhotoRoute;
	}

	public void setOwPhotoRoute(String owPhotoRoute) {
		this.owPhotoRoute = owPhotoRoute;
		setOwPhotoViewRoute(this.owPhotoRoute);
	}

	public String getOwRemakeName() {
		return owRemakeName;
	}

	public void setOwRemakeName(String owRemakeName) {
		this.owRemakeName = owRemakeName;
	}


	public String getOwPhotoViewRoute() {
		return owPhotoViewRoute;
	}


	public void setOwPhotoViewRoute(String owPhotoViewRoute) {
		String[] arrTest1 = owPhotoViewRoute.split("\\\\");
		StringBuilder sb = new StringBuilder();
		boolean chk = false;
		for(int i = 0; i<arrTest1.length;i++)
		{
			if(arrTest1[i].equals("resources")) chk = true;
			if(chk) sb.append("\\"+arrTest1[i]);  
		}
		this.owPhotoViewRoute = sb.toString();
	}
	
	
	
	
	
	
}
