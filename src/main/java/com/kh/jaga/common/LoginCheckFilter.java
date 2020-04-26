package com.kh.jaga.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jaga.company.model.vo.Company;

/**
 * @author 박종현
 * @comment 로그인 여부 체크를 위한 Filter
 * @createDate 04/26 12시
 */
public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		Company loginCompany = (Company) request.getSession().getAttribute("loginCompany");
		
		if(loginCompany != null) {
			chain.doFilter(req, resp);
		} else {
			request.getSession().setAttribute("msg", "로그인이 필요합니다");
			
			req.getRequestDispatcher("/WEB-INF/views/common/alertPage.jsp").forward(req, resp);
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
}











