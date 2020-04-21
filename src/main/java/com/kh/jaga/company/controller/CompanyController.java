package com.kh.jaga.company.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.service.CompanyService;
import com.kh.jaga.company.model.vo.Company;

@Controller
@SessionAttributes("loginCompany")
public class CompanyController {
	@Autowired
	private CompanyService cs;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//로그인
	@PostMapping("login.co")
	public String loginCheck(Company c,Model model) {

		Company loginCompany = null;

		try {

			loginCompany = cs.loginCompany(c);
			System.out.println(loginCompany+"로그인컴퍼니다");
			model.addAttribute("loginCompany",loginCompany);

			return "redirect:gomain.co";

		} catch (LoginException e) {
			model.addAttribute("msg",e.getMessage());
			
			return "common/errorPage";
		}
	}
	
	@GetMapping("gomain.co")
	public String gomain() {
		return "main/main";
	}

	@GetMapping("companyJoinView.co")
	public String showMemberJoinView() {
		return "company/companyJoin";
	}
	
	//회원가입
	@RequestMapping("insert.co")
	public String insertCompany(Model model, Company c, HttpServletRequest request, @RequestParam MultipartFile photo) {

		String root =request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root:"+root);
		String filePath = root+"\\uploadFiles";

		String originFileName = photo.getOriginalFilename();
		String ext=originFileName.substring(originFileName.lastIndexOf("."));
		String changeName =CommonsUtils.getRandomString();

		try {
			photo.transferTo(new File(filePath+"\\"+changeName+ext));
			c.setCompanyPwd(passwordEncoder.encode(c.getCompanyPwd()));
			

			cs.insertCompany(c);

			return "redirect:index.jsp";

		}catch (Exception e) {
			new File(filePath+"\\"+changeName+ext).delete();
			model.addAttribute("msg","회원가입실패!");
			e.printStackTrace();
			return "common/errorPage";
		}
	}
	
	@RequestMapping("logout.co")
	public String logout(SessionStatus status) {
		status.setComplete();
		 
		return "redirect:index.jsp";
	}
	
}
