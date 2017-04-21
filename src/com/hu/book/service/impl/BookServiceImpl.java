package com.hu.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;

import com.hu.book.mapper.BookMapper;
import com.hu.book.mapper.BookMapperCustom;
import com.hu.book.model.Book;
import com.hu.book.model.BookCustom;
import com.hu.book.service.BookService;
import com.hu.book.utils.UUIDUtils;

public class BookServiceImpl implements BookService {
	
	@Autowired 
	private BookMapper bookMapper;
	
	@Autowired
	private BookMapperCustom bookMapperCustom;
	@Override
	public void addBook(BookCustom bookCustom) {
		// TODO Auto-generated method stub
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String datesString=simpleDateFormat.format(date);
		bookCustom.setShelftime(datesString);
		bookCustom.setId(UUIDUtils.getUUID());
		bookMapper.insertSelective(bookCustom);
	}
	@Override
	public List<Book> findAllBook() {
		// TODO Auto-generated method stub
		return bookMapperCustom.findAllBook();
	}
	@Override
	public List<Book> bookByFen(int index) {
		// TODO Auto-generated method stub
		return bookMapperCustom.bookByFen(index);
	}
	@Override
	public Book checkBookMsg(String id) {
		// TODO Auto-generated method stub
		return bookMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateBookMsg(Book book) {
		// TODO Auto-generated method stub
		 bookMapper.updateByPrimaryKeySelective(book);
	}
	@Override
	public void deleteBookMsg(String id) {
		// TODO Auto-generated method stub
		bookMapper.deleteByPrimaryKey(id);
	}
	@Override
	public List<Book> findbookList(Book book) {
		// TODO Auto-generated method stub
		return bookMapperCustom.findbookList(book);
	}
	@Override
	public Book bookByIndety(String bookIdenty) {
		// TODO Auto-generated method stub
		return bookMapperCustom.bookByIdenty(bookIdenty);
	}
}
