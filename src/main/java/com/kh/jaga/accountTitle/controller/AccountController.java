package com.kh.jaga.accountTitle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.jaga.accountTitle.model.service.AccountService;
import com.kh.jaga.accountTitle.model.vo.AccountTitle;

@Controller
@SessionAttributes("loginCompany")	

public class AccountController {

	@Autowired
	private AccountService as;
	
	@RequestMapping("accountTitle.at")
	public String selectAccountTitle(HttpServletRequest request) {
	
		List<AccountTitle> list =as.selectAccountTitle();
			request.setAttribute("list", list);
			System.out.println(list);
			return "account_title/account_title";
		}
		
}

