package com.hu.book.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hu.book.model.Book;
import com.hu.book.model.Borrow;
import com.hu.book.model.User;
import com.hu.book.service.BookService;
import com.hu.book.service.BorrowService;
import com.hu.book.service.UserService;
import com.hu.book.utils.PagingUtils;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
	
	@Autowired
	private BorrowService borrowService;
	
	@Autowired
	
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/checkuserAndBook")
	
	public String checkuserAndBook(HttpServletRequest request,Borrow borrow,HttpSession session){
		String usernum=request.getParameter("usernum");
		String bookidenty=request.getParameter("booknum");
		User user=userService.userBynumber(usernum);
		Book book=bookService.bookByIndety(bookidenty);
		borrow.setStudentId(user.getCode());
		borrow.setBookId(book.getId());
		borrowService.addUserandBook(borrow);
		return "forward:borrowByfen.action?dangYe=1";	
	}
	
	@RequestMapping("/borrowByfen")
	public String borrowByfen(int dangYe,HttpServletRequest request,HttpSession session){
		List<User> list=borrowService.finduserBorrowBooks();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> borrowList=borrowService.borrowByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("borrowList", borrowList);
		return "admin/bookLen";
	}
	
	@RequestMapping("/checkBorrowMsg")
	public void checkBorrowMsg(HttpServletRequest request,
			HttpServletResponse response){
		String usernum=request.getParameter("usernum");
		String booknum=request.getParameter("booknum");
		List<User> list=borrowService.finduserBorrowBooks();
		boolean flag=false;
		for (int i = 0; i <list.size(); i++) {
			for (int j = 0; j <list.get(i).getBookList().size(); j++) {
				if (list.get(i).getBorrowList().get(j).getBacktime()==null) {	
				  if (usernum.equals(list.get(i).getNumber()) && booknum.equals(list.get(i).getBookList().get(j).getBookidenty())) {
					  flag=true;
				  }
				}
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
	
	@RequestMapping("/checkReturnMsg")
	public void checkReturnMsg(HttpServletRequest request,
			HttpServletResponse response){
		String usernum=request.getParameter("usernum");
		String booknum=request.getParameter("booknum");
		List<User> list=borrowService.finduserBorrowBooks();
		boolean flag=false;
		for (int i = 0; i <list.size(); i++) {
			for (int j = 0; j <list.get(i).getBookList().size(); j++) {
				if (list.get(i).getBorrowList().get(j).getBacktime()!=null) {	
				  if (usernum.equals(list.get(i).getNumber()) && booknum.equals(list.get(i).getBookList().get(j).getBookidenty())) {
					  flag=true;
				  }
				}
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
	
	
	@RequestMapping("/borrowByfen2")
	public String borrowByfen2(int dangYe,HttpServletRequest request,HttpSession session){
		List<User> list=borrowService.finduserBorrowBooks();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> borrowList=borrowService.borrowByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("borrowList", borrowList);
		return "admin/bookReturn";
	}	
	
	
@RequestMapping("/addReturntime")
	public String addReturntime(HttpServletRequest request,HttpSession session){
	String usernum=request.getParameter("usernum");
	String booknum=request.getParameter("booknum");
	User user=borrowService.findoneBorrow(booknum, usernum);
	Borrow borrow=user.getBorrowList().get(0);
	String backtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String returntime=borrow.getReturntime();
	Integer b_moth=Integer.parseInt(backtime.substring(5,7));
	Integer r_month=Integer.parseInt(returntime.substring(5,7));
	Integer b_day=Integer.parseInt(backtime.substring(8,10));
	Integer r_day=Integer.parseInt(returntime.substring(8,10));
	double money=((b_moth-r_month)*30+b_day-r_day)*0.5;
	if (money<=0) {
		money=0;
	}
	borrow.setMoney(money);
	borrow.setBacktime(backtime);
	borrowService.updateBorrow(borrow);
	return "forward:borrowByfen2.action?dangYe=1";	
	}
	
	@RequestMapping("/borrowByfen3")
	public String borrowByfen3(int dangYe,HttpServletRequest request,HttpSession session){
		List<User> list=borrowService.finduserBorrowBooks();
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> borrowList=borrowService.borrowByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("borrowList", borrowList);
		return "admin/checkReadedBook";
	}
	
	@RequestMapping("/multicheckBorow")
	public String multicheckBorow(int dangYe,HttpServletRequest request,User user,
			Book book,HttpSession session){
		List<User> list=borrowService.multicheckBorrow(book); 
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<User> borrowList=borrowService.borrowByfen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("borrowList", borrowList);
		session.setAttribute("borrowList", list);
		return "admin/checkReadedBook";
	}
}
