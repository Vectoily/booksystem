package com.hu.book.mapper;

import java.util.List;

import com.hu.book.model.Book;

public interface BookMapperCustom {
	
	public List<Book> findAllBook();
	
	public List<Book> bookByFen(int index);
	
	public List<Book> findbookList(Book book);
	
	public Book bookByIdenty(String bookIdenty);
}
