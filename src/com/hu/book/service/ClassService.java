package com.hu.book.service;

import java.util.List;

import com.hu.book.model.Classify;

public interface ClassService {
	
	public void addClass(Classify classify);
	
	public List<Classify> findAllClass();
	
	public List<Classify> classByfen(int index);
	
	public Classify findById(Integer id);
	
	public void updateClassify(Classify classify);
	
	public void deleteClassify(Integer id);
	//Ä£ºý²éÑ¯
	public List<Classify> findByMo(Classify classify);
}
