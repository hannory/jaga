package com.kh.jaga.employee.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.service.BusinessEmpService;
import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

@Controller
public class BusinessEmpController {
	@Autowired
	private BusinessEmpService bes;
	
	@RequestMapping("bankSearch.be")
	public ModelAndView bankSearch(ModelAndView mv) {
		List<Bank> bk = bes.selectBankList();
		
		mv.addObject("bkList", bk);
		
		return mv;
	}
	
	@RequestMapping("tobcSearch.be")
	public ModelAndView tobcSearch(ModelAndView mv) {
		List<TypeOfBizCode> bk = bes.selectTOBList();
		
		System.out.println(bk);
		
		mv.addObject("bkList", bk);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("businessEmpList.be")
	public String bEmpListAll(BusinessEmp be, Model model, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		List<BusinessEmp> list = bes.selectBEmpList(comCode);
		System.out.println(list);
		int employeeNum = 0;
		
		if(list.size() == 0) {
			 employeeNum = 10001;
		}else {
			employeeNum = Integer.parseInt(list.get(list.size()-1).getEmployeeNum()) + 1;
		}
		
		model.addAttribute("empList", list);
		model.addAttribute("employeeNum", employeeNum);
		
		return "employee/businessEmployee";
	}
	
	@RequestMapping("addBusinessEmp.be")
	public String addBusinessEmp(BusinessEmp be, Model model) {
		int result = bes.insertBEmp(be);
		
		return "redirect:businessEmpList.be";
	}
	
	/* , @RequestParam MultipartFile photo */
	@RequestMapping("addBusinessEmp2.be")
	public String addBusinessEmp2(BusinessEmp be, Model model, HttpServletRequest request,
			@RequestParam MultipartFile idPhoto, @RequestParam MultipartFile accountPhoto) {
		System.out.println("수정용ㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+be);
		
		System.out.println("idPhoto : " + idPhoto.isEmpty());
		System.out.println("accPhoto : " + accountPhoto.isEmpty());
		
		
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		String originFileName = "";
		String ext = "";
		String changeName = "";
		String originFileName2 = "";
		String ext2 = "";
		String changeName2 = "";
		
		
		if(idPhoto.isEmpty() == false) {
			//파일명 변경_신분증명서류
			originFileName = idPhoto.getOriginalFilename();
			ext = originFileName.substring(originFileName.lastIndexOf("."));
			changeName = be.getEmployeeCode() + "_" + be.getEmployeeName() + "_" + CommonsUtils.getRandomString().substring(8);
		}
		if(accountPhoto.isEmpty() == false) {
			//파일명 변경_계좌서류
			originFileName2 = accountPhoto.getOriginalFilename();
			ext2 = originFileName2.substring(originFileName2.lastIndexOf("."));
			changeName2 = be.getEmployeeCode() + "_" + be.getEmployeeName() + "_" + CommonsUtils.getRandomString().substring(8);
		}
		
		try {
			idPhoto.transferTo(new File(filePath + "\\" + changeName + ext));
			accountPhoto.transferTo(new File(filePath + "\\" + changeName2 + ext2));
			
			ArrayList<Attachment> attList = new ArrayList<Attachment>();
			
			if(idPhoto.isEmpty() == false) {
				Attachment at1 = new Attachment();
				at1.setFilePath(filePath);
				at1.setNewFileName(changeName+ext);
				at1.setType(3);
				at1.setComCode(be.getEmployeeCode());
				attList.add(at1);
			}
			
			
			
			if(accountPhoto.isEmpty() == false) {
				Attachment at2 = new Attachment();
				at2.setFilePath(filePath);
				at2.setNewFileName(changeName2+ext);
				at2.setType(4);
				at2.setComCode(be.getEmployeeCode());
				attList.add(at2);
			}
			
			int result = bes.updateBEmp(be, attList);
			
		}catch (Exception e) {
			new File(filePath + "\\" + changeName + ext).delete();
			new File(filePath + "\\" + changeName2 + ext2).delete();
			e.printStackTrace();
		}
		
		return "redirect:businessEmpList.be";
	}
	
	@RequestMapping("detailBEmp.be")
	public ModelAndView detailBEmp(ModelAndView mv, @RequestParam String empCode, HttpServletResponse response) {
		BusinessEmp2 be = bes.selectOneBEmp(empCode);
		
		
		mv.addObject("BEmp", be);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
