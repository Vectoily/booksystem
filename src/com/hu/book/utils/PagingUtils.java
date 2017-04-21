package com.hu.book.utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class PagingUtils {
	
	public static Map<String, Integer>  getPage(List<?> list,int num,int dangYe){
		int dang=(dangYe-1)*num;
		int zongYe=0;
		int zong =list.size();
		if (zong%5==0) {
			zongYe=zong/5;
		}else {
			zongYe=zong/5+1;
		}
		int xia=dangYe+1;
		if (xia>=zongYe) {
			xia=zongYe;
		}
		int shang=dangYe-1;
		if (shang<=1) {
			shang=1;
		}
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("dang",dang);
		map.put("shang",shang);
		map.put("xia", xia);
		map.put("zongYe",zongYe);
		return map;
	}
}
