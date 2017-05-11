package com.blog.controller;

import com.blog.common.BaseController;
import com.blog.model.User;

public class UserController extends BaseController {

	/**
	 * index
	 */
	public void index() {
		User user = User.dao.findById(1);
		setAttr("user", user);
		System.out.println("查到的登录名为：" + user.getStr("username"));
		// render("/user.jsp");
		render("main.jsp");
	}

	public void login() {
		User user = getModel(User.class, "user");
		// String username = getPara("userName");
		// String password = getPara("password");
		System.out.println("用户名为：" + user.getUsername());
		System.out.println("密码为：" + user.getPassword());
		User user1 = User.findUserByName(user.getUsername());
		System.out.println("查询的密码为：" + user1.getPassword());
		if (user1.getPassword().equals(user1.getPassword()))
			render("main.jsp");

	}

}
