package com.kh.jaga.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
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

/**
 * @author EunJin
 * @comment 사업소득자 등록 관련 컨트롤러
 * @createDate 2020. 4. 24.
 */
@Controller
public class BusinessEmpController {
	@Autowired
	private BusinessEmpService bes;
	
	/**
	 * @comment 은행..내가 만들었나?
	 * @param mv
	 * @return
	 */
	@RequestMapping("bankSearch.be")
	public ModelAndView bankSearch(ModelAndView mv) {
		List<Bank> bk = bes.selectBankList();
		
		mv.addObject("bkList", bk);
		
		return mv;
	}
	
	/**
	 * @comment 사업소득자 소득구분 리스트 불러오기 모달
	 * @comment TYPE_OF_BIZ_CODE/SELECT
	 * @param mv
	 * @return
	 */
	@RequestMapping("tobcSearch.be")
	public ModelAndView tobcSearch(ModelAndView mv) {
		List<TypeOfBizCode> bk = bes.selectTOBList();
		
		System.out.println(bk);
		
		mv.addObject("bkList", bk);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @comment 메뉴 눌렀을때 등록된 사업소득자 리스트 불러와서 해당 리스트를 가지고 view에 방문함
	 * @comment BUSINESS_EMP/select
	 * @param be	이건 왜 했지
	 * @param model
	 * @param request
	 * @return
	 */
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
	
	/**
	 * @comment 신규 사업소득자 등록하는 메소드
	 * @comment BUSINESS_EMP/insert
	 * @param be
	 * @param model
	 * @return
	 */
	@RequestMapping("addBusinessEmp.be")
	public String addBusinessEmp(BusinessEmp be, Model model) {
		int result = bes.insertBEmp(be);
		
		return "redirect:businessEmpList.be";
	}
	
	/**
	 * @comment 사업소득자 수정관련 메소드 / +첨부파일
	 * @comment BUSINESS_EMP/update / ATTACHMENT/INSERT
	 * @param be	수정사항이 담긴 DTO
	 * @param model
	 * @param request
	 * @param idPhoto	신분증사본
	 * @param accountPhoto	계좌서류
	 * @return
	 */
	@RequestMapping("addBusinessEmp2.be")
	public String addBusinessEmp2(BusinessEmp be, Model model, HttpServletRequest request,
			@RequestParam MultipartFile idPhoto, @RequestParam MultipartFile accountPhoto) {
		
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
			changeName = be.getEmployeeNum() + "_" + be.getEmployeeName() + "_" 
					+ be.getEmployeeCode() + CommonsUtils.getRandomString().substring(8);
		}
		if(accountPhoto.isEmpty() == false) {
			//파일명 변경_계좌서류
			originFileName2 = accountPhoto.getOriginalFilename();
			ext2 = originFileName2.substring(originFileName2.lastIndexOf("."));
			changeName2 = be.getEmployeeNum() + "_" + be.getEmployeeName() + "_" 
					+ be.getEmployeeCode() + CommonsUtils.getRandomString().substring(8);
		}
		
		try {
			
			ArrayList<Attachment> attList = new ArrayList<Attachment>();
			
			if(idPhoto.isEmpty() == false) {
				idPhoto.transferTo(new File(filePath + "\\" + changeName + ext));
				Attachment at1 = new Attachment();
				at1.setFilePath(filePath);
				at1.setNewFileName(changeName+ext);
				at1.setType(3);
				at1.setComCode(be.getEmployeeCode());
				attList.add(at1);
			}
			
			
			
			if(accountPhoto.isEmpty() == false) {
				accountPhoto.transferTo(new File(filePath + "\\" + changeName2 + ext2));
				Attachment at2 = new Attachment();
				at2.setFilePath(filePath);
				at2.setNewFileName(changeName2+ext2);
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
	
	/**
	 * @comment 사업소득자 상세정보 호출용 메소드
	 * @comment BUSINESS_EMP/SELECT
	 * @param mv
	 * @param empCode
	 * @param response
	 * @return
	 */
	@RequestMapping("detailBEmp.be")
	public ModelAndView detailBEmp(ModelAndView mv, @RequestParam String empCode, HttpServletResponse response) {
		BusinessEmp2 be = bes.selectOneBEmp(empCode);
		
		
		mv.addObject("BEmp", be);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	/**
	 * @comment 첨부파일 삭제용 메소드 DB에서도 삭제하고 파일도 삭제함
	 * @param fileCode 삭제할 파일의 PK코드
	 * @return
	 */
	@RequestMapping("deletePhoto.be")
	public String deletePhoto(@RequestParam String fileCode) {
		
		Attachment at = bes.selectFilePath(fileCode);
		
		
		int result = bes.deletePhoto(fileCode);
		
		new File(at.getFilePath() + "\\" +at.getNewFileName()).delete();
		
		return "redirect:businessEmpList.be";
	}
	
	/**
	 * @comment 
	 * @param mv
	 * @param fileCode
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("downloadPhoto.be")
	public ModelAndView downloadPhoto(ModelAndView mv, @RequestParam String fileCode, HttpServletResponse response) throws ServletException, IOException {
		Attachment at = bes.selectFilePath(fileCode);
		File downFile = new File(at.getFilePath() + "\\" + at.getNewFileName());
		
		 
		mv.addObject("attachment", at);
		mv.addObject("downloadFile", downFile);
		mv.setViewName("download");
		
			
		return mv;
	}
}
