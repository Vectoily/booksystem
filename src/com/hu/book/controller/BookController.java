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
import org.springframework.web.servlet.ModelAndView;

import com.hu.book.model.Book;
import com.hu.book.model.BookCustom;
import com.hu.book.model.Classify;
import com.hu.book.model.User;
import com.hu.book.service.BookService;
import com.hu.book.service.ClassService;
import com.hu.book.utils.PagingUtils;
@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ClassService classService;
	
	@RequestMapping("/addBook")//���ͼ��
	public String addBook(BookCustom bookCustom,HttpSession session){
		bookService.addBook(bookCustom);
		session.setAttribute("bookCustom", bookCustom);
		return "forward:bookByFen.action?dangYe=1";
	}
	@RequestMapping("/checkMessage")//ע��У��
	public void checkMessage(HttpServletRequest request,
			HttpServletResponse response){
		List<Book> list=bookService.findAllBook();
		String booknum=request.getParameter("booknum");
		boolean flag=false;
		for (int i = 0; i < list.size(); i++) 
		{
				if (booknum.equals(list.get(i).getBookidenty())) 
					
				{
					flag=true;	
				}
		}
		try {	
			if (flag) {
				response.getWriter().write("{\"success\":false}");
			}else {
				response.getWriter().write("{\"success\":true}");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
}
	
	@RequestMapping("/bookByFen")//ȫ�����ҳ
	public String bookByFen(int dangYe,HttpServletRequest request,HttpSession session){
		List<Book> allBookList=bookService.findAllBook();
		Map<String, Integer> map=PagingUtils.getPage(allBookList, 5, dangYe);
		List<Book> booList=bookService.bookByFen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("bookList", booList);
		List<Classify> classList=classService.findAllClass();
		session.setAttribute("allclass",classList);
		return "admin/adminBookList";
	}
	
	@RequestMapping("/checkBookMsg")//  ��һ��ѯ��ת���鿴����ҳ��
	public String findBookById(String id,HttpServletRequest request){
		Book book=bookService.checkBookMsg(id);
		request.setAttribute("book", book);
		return "admin/adminBookinfo";
	}
	
	@RequestMapping("/checktoUpdate")// ��һ��ѯ��ת���޸�ҳ��
	public String checktoUpadte(String id,HttpServletRequest request){
		Book book=bookService.checkBookMsg(id);
		request.setAttribute("book", book);
		return "admin/updateBook";
	}
	
	@RequestMapping("/updateBookMsg")//������Ϣ
	public String updateBookMsg(HttpServletRequest request,Book book){
		String id=request.getParameter("id");
		book.setId(id);
		bookService.updateBookMsg(book);
		return "forward:bookByFen.action?dangYe=1";
	}
	
	@RequestMapping("/deleteBookMsg")//ɾ����Ϣ
	public String deleteBookMsg(String id){
		 bookService.deleteBookMsg(id);
		return "forward:bookByFen.action?dangYe=1";
	}
	
	@RequestMapping("/multiCheckBook")//ģ����ѯ���ҳ
	public String multiCheckBook(int dangYe,Book book,HttpServletRequest request,HttpSession session){
		List<Book> list=bookService.findbookList(book);
		Map<String, Integer> map=PagingUtils.getPage(list, 5, dangYe);
		List<Book> booList=bookService.bookByFen(map.get("dang"));
		request.setAttribute("zongYe",map.get("zongYe"));
		request.setAttribute("dangYe",dangYe);
		request.setAttribute("shang",map.get("shang"));
		request.setAttribute("xia",map.get("xia"));
		session.setAttribute("bookList", booList);
		session.setAttribute("bookList",list);
		return "admin/adminBookList";
	}
}
