package com.hu.book.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hu.book.model.Admin;
import com.hu.book.model.AdminCustom;
import com.hu.book.model.User;
import com.hu.book.model.UserCustom;
import com.hu.book.service.AdminService;
import com.hu.book.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/toRegist")
	public String toRegist(){
		return "user/signUp";
	}
	
	@RequestMapping("/registUser")
	public ModelAndView registUser(UserCustom userCustom){
		userService.registUser(userCustom);
		ModelAndView modelAndView=new ModelAndView();
		String msg="注册成功！请登陆邮箱进行激活！";
		modelAndView.addObject("msg", msg);
		modelAndView.setViewName("user/ms");
		return modelAndView;	
	}
	
	@RequestMapping("/checkState")
	public ModelAndView chechState(String code,UserCustom userCustom){
		User user=userService.findUserByCode(code);
		ModelAndView modelAndView=new ModelAndView();
		if (user==null) {
			String msg="激活失败！请重新注册！";
			modelAndView.addObject("wrongmsg", msg);
			modelAndView.setViewName("user/wrongms");
		}else {
			userService.updateState(userCustom, code);
			String msg="激活成功！请点击登陆前往登陆页面！";
			modelAndView.addObject("msg", msg);
			modelAndView.setViewName("user/ms");
		}
		return modelAndView;
	}
	
	@RequestMapping("/loginUser")
	public ModelAndView loginUser(UserCustom userCustom,AdminCustom adminCustom,
			HttpServletRequest request,HttpSession session){
		String identy=request.getParameter("userIdenty");
		ModelAndView modelAndView=new ModelAndView();
		
		if (identy.equals("学生")) {
			List<User> list=userService.loginUser(userCustom);
			if (list.size()>0) {
				session.setAttribute("userCustom", list.get(0));
				modelAndView.addObject("identy", identy);
				modelAndView.setViewName("user/userIndex");
			}else {
				String msg="登陆失败！用户名或密码错误，请重新登陆！";
				modelAndView.addObject("msg", msg);
				modelAndView.setViewName("user/wrongms");
			}
			
		}
		if (identy.equals("管理员")) { 
			List<Admin> list= adminService.loginAdmin(adminCustom);
			if (list.size()>0) {
				session.setAttribute("admin", list.get(0));
				session.setAttribute("identy", identy);
				modelAndView.setViewName("admin/adminIndex");
			}else {
				String msg="管理员名称或密码错误，请重新登陆！";
				modelAndView.addObject("msg", msg);
				modelAndView.setViewName("user/wrongms");
			}
		}
		return modelAndView;	
	}
	
	@RequestMapping("/checkMessage")
	public void comparePass(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		User user=(User) session.getAttribute("userCustom");
		String mpass=request.getParameter("mpass");
		try {if (user.getPassword().equals(mpass)) {
				response.getWriter().write("{\"success\":false}");
		}else {
			response.getWriter().write("{\"success\":true}");
		}} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/compareMsg")
	public void compareMsg(HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		User user=(User) session.getAttribute("userCustom");
		String mphone=request.getParameter("mphone");
		String currentpass=request.getParameter("currentpass");
		try {if (user.getPassword().equals(currentpass) || user.getPhone().toString().equals(mphone)) {
			
				response.getWriter().write("{\"success\":true}");
		}else {
			response.getWriter().write("{\"success\":false}");
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/msgChange")
	public String msgChange(HttpServletRequest request,UserCustom userCustom,HttpSession session){
		User user=(User) session.getAttribute("userCustom");
		userCustom.setCode(user.getCode());
		String newpass=request.getParameter("newpass");
		String newphone=request.getParameter("newphone"); 
		if (newphone==null) {
			userCustom.setPassword(newpass);
			userService.messageChange(userCustom);
		}
		if (newpass==null) {
			userCustom.setPhone(newphone);
			userService.messageChange(userCustom);
		}
		return "user/userBookList";
	}
	
	@RequestMapping("/checkAdminPass")
	public void checkAdminPass(HttpServletRequest request,
			HttpServletResponse response,HttpSession session){
		Admin admin=(Admin) session.getAttribute("admin");
		String adminPass=request.getParameter("adminpass");
		try {
		 if (adminPass.equals(admin.getPassword())) {
				response.getWriter().write("{\"success\":true}");
		}else {
			response.getWriter().write("{\"success\":false}");
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
