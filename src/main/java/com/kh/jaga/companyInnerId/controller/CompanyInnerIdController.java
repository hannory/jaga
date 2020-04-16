package com.kh.jaga.companyInnerId.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.common.CommonsUtils;
import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.service.CompanyInnerIdService;

/**
 * @author SWY
 * @comment 사내계정생성 페이지 (생성/조회) 
 * @createDate 2020. 4. 14.
 */
@Controller
public class CompanyInnerIdController {
	
	@Autowired
	private CompanyInnerIdService service;
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	
	//위에는 오토와이어드 및 세션어트리뷰트 설정을 해야겠다.
	//이제 아래에는 맵핑되는 메소드들을 작성해야겠다.
	
	@RequestMapping(value="createComInnerId.comInId")
	public String createComInnerId(CreateCompanyInnerIdDto data, MultipartFile signFile, HttpServletRequest request) {
		System.out.println("컨트롤러 진입");
		System.out.println("data : " + data);
		System.out.println("signFile : " + signFile);

		//파일 저장할 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles\\signs";
		
		//파일명 변경 //랜덤문자열+timemillis추가해서 써야지(뒤에서 4개) //기존 이름은 필요 없음
		String originFileName = signFile.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String newFileName = 
				CommonsUtils.getRandomString().substring(8) + new CommonsUtils().getMillisec(4);
		
		System.out.println(newFileName);
		
		try {
			signFile.transferTo(new File(filePath + "\\" + newFileName + ext));
			data.setSign(newFileName + ext);
			
			data.setPwd(pwdEncoder.encode(data.getPwd()));
			
			int result = service.insertComInnerId(data);
			
			System.out.println("ctrl > result ::: " + result);
			
			return "redirect:index.jsp";

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:index.jsp";
		
	}//method
	
	
	
	//페이지 보여주는 메소드(직원 계정 조회)
	@RequestMapping(value = "showViewComInnerIdList.comInId")
	public String selectComInIdList(HttpServletRequest request) {
		
		System.out.println("showViewComInnerIdList.comInId 호출됨..");
		
		List list = service.selectComInIdList();
		request.setAttribute("list", list);
		
		
		System.out.println("ctrl > return list : " + list);
		
		
		
		return "selectCompanyId";
	}
	
	
	
	
	
	
	
	
	
	
	
}//class



















