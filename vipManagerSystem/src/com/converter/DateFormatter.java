package com.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.format.Formatter;
/**
 * 日期格式化 只能讲String类型转成Date类型
 * @author Administrator
 *
 */
public class DateFormatter implements Formatter<Date> {
	private String datePattern;
	private SimpleDateFormat dateFormat;
	
	public DateFormatter(String datePattern) {
		super();
		this.datePattern = datePattern;
		this.dateFormat =  new SimpleDateFormat(this.datePattern);
		this.dateFormat.setLenient(false);
	}

	@Override
	public String print(Date date, Locale local) {
		// TODO Auto-generated method stub
		return this.dateFormat.format(date);
	}

	@Override
	public Date parse(String value, Locale locale) throws ParseException {
		// TODO Auto-generated method stub
		try {
			return this.dateFormat.parse(value);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return null;
	}

}
