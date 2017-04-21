package com.hu.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hu.book.model.Book;
import com.hu.book.model.Borrow;
import com.hu.book.model.User;

public interface BorrowMapperCustom {
	
	public List<User> finduserBorrowBooks();
	
	public List<User> borrowByfen(int index);
	
	public User findoneBorrow(String booknum,String usernum);
	
	public List<User> multicheckBorrow(Book book);
	
}
