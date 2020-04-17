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
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;
import com.kh.jaga.companyInnerId.model.service.CompanyInnerIdService;
import com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo;

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
			
			System.out.println("ctrl > result (예외가 있다면 여긴 출력 X여야함)::: " + result);
			
			return "redirect:index.jsp";

		} catch (IllegalStateException e) {
			System.out.println("컨트롤러 캐치 1111111111");
		} catch (IOException e) {
			System.out.println("컨트롤러 캐치 2222222222");
		} catch (ComInIdException e) {
			//내가 만든 에러
			System.out.println("컨트롤러 캐치 3333333333");
			System.out.println("컨트롤러에서 사내계정 익셉션을 잡음@@@@@@@@@@@@@@@@@@@");
			return "redirect:index.jsp";
		}
		
		System.out.println("캐치 이후에 여기도 실행이 될까 ?");
		return "redirect:index.jsp";
		
	}//method
	
	
	
	//페이지 보여주는 메소드(직원 계정 조회)
	@RequestMapping(value = "showViewComInnerIdList.comInId")
	public String selectComInIdList(HttpServletRequest request, Model model) {
		
		System.out.println("showViewComInnerIdList.comInId 호출됨..");
		
		List<SelectCompanyIdVo> list = service.selectComInIdList();
//		request.setAttribute("list", list);
		
		if(list != null) {
			model.addAttribute(list);
		}else {
			System.out.println("직원정보 조회 결과 없음");
		}
		
		System.out.println("ctrl > list : " + list);
		System.out.println("ctrl > list : " + ( (SelectCompanyIdVo) (list.get(0)) ).getId() );
		
		SelectCompanyIdVo tempVo = list.get(0);
		
		request.setAttribute("tempVo", tempVo);
		request.setAttribute("list", list);
		return "selectCompanyId";
	}
	
	
	
	
	
	
	
	
	
	
	
}//class



















