package com.hu.book.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hu.book.model.Admin;
import com.hu.book.model.Book;
import com.hu.book.model.User;
import com.hu.book.model.UserCustom;
import com.hu.book.service.AdminService;
import com.hu.book.service.UserService;
import com.hu.book.utils.PagingUtils;
@Controller
@RequestMapping("/admin")
public class AdminContrller {
	
	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/userList")
	public String userList(int dangYe,HttpServletRequest request,HttpSession session){
		List<User> list=userService.allUserList();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> userList=userService.userByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("userList", userList);
		return "admin/userManage";
	}
	
	@RequestMapping("/idtoUpdate")
	public String changeUserMsag(HttpServletRequest request){
		String code=request.getParameter("code");
		User user=userService.findUserByCode(code);
		request.setAttribute("user",user);
		return "admin/userUpdate";
	}
	
	@RequestMapping("/addUser")
	public String addUser(UserCustom userCustom){
		userService.registUser(userCustom);
		return "forward:userList.action?dangYe=1";
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(String code,UserCustom userCustom){
		userCustom.setCode(code);
		userService.messageChange(userCustom);
		return "forward:userList.action?dangYe=1";
	}
	
	@RequestMapping("/deleteUser")
	public String deleteUser(String code){
		userService.deleteUser(code);
		return "forward:userList.action?dangYe=1";
	}
	
	@RequestMapping("/checkMessage")
	public void checkMessage(HttpServletRequest request,HttpServletResponse response){
		List<User> list=userService.allUserList();
		String number=request.getParameter("plusnum");
		System.out.println(number);
		boolean flag=false;
		for (int i = 0; i <list.size(); i++) {
			if (number.equals(list.get(i).getNumber())) {
				flag=true;
			}
		}
		try {if (flag) {
			
				response.getWriter().write("{\"success\":false}");
		}else {
			response.getWriter().write("{\"success\":true}");
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/checkadminNum")
	public void checkadminNum(HttpServletRequest request,HttpServletResponse response){
		List<Admin> list=adminService.allAdmin();
		String number=request.getParameter("plusnum");
		System.out.println(number);
		boolean flag=false;
		for (int i = 0; i <list.size(); i++) {
			if (number.equals(list.get(i).getAdminnumber())){
				flag=true;
			}
		}
		try {if (flag) {
			
				response.getWriter().write("{\"success\":false}");
		}else {
			response.getWriter().write("{\"success\":true}");
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/checkMessage2")
	public void checkMessage2(HttpServletRequest request,HttpServletResponse response){
		String mail=request.getParameter("mail");
		try {if (mail!=null) {
			response.getWriter().write("{\"success\":false}");
		}else {
			response.getWriter().write("{\"success\":true}");
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/checkuserMsg")
	public void checkuserMsg(HttpServletRequest request,HttpServletResponse response){
		List<User> list=userService.allUserList();
		String num=request.getParameter("number");
		boolean flag=true;
		for (int i = 0; i <list.size(); i++) {
			if (num.equals(list.get(i).getNumber())) {
				flag=false;
			}
		}
		try {
			if (flag) {
			response.getWriter().write("{\"success\":false}");
			}else {
			response.getWriter().write("{\"success\":true}");
			}
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/multicheckUser")
	public String multicheckUser(int dangYe,User user,
			HttpServletRequest request,HttpSession session){
		List<User> list=userService.multicheckUser(user);
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> userList=userService.userByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("userList", userList);
		session.setAttribute("userList", list);
		return "admin/userManage";
	}
	
	@RequestMapping("/changeUserPass")
	public String changeUserPass(User user,String number){
		User u=userService.userBynumber(number);
		user.setCode(u.getCode());
		userService.changeUserPass(user);
		return "forward:userList.action?dangYe=1";
	}
	
	@RequestMapping("/adminList")
	public String adminList(int dangYe,HttpServletRequest request,HttpSession session){
		List<Admin> list=adminService.allAdmin();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<Admin> adminList=adminService.adminByFen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("adminList", adminList);
		return "admin/adminMange";
	}
	
	@RequestMapping("/addAdmin")
	public String addAdmin(Admin admin){
		adminService.addAdmin(admin);
		return "forward:adminList.action?dangYe=1";
	}
	
	@RequestMapping("/idtoUpdateAdmin")
	public String idtoUpdate(String id,HttpSession session){
		Admin admin=adminService.adminById(id);
		session.setAttribute("admin",admin);
		return "admin/updateAdmin";
	}
	
	@RequestMapping("/checkAccess")
	public void checkAccess(HttpSession session,HttpServletRequest request,
			HttpServletResponse response){
		Admin admin=(Admin) session.getAttribute("admin");
		try {
		if ("admin".equals(admin.getName())) {
			response.getWriter().write("{\"success\":true}");
		}else {
		response.getWriter().write("{\"success\":false}");
		}} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping("/checkadminName")
	public void checkadminName(HttpServletRequest request,
			HttpServletResponse response){
		String name=request.getParameter("name");
		try {
		if ("admin".equals(name)) {
			response.getWriter().write("{\"success\":true}");
		}else {
		response.getWriter().write("{\"success\":false}");
		}} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/toUpdateAdmin")
	public String toUpdateAdmin(String id,HttpSession session){
		Admin admin=adminService.adminById(id);
		session.setAttribute("updateAdmin", admin);
		return "admin/updateAdmin";
	}
	
	@RequestMapping("/updateAdminMsg")
	public String updateAdminMsg(String id,Admin admin){
		admin.setAdminid(id);
		adminService.updateAdmin(admin);
		return "forward:adminList.action?dangYe=1";
	}
	
	@RequestMapping("/deleteAdmin")
	public String deleteAdmin(String id){
		adminService.deleteAdmin(id);
		return "forward:adminList.action?dangYe=1";
	}
	
	
	@RequestMapping("/adminByMo")
	public String adminByMo(int dangYe,Admin admin,
			HttpServletRequest request,HttpSession session){
		List<Admin> list=adminService.adminByMo(admin);
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<Admin> adminList=adminService.adminByFen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("adminList", adminList);
		session.setAttribute("adminList", list);
		return "admin/adminMange";
	}
}
