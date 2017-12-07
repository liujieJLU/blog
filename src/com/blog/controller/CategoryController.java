package com.blog.controller;

import com.blog.common.BaseController;
import com.blog.common.GlobalConstants;
import com.blog.model.Category;
import com.blog.utils.BlogUtils;
import com.blog.utils.DateUtils;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;


public class CategoryController extends BaseController {
	
	public void index() {
		int pageNumber = 1;
		int startPage = 1;
		if (getPara(0) != "" && getPara(0) != null) {
			pageNumber = Integer.valueOf(getPara(0));
		}
		if (getPara("startPage") != "" && getPara("startPage") != null) {
			startPage = Integer.valueOf(getPara("startPage"));
		}
		int pageSize = 5;
		Page<Record> category = Category.paginate(pageNumber, pageSize);
		int pageCount = Category.pageNumber();
		System.out.println("当前页码查到的类别数量为：" + category.getTotalPage());
		setData("category", category);
		setData("pageCount", pageCount);
		setData("startPage", startPage);
		render("category.jsp");
	}
	
	public void addCategory(){
		try {
			Category category = getModel(Category.class, "category");
			if (category.getName() != null) {
				String id = BlogUtils.getUUID();
				if (Category.getNumberByName(category.getName()) != 0) {
					render(GlobalConstants.Code.FAILURE, "该类名已存在！");
				} else {
					category.setCdate(DateUtils.getCurrentDate());
					category.setId(id);
					if (category.save()) {
						render(GlobalConstants.Code.SUCCESS, "保存成功！");
					} else {
						render(GlobalConstants.Code.FAILURE, "保存失败！");
					}
				}
			} else {
				render(GlobalConstants.Code.FAILURE, "保存失败,类名丢失!");
			}
		} catch (Exception e) {
			render(GlobalConstants.Code.FAILURE, "保存，类名发生错误！");
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改标签信息
	 */
	public void editCategory(){
		Category category = getModel(Category.class, "category");
		if(category.getId() !=null && category.getName() !=null){
			if(Category.getNumberByName(category.getName()) !=0){
				render(GlobalConstants.Code.FAILURE, "该标签名已存在！");
			}else{
				System.out.println("category的id为："+ category.getId());
				if(category.update()){
					render(GlobalConstants.Code.SUCCESS, "修改成功！");
				}else{
					render(GlobalConstants.Code.FAILURE, "修改失败！");
				}
			}
		}else{
			render(GlobalConstants.Code.FAILURE, "标签信息丢失！");
		}
	}
	
	/*
	 * 删除标签
	 */
	public void delCategory() {
		String categoryId = getPara();
		if (categoryId != "" && categoryId != null) {
			boolean bool = Category.delCategory(categoryId);
			if (bool) {
				render(GlobalConstants.Code.FAILURE, "删除失败！");
			} else {
				render(GlobalConstants.Code.SUCCESS, "删除成功！");
			}
		} else {
			render(GlobalConstants.Code.FAILURE, "删除失败,标签ID丢失！");
		}
	}
	
	/**
	 * 查询现有标签
	 */
	public void findCategory() {
		
	}
}
