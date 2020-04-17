package com.kh.jaga.employee.controller;

import java.io.File;

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
public String insertEmployee(Model model, Employee e, HttpServletRequest request, @RequestParam MultipartFile idDocument) {
	
	String root = request.getSession().getServletContext().getRealPath("resources");
	String filePath=root+"\\uploadFiles";
	
	String originFileName = idDocument.getOriginalFilename();
	String ext = originFileName.substring(originFileName.lastIndexOf("."));
	String changeName = CommonsUtils.getRandomString();
	
		
 String fileCode = null; 
		/* String comCode = request.getParameter("loginCompany.comCode"); */
 int type=1;
		 
	
	Attachment at = new Attachment();
		/*
		 * at.setComCode(comCode); at.setFileCode(fileCode)
		 */;
	at.setFilePath(filePath);
	at.setNewFileName(changeName);
	at.setType(type);
	at.setFileCode(fileCode);
	at.setComCode(e.comCode);
	try {
		idDocument.transferTo(new File(filePath+"\\"+changeName+ext));
		es.insertEmployee(e);
		es.insertAttachment(at);
		return "redirect:index.jsp";
	} catch (Exception e1) {
		new File(filePath+"\\"+changeName+ext).delete();
		model.addAttribute("msg","근로자 등록 실패!");
		
		return "common/errorpage";
	} 
	
}
	
}
