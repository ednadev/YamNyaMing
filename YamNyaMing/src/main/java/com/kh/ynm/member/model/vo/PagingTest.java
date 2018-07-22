package com.kh.ynm.member.model.vo;

public class PagingTest {
	private int storeNo;
	private int storeFk;
	private String code;
	private String name;
	   
	 private int startRow;
	  private int endRow;

	  /** 현재페이지 */
	    private int pageIndex = 1;
	     
	    /** 페이지사이즈 */
	    private int pageSize = 10; //한페이지에 나오는 게시물 개수
	     
	    private int pageGroupSize = 3; // 페이지 번호 몇개 보여줄 것인지



		public int getStartRow() {
			return startRow;
		}

		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}

		public int getEndRow() {
			return endRow;
		}

		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}

		public int getStoreNo() {
			return storeNo;
		}

		public void setStoreNo(int storeNo) {
			this.storeNo = storeNo;
		}

		public int getStoreFk() {
			return storeFk;
		}

		public void setStoreFk(int storeFk) {
			this.storeFk = storeFk;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getPageIndex() {
			return pageIndex;
		}

		public void setPageIndex(int pageIndex) {
			this.pageIndex = pageIndex;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getPageGroupSize() {
			return pageGroupSize;
		}

		public void setPageGroupSize(int pageGroupSize) {
			this.pageGroupSize = pageGroupSize;
		}

	    


}
