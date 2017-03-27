package com.blog.blog;

import com.jfinal.core.Controller;

public class BlogController extends Controller{
	
	public void index() {
		renderText("Hello JFinal World.");
		}
}
