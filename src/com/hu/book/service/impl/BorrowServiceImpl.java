package com.hu.book.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javassist.compiler.ast.NewExpr;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import com.hu.book.mapper.BorrowMapper;
import com.hu.book.mapper.BorrowMapperCustom;
import com.hu.book.model.Book;
import com.hu.book.model.Borrow;
import com.hu.book.model.User;
import com.hu.book.service.BorrowService;
import com.hu.book.utils.UUIDUtils;

public class BorrowServiceImpl implements BorrowService {
	
	@Autowired
	private BorrowMapper borrowMapper;
	@Autowired
	private BorrowMapperCustom borrowMapperCustom;
	@Override
	public void addUserandBook(Borrow borrow) {
		// TODO Auto-generated method stub
		String lentime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String year=lentime.substring(0,4);
		String moth=lentime.substring(5,7);
		String day=lentime.substring(8,10);
		Integer x=Integer.parseInt(moth)+1;
		Integer y=Integer.parseInt(year);
		String returntime=null;
		if (x>12) {
			x=1;
			y=y+1;
		}
		if (x<10) {
			returntime=year+"-0"+x.toString()+"-"+day;
		}else {
			returntime=year+"-"+x.toString()+"-"+day;
		}
		
		borrow.setLentime(lentime);
		borrow.setReturntime(returntime);
		borrow.setId(UUIDUtils.getUUID());
		borrowMapper.insertSelective(borrow);	
	}
	@Override
	public List<User> finduserBorrowBooks() {
		// TODO Auto-generated method stub
		return borrowMapperCustom.finduserBorrowBooks();
	}
	@Override
	public List<User> borrowByfen(int index) {
		// TODO Auto-generated method stub
		return borrowMapperCustom.borrowByfen(index);
	}
	@Override
	public void updateBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowMapper.updateByPrimaryKeySelective(borrow);
	}
	@Override
	public User findoneBorrow(String booknum, String usernum) {
		// TODO Auto-generated method stub
		return borrowMapperCustom.findoneBorrow(booknum, usernum);
	}
	@Override
	public List<User> multicheckBorrow(Book book) {
		// TODO Auto-generated method stub
		return borrowMapperCustom.multicheckBorrow(book);
	}
	
	
	
}
