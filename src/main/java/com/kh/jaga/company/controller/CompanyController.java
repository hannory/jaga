package com.kh.jaga.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.service.CompanyService;
import com.kh.jaga.company.model.service.DashBoardService;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.company.model.vo.TypeOfBiz;
import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;

/**
 * @author 유지연
 * @comment 유지연님.. 언제 이걸 발견하는지 기다리겠습니다 ..ㅎㅎ 여기는 회사 등록 및 로그인 페이지!
 * @createDate 2020.3월즈음
 */
@Controller
@SessionAttributes({"loginCompany","loginEmp"})
public class CompanyController {
	@Autowired
	private CompanyService cs;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	 @Autowired
	   private DashBoardService dbs;
	
	//로그인
	@PostMapping("login.lo")
	public String loginCheck(Company c,Model model, @RequestParam(required = false) String accountType, String empId, String companyPwd) {

		System.out.println("===============================");
		System.out.println(accountType);
		System.out.println(empId);
		System.out.println(companyPwd);
		System.out.println("===============================");
		
		if(accountType.equals("accountEmp")) {
			//사내계정 로그인
			
			HashMap<String, String> empData = new HashMap<String, String>();
			empData.put("id", empId);					//사내계정 아이디
			empData.put("pwd", companyPwd);				//사내계정 비번 //컴퍼니말고 사내계정 맞음
			empData.put("comId", c.getCompanyId());		//회사계정 아이디
			
			ComInIdVo loginEmp = cs.loginEmp(empData);
			
			if(passwordEncoder.matches(companyPwd, loginEmp.getPwd())) {
				//로그인 성공
				model.addAttribute("loginEmp", loginEmp);
				
				try {
					Company loginCompany = cs.loginCompany(c);
					model.addAttribute("loginCompany",loginCompany);
					
				} catch (LoginException e) {
					System.out.println("사내계정 로그인 성공,, but 회사계정 로그인 익셉션");
					e.printStackTrace();
				}

				return "redirect:gomain.co";

			}else {
				//로그인 실패
				
				try {
					throw new LoginException("사내계정 로그인 실패 !");
				} catch (LoginException e) {
					
					model.addAttribute("msg",e.getMessage());
					
					return "common/errorPage";
				}
			}
			

		}else {
			//회사계정 로그인
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
		
	}//method
	
	
	@GetMapping("gomain.co")
	   public String gomain(HttpServletRequest request, Model model) {
	      Company company = (Company)request.getSession().getAttribute("loginCompany");
	      String comCode = company.getCompanyCode();
	      
	      System.out.println(comCode);
	      
	      System.out.println("뀪?");
	      HashMap<String, Object> hm = dbs.selectDashBoard(comCode);
	      
	      model.addAttribute("profit", hm.get("profit"));
	      model.addAttribute("creditS", hm.get("creditS"));
	      model.addAttribute("creditB", hm.get("creditB"));
	      model.addAttribute("chart1", hm.get("chart1"));
	      
	      return "main/main";
	   }
	
	@GetMapping("companyJoinView.lo")
	public String showMemberJoinView() {
		return "company/companyJoin";
	}
	
	//회원가입
	@RequestMapping("insert.lo")
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
			model.addAttribute("msg"," 회원가입 실패 ! ");
			e.printStackTrace();
			return "common/errorPage";
		}
	}
	
	@RequestMapping("logout.co")
	public String logout(SessionStatus status) {
		status.setComplete();
		 
		return "redirect:index.jsp";
	}
	
	@RequestMapping("doubleCheck.lo")
	public String doubleCheckId(HttpServletRequest request, HttpServletResponse response) {
		
		String userId= request.getParameter("userId");
		
		System.out.println("유저아이디는??"+userId);
		
		int checkIdresult= cs.doubleCheckId(userId);
		
		String msg="";
		
		if(checkIdresult ==1) {
			msg=" 사용가능한 아이디입니다. ";
			
		}else {
			msg=" 중복된 아이디입니다."
					+ " 다시 입력해주세요";
		}
		
		System.out.println(checkIdresult);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(msg); 
			out.flush();
			out.close(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:index.jsp"; 
	}
	
	@RequestMapping("biztypeSearch.lo") 
	public ModelAndView biztypeSearch(ModelAndView mv, HttpServletRequest request) {
		List<TypeOfBiz> list =null;
		System.out.println("왔니");
		list=cs.selectbizTypeList();
		
		System.out.println("업종코드 출력되니1"+list);
		mv.addObject("data",list);
		mv.setViewName("jsonView");
		
		System.out.println("업종코드 출력되니"+list);
		return mv;
	}
}
