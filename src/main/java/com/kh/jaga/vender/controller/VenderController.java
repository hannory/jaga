package com.kh.jaga.vender.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.jaga.vender.model.service.VenderService;
import com.kh.jaga.vender.model.vo.Vender;

@Controller
 @SessionAttributes("loginCompany") 
public class VenderController {
	
	@Autowired
	private VenderService vs;
	
	@RequestMapping("insert.ve")
	public String insertVender(Model model, Vender v, HttpServletRequest request) {
		
		System.out.println(v);
		vs.insertVender(v);
		
		return "redirect:index.jsp";
		
	}
	
	@RequestMapping("venderList.vi")
	public String selectVender(HttpServletRequest request) {
		System.out.println("리스트다");
		List<Vender> list=vs.selectVender();
		request.setAttribute("list", list);
		return "vender/venderList";
	}

	
	  @RequestMapping("venderSelectOne.vi")
	  public String selectOne(@RequestParam String venderCode, HttpServletRequest request, HttpServletResponse response) {
	
		  System.out.println("vendercode"+venderCode);
	 
		/* int vcode = Integer.parseInt(venderCode); */
	  
	  List<Vender> list = vs.selectOne(venderCode);
	  request.setAttribute("list", list);
	  return "vender/vender";
	  
	  }	 
	  
	  @RequestMapping("modifyVender.vi")
	  public String modifyOne(Vender v, HttpServletRequest request, HttpServletResponse response) {
		  
		vs.modifyOne(v);
		  
		/* return "redirect: venderSelectOne.vi"; */
	 return "redirect: venderList.vi";
	 
	  }
}


