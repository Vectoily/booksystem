package com.hu.book.service;

import java.util.List;

import com.hu.book.model.Book;
import com.hu.book.model.BookCustom;

public interface BookService {
	//添加书籍
	public void addBook(BookCustom bookCustom);
	//全查书籍
	public List<Book> findAllBook();
	//分页查询
	public List<Book> bookByFen(int index);
	//单一查询
	public Book checkBookMsg(String id);
	//修改book信息
	public void updateBookMsg(Book book);
	//删除book信息
	public void deleteBookMsg(String id);
	//模糊查询
	public List<Book> findbookList(Book book);
	
	public Book bookByIndety(String bookIdenty);
}
