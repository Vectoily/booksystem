package com.hu.book.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hu.book.model.Book;
import com.hu.book.model.Borrow;
import com.hu.book.model.User;

public interface BorrowService {
	
	public void addUserandBook(Borrow borrow);
	
	public List<User> finduserBorrowBooks();
	
	public List<User> borrowByfen(int index);
	
	public void updateBorrow(Borrow borrow); 
	
	public User findoneBorrow(String booknum,String usernum);
	
	public List<User> multicheckBorrow(Book book);
	
}
