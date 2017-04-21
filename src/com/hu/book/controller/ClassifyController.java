package com.hu.book.controller;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hu.book.model.Classify;
import com.hu.book.service.ClassService;
import com.hu.book.utils.PagingUtils;
@Controller
@RequestMapping("/classify")
public class ClassifyController {
	
	@Autowired
	private ClassService classService;
	
	@RequestMapping("/addClass")
	public String addClass(Classify classify){
		classService.addClass(classify);
		return "forward:classByfen.action?dangYe=1";
	}
	
	@RequestMapping("/allClass")
	public void allClass(HttpSession session){
		List<Classify> allClass=classService.findAllClass();
		session.setAttribute("allClass", allClass);
	}
	
	@RequestMapping("/classByfen")
	public String classByfen(int dangYe,HttpServletRequest request,HttpSession session){
		List<Classify> list=classService.findAllClass();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<Classify> classList=classService.classByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("classList",classList);
		return "admin/classify";	
	}
	
	@RequestMapping("/idtoUpdate")
	public String idtoUpdate(Integer id,HttpSession session){
		Classify classify=classService.findById(id);
		session.setAttribute("classify", classify);
		return "admin/classUpdate";
	}
	
	@RequestMapping("/updateClassify")
	public String updateClassify(HttpServletRequest request,Classify classify){
		String string=request.getParameter("id");
		Integer id=Integer.parseInt(string);
		classify.setId(id);
		classService.updateClassify(classify);
		return "forward:classByfen.action?dangYe=1";
	}
	@RequestMapping("/delteClassify")
	public String delteClassify(Integer id){
		classService.deleteClassify(id);
		return "forward:classByfen.action?dangYe=1";
	}
	
	@RequestMapping("/classByMo")
	public String classByMo(int dangYe,Classify classify,HttpServletRequest request,HttpSession session){
		List<Classify> list=classService.findByMo(classify);
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<Classify> classList=classService.classByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("classList",classList);
		session.setAttribute("classList",list);
		return "admin/classify";	
	}
}
