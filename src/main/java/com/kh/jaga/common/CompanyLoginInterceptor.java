package com.kh.jaga.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CompanyLoginInterceptor extends HandlerInterceptorAdapter {

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//
//		System.out.println("인터셉터 진입");
//		
//		return false;
//		//return super.preHandle(request, response, handler);
//	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws IOException {
		
		System.out.println("인터셉터 진입");
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			Object obj = session.getAttribute("loginCompany");
			if(obj != null)
				return true;
		}
		
		response.sendRedirect(request.getContextPath() + "/");
		return false;
		
		
	}
}
