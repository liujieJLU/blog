package com.blog.controller;

import java.util.List;

import org.apache.log4j.Logger;

import com.blog.common.BaseController;
import com.blog.model.Blog;
import com.blog.model.Category;
import com.blog.model.Tags;

public class BlogController extends BaseController{
	
	private final Logger logger = Logger.getLogger(getClass());
	
	public void index() {
		render("/login.jsp");
		}
	
	public void addBlog() {
		List<Tags> tagsList = Tags.getAllTage();
		setData("tagsList", tagsList);
		List<Category> categoryList =Category.getAllCategory();
		setData("categoryList", categoryList);
		render("addBlog.jsp");
	}
	
	public void saveBlog() {
		Blog blog = getModel(Blog.class, "blog");
		System.out.println("============:" + blog.getTitle());
	}
}
