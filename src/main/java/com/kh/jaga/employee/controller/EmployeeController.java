package com.kh.jaga.employee.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.service.EmployeeService;
import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.EarnIncome;
import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.employee.model.vo.incomeTax;
import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.service.ReceiptionServiceImpl;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;

@Controller
@SessionAttributes("loginCompany")
public class EmployeeController {
@Autowired
private EmployeeService es;

@Autowired
private ReceiptionService rs;

@DateTimeFormat	
@RequestMapping("insert.emp")
public String insertEmployee(Model model, Employee e, HttpServletRequest request, @RequestParam MultipartFile idDocument, MultipartFile accountDocument,@DateTimeFormat(pattern="yyyy-MM-dd") Date leaveDate) {
	
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
	
 @RequestMapping("insertEarnEmp.emp") 
 public String insertEarnEmp(@RequestParam String employeeCode,Model model, EarnIncome ei,HttpServletRequest request) {
	 
	 System.out.println("임플로이 코드는요"+employeeCode);
	 es.insertEarnEmp(ei,employeeCode);
	 
		Receiption r = new Receiption();
		r.setSlipDate(ei.getPayDate());
		r.setSlipDivision("일반");
		
		BigDecimal supplyValue = new BigDecimal(ei.getTotalPayment() + "");
		r.setSupplyValue(supplyValue);
		
		BigDecimal valueTax = new BigDecimal("0");
		r.setValueTax(valueTax);
		r.setDeemedStatus("N");
		r.setBrief("근로소득자 급여지급");
		
		Company company = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = company.getCompanyCode();
		r.setComCode(comCode);

		

		List<Journalize> list = new ArrayList<Journalize>();
		Journalize j1 = new Journalize();
		j1.setDebitCredit("차변");
		j1.setPrice(supplyValue);
		String buseo = es.selectEmpBuseo(employeeCode);
		if(buseo.equals("생산관리팀")) {
			j1.setAccountCode("50300"); /* 50300 */
		}else {
			j1.setAccountCode("80200"); /* 50300 */
		}

		Journalize j2 = new Journalize();
		j2.setDebitCredit("대변");

		BigDecimal dfPy = new BigDecimal(ei.getDifferencePymt() + "");
		j2.setPrice(dfPy);

		j2.setAccountCode("10300");

		Journalize j3 = new Journalize();
		j3.setDebitCredit("대변");
		j3.setAccountCode("25400");

		BigDecimal na = new BigDecimal(ei.getNationalPension() + ""); /* 국민연금 */
		BigDecimal he = new BigDecimal(ei.getHealthInsurance() + ""); /* 건강보험 */
		BigDecimal lo = new BigDecimal(ei.getLongTermInsurance() + ""); /* 장기요양 */
		BigDecimal em = new BigDecimal(ei.getEmploymentInsurance() + ""); /* 고용보험 */
		BigDecimal income = new BigDecimal(ei.getIncomeTax() + ""); /* 소득세 */
		BigDecimal local = new BigDecimal(ei.getLocalIncomeTax() + ""); /* 지방소득세 */
		BigDecimal yesu = na.add(he).add(lo).add(em).add(income).add(local);

		j3.setPrice(yesu);

		list.add(j1);
		list.add(j2);
		list.add(j3);
	 
		String dsCode = rs.selectDateSlipCode(r);
		if(dsCode == null) {
			dsCode = "10001";
		}else {
			dsCode = (Integer.parseInt(dsCode)+1) + "";
		}
		r.setDateSlipCode(dsCode);
		r.setJournalizeList(list);
		
		int result = rs.insertReceiption(r);
	 
	 return "redirect:index.jsp";
 }
 
 @RequestMapping("selectIncomeTax.emp")
 public void selectIncomeTax( HttpServletRequest request, HttpServletResponse response,String taxableIncome ) {
	 System.out.println("컨트롤러 진입했니");
	   taxableIncome = request.getParameter("taxableIncome");
	 System.out.println("과세 값 잘 넘어오니?" + taxableIncome);
	int taxableIncome2= Integer.parseInt(taxableIncome);
	System.out.println("컨트롤러 진입 전 값 "+taxableIncome2);
	incomeTax result= es.seletcIncomeTax(taxableIncome2);
	System.out.println("컨트롤러 진입 후 리절트값 :"+ result.getResult());
	
	try {
		response.getWriter().print(result.getResult());
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		/* return "employee/earnincome"; */
 
 }
	 
}
