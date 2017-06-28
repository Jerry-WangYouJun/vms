package com.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 
 * <p>Title: CustomDateConverter</p>
 * <p>Description:日期转换器 </p>
 * <p>String 类型转成Date类型</p>
 * @author	Administrator
 * @date	2015-4-13下午5:49:14
 * @version 1.0
 */
public class CustomDateConverter implements Converter<String,Date>{
	
	private String pattern = "yyyy-MM-dd HH:mm:ss";
	public CustomDateConverter(String pattern) {
		// TODO Auto-generated constructor stub
		this.pattern = pattern;
	}
	
	@Override
	public Date convert(String source) {
		
		//实现 将日期串转成日期类型(格式是yyyy-MM-dd HH:mm:ss)
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(this.pattern);
		
		try {
			//转成直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//如果参数绑定失败返回null
		return null;
	}

}
