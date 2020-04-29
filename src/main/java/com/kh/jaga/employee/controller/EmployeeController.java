package com.kh.jaga.employee.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.employee.model.service.EmployeeService;
import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;

@Controller
@SessionAttributes("loginCompany")
public class EmployeeController {
@Autowired
private EmployeeService es;

	
@RequestMapping("insert.emp")
public String insertEmployee(Model model, Employee e, HttpServletRequest request, @RequestParam MultipartFile idDocument, MultipartFile accountDocument) {
	
	String root = request.getSession().getServletContext().getRealPath("resources");
	String root2 = request.getSession().getServletContext().getRealPath("resources");
	
	String filePath=root+"\\uploadFiles";
	String filePath2=root2+"\\uploadFiles";
	
	String originFileName = idDocument.getOriginalFilename();
	String originFileName2 = accountDocument.getOriginalFilename();
	String ext = originFileName.substring(originFileName.lastIndexOf("."));
	String ext2 = originFileName2.substring(originFileName2.lastIndexOf("."));
	String changeName = CommonsUtils.getRandomString();
	String changeName2 = CommonsUtils.getRandomString();
	
		
	String fileCode = null; 
	String fileCode2 = null; 

	int type=0;
	int type2=0;
		 
	
	Attachment at = new Attachment();

	at.setFilePath(filePath);
	at.setNewFileName(changeName);
	at.setType(type);
	at.setFileCode(fileCode);
	at.setComCode(e.comCode);
	
	
	Attachment at2 = new Attachment();

	 at2.setFilePath(filePath2);
	 at2.setNewFileName(changeName2);
	 at2.setType(type2);
	 at2.setFileCode(fileCode2);
	 at2.setComCode(e.comCode);

	
	try {
		idDocument.transferTo(new File(filePath+"\\"+changeName+ext));
		accountDocument.transferTo(new File(filePath2+"\\"+changeName2+ext2));
		es.insertEmployee(e);
		es.insertAttachment(at);
		es.insertAttachment2(at2);
		return "redirect:index.jsp";
	} catch (Exception e1) {
		new File(filePath+"\\"+changeName+ext).delete();
		new File(filePath+"\\"+changeName2+ext2).delete();
		model.addAttribute("msg","근로자 등록 실패!");
		
		return "common/errorpage";
	} 
	
}
@RequestMapping("selectEmpList.emp")
public String selectEmpList(HttpServletRequest request) {
	List<Employee> list = es.selectEmpList();
	request.setAttribute("list", list);
	System.out.println("리스트다 리스트 잘 출력되니?"+list);
	return "employee/newEmployee";
}

@RequestMapping("selectEmpList2.emp")
public String selectEmpList2(HttpServletRequest request) {
	List<Employee> list = es.selectEmpList2();
	request.setAttribute("list", list);
	return "employee/earnincome";
}
	/*
	 * @RequestMapping("employeeinsert.emp") public
	 */
}
