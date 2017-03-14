package com.clinic.utils;

public class CreateGetSetUtil {

	public static void main(String[] args) {
		try {
		
			/**
			ADInfomation adInfomation = new ADInfomation();
			
			String name = "adInfomation";			
			Field[] fields = adInfomation.getClass().getDeclaredFields();
			
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				field.setAccessible(true);
				
				String type = field.getType().toString();
				
				String setValue = "";
				if (type.endsWith("String")) {
					setValue = name + ".set" + field.getName() + "(rs.getString(\"" + field.getName() + "\"));";
				} else if(type.endsWith("Character")) {
					setValue = name + ".set" + field.getName() + "(rs.getString(\"" + field.getName() + "\").charAt(0));";
				} else if (type.endsWith("Timestamp") || type.endsWith("Date")) {
					setValue = name + ".set" + field.getName() + "(rs.getDate(\"" + field.getName() + "\"));";
				} else if (type.endsWith("Double") || type.endsWith("Float")) {
					setValue = name + ".set" + field.getName() + "(rs.getDouble(\"" + field.getName() + "\"));";
				} else if (type.endsWith("Integer") || type.endsWith("int") || type.endsWith("Long")) {
					setValue = name + ".set" + field.getName() + "(rs.getInt(\"" + field.getName() + "\"));";
				}
				
				System.out.println(setValue);
			}
			**/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
