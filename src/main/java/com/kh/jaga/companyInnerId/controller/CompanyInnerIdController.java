package com.kh.jaga.companyInnerId.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.service.CompanyInnerIdServiceImpl;

@Controller
public class CompanyInnerIdController {
	
	@Autowired
	private CompanyInnerIdServiceImpl comInnerIdservice;
	
	
	//위에는 오토와이어드 및 세션어트리뷰트 설정을 해야겠다.
	//이제 아래에는 맵핑되는 메소드들을 작성해야겠다.
	
	@RequestMapping(value="createComInnerId.comInId")
	public String createComInnerId(CreateCompanyInnerIdDto data, MultipartFile signFile, HttpServletRequest request) {
		System.out.println("컨트롤러 진입");
		System.out.println("data : " + data);
		System.out.println("signFile : " + signFile);

		//파일 저장할 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		//파일명 변경 //기존 이름은 필요 없음
		String originFileName = signFile.getOriginalFilename();
		System.out.println(originFileName);
		
		
		
		//참고용,, 다 하고 삭제
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		System.out.println("root : " + root);
//		
//		String filePath = root + "\\uploadFiles";
//		
//		
//		//----------------------------------------------------------------------------------
//		//파일명 변경
//		String originFileName = photo.getOriginalFilename();
//		String ext = originFileName.substring(originFileName.lastIndexOf("."));
//		String changeName = CommonsUtils.getRandomString();
//		//----------------------------------------------------------------------------------
		
		
		
		//////////삭제할 영역//////////////
		//받아온 데이터 디비에 저장해보자
		//int result = comInnerIdservice.insertComInnerId(data);
		//System.out.println("result : " + result);
		//////////삭제할 영역//////////////
		
		return "redirect:index.jsp";
	}//method
	
	
	
	
//	
//	@RequestMapping("createComInnerId.comInId")
//	public String createComInnerId(
//				CreateCompanyInnerIdDto idInfo
////			,	@RequestParam MultipartFile sign
//			) 							
//	//method body 시작
//	{
//		
//		System.out.println("컨트롤러 ㅋㅋ");
//		
//		System.out.println("idInfo : " + idInfo);
////		System.out.println("sign : " + sign);
//		
//		//계정 생성 후 어디로 보낼까 ? // 일단 index로 보내자 // 추후 수정하기
//		return "redirect:index.jsp";
//	}
//	
//	
//	
	
	
	
	
	
	
	
	
	
	
	
	
}//class



















