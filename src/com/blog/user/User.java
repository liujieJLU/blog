package com.blog.user;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class User extends Model<User>{
	
	public static final User userDao = new User();
	/**
	 * 所有 sql 写在 Model 或 Service 中，不要写在 Controller 中
	 */
	public List<User> validateUserInfo(String username,String password){
		return find("select * from user where username="+username+"and password="+password);
	}
	
	public List<User> findUserByName(String username){
		return find("select * from user where username="+username);
	}
}
