package com.blog.controller;

import java.util.List;

import com.blog.common.BaseController;
import com.blog.model.Tags;

public class BlogController extends BaseController{
	
	public void index() {
		render("/login.jsp");
		}
	
	public void addBlog() {
		List<Tags> tagsList = Tags.getAllTage();
		setData("tagsList", tagsList);
		render("addBlog.jsp");
	}
}
