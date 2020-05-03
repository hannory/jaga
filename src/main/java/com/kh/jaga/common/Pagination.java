package com.kh.jaga.common;

import com.kh.jaga.companyInnerId.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		
		PageInfo pi = null;

		int limit=10;
		int buttonCount=5;
		int maxPage;
		int startPage;
		int endPage;
		String companyCode;
		
		maxPage=(int)((double) listCount/limit+0.99);
		
		startPage=(((int)((double)currentPage/buttonCount+0.9))-1)*buttonCount+1;
		endPage=startPage+buttonCount-1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		companyCode = null;
		pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage, companyCode);
		
		
		return pi;
	}
	
	
	
}//class
