package com.hu.book.mapper;

import com.hu.book.model.Classify;
import com.hu.book.model.ClassifyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClassifyMapper {
    int countByExample(ClassifyExample example);

    int deleteByExample(ClassifyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Classify record);

    int insertSelective(Classify record);

    List<Classify> selectByExample(ClassifyExample example);

    Classify selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Classify record, @Param("example") ClassifyExample example);

    int updateByExample(@Param("record") Classify record, @Param("example") ClassifyExample example);

    int updateByPrimaryKeySelective(Classify record);

    int updateByPrimaryKey(Classify record);
}