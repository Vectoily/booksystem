package com.hu.book.mapper;

import java.util.List;

import com.hu.book.model.Classify;


public interface ClassifyMapperCustom {
	 
	public List<Classify> findAllClass();
	
	public List<Classify> classByFen(int index);
	
	public List<Classify> findByMo(Classify classify);
}