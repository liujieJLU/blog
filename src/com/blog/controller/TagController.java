package com.blog.controller;

import java.util.HashMap;

import com.blog.common.BaseController;
import com.blog.common.GlobalConstants;
import com.blog.model.Tags;
import com.blog.utils.BlogUtils;
import com.blog.utils.DateUtils;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 
 * @author liu jie
 * 
 * @date 2017年4月15日
 */
public class TagController extends BaseController {
	
	public void index() {
		render("tag.jsp");
	}
	
	/**
	 * 查询现有标签
	 */
	public void findTags() {
		int pageNumber = 1;
		if (getPara("pageNumber") != "" && getPara("pageNumber") != null) {
			pageNumber = Integer.valueOf(getPara("pageNumber"));
		}
		int pageSize = 5;
		Page<Record> tagsList = Tags.paginate(pageNumber, pageSize);
		int pageCount = Tags.pageNumber();
		System.out.println("当前页码查到的tags数量为：" + tagsList.getTotalPage());
		HashMap<String, Object> tagsMap = new HashMap<String, Object>();
		tagsMap.put("tagsList", tagsList);
		tagsMap.put("pageCount", pageCount);
		if (tagsList != null) {
			render(GlobalConstants.Code.SUCCESS, null, tagsMap);
		}
	}

	/*
	 * 增加标签页
	 */
	public void addTag() {
		try {
			Tags tags = getModel(Tags.class, "tags");
			if (tags.getName() != null) {
				String id = BlogUtils.getUUID();
				if (Tags.getNumberByName(tags.getName()) != 0) {
					render(GlobalConstants.Code.FAILURE, "该标签已存在！");
				} else {
					tags.setCdate(DateUtils.getCurrentDate());
					tags.setId(id);
					if (tags.save()) {
						render(GlobalConstants.Code.SUCCESS, "保存成功！");
					} else {
						render(GlobalConstants.Code.FAILURE, "保存失败！");
					}
				}
			} else {
				render(GlobalConstants.Code.FAILURE, "保存失败,标签名丢失!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * 删除标签
	 */
	public void delTag() {
		String tagId = getPara();
		if (tagId != "" && tagId != null) {
			boolean bool = Tags.delTag(tagId);
			if (bool) {
				render(GlobalConstants.Code.FAILURE, "删除失败！");
			} else {
				render(GlobalConstants.Code.SUCCESS, "删除成功！");
			}
		} else {
			render(GlobalConstants.Code.FAILURE, "删除失败,标签ID丢失！");
		}
	}
	
	public void editTag(){
		Tags tags = getModel(Tags.class, "tags");
		if(tags.getId() !=null && tags.getName() !=null){
			if(Tags.getNumberByName(tags.getName()) !=0){
				render(GlobalConstants.Code.FAILURE, "该标签名已存在！");
			}else{
				System.out.println("tags的id为："+ tags.getId());
				if(tags.update()){
					render(GlobalConstants.Code.SUCCESS, "修改成功！");
				}else{
					render(GlobalConstants.Code.FAILURE, "修改失败！");
				}
			}
		}else{
			render(GlobalConstants.Code.FAILURE, "标签信息丢失！");
		}
	}
}
