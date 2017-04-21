package com.hu.book.model;

import java.io.Serializable;
import java.util.List;

public class User implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String code;

    private String name;

    private String number;

    private String password;

    private String email;

    private String phone;

    private String state;

    private List<Book> bookList;
    
    private List<Borrow> borrowList;
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<Borrow> getBorrowList() {
		return borrowList;
	}

	public void setBorrowList(List<Borrow> borrowList) {
		this.borrowList = borrowList;
	}
    
    
}