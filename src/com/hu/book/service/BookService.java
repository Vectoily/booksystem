package com.hu.book.service;

import java.util.List;

import com.hu.book.model.Book;
import com.hu.book.model.BookCustom;

public interface BookService {
	//����鼮
	public void addBook(BookCustom bookCustom);
	//ȫ���鼮
	public List<Book> findAllBook();
	//��ҳ��ѯ
	public List<Book> bookByFen(int index);
	//��һ��ѯ
	public Book checkBookMsg(String id);
	//�޸�book��Ϣ
	public void updateBookMsg(Book book);
	//ɾ��book��Ϣ
	public void deleteBookMsg(String id);
	//ģ����ѯ
	public List<Book> findbookList(Book book);
	
	public Book bookByIndety(String bookIdenty);
}
