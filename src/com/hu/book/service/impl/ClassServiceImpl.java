package com.hu.book.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.hu.book.mapper.ClassifyMapper;
import com.hu.book.mapper.ClassifyMapperCustom;
import com.hu.book.model.Classify;
import com.hu.book.service.ClassService;
import com.hu.book.utils.UUIDUtils;

public class ClassServiceImpl implements ClassService {
	@Autowired
	private ClassifyMapper classifyMapper;
	
	@Autowired
	private ClassifyMapperCustom classifyMapperCustom;
	@Override
	public void addClass(Classify classify) {
		// TODO Auto-generated method stub
		classifyMapper.insertSelective(classify);
	}

	@Override
	public List<Classify> findAllClass() {
		// TODO Auto-generated method stub
		return classifyMapperCustom.findAllClass();
	}

	@Override
	public List<Classify> classByfen(int index) {
		// TODO Auto-generated method stub
		return classifyMapperCustom.classByFen(index);
	}

	@Override
	public Classify findById(Integer id) {
		// TODO Auto-generated method stub
		return classifyMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateClassify(Classify classify) {
		// TODO Auto-generated method stub
		classifyMapper.updateByPrimaryKeySelective(classify);
	}

	@Override
	public void deleteClassify(Integer id) {
		// TODO Auto-generated method stub
		classifyMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Classify> findByMo(Classify classify) {
		// TODO Auto-generated method stub
		return classifyMapperCustom.findByMo(classify);
	}
}
