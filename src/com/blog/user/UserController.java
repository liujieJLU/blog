package com.blog.user;

import com.jfinal.core.Controller;

public class UserController extends Controller{
	
	/**
	 * index
	 */
	public void index(){
		User user = User.userDao.findById(1);
		setAttr("user",user);
		System.out.println("查到的登录名为："+user.getStr("username"));
		render("/user.jsp");
	}

}
