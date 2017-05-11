package com.blog.common;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Controller;

/**
 * 基本控制器，其他控制器的基类
 * 
 * @author liu jie
 * 
 */
public class BaseController extends Controller {
	/**
	 * 配置项目路径
	 * 
	 * @return
	 */
	protected String getConfigUrl() {
		HttpServletRequest request = getRequest();
		String context = getRequest().getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + context;
		System.out.println(basePath);
		return basePath;
	}

	/**
	 * 设置响应码
	 */
	protected Controller setCode(int code) {
		return setAttr(GlobalConstants.CODE, code);
	}

	/**
	 * 设置响应消息
	 */
	protected Controller setMsg(String message) {
		if (message == null) {
			return this;
		}
		return setAttr(GlobalConstants.MESSAGE, message);
	}

	/**
	 * 设置响应数据
	 */
	protected Controller setData(Object data) {
		if (data == null) {
			return this;
		}
		return setAttr(GlobalConstants.DATA, data);
	}

	protected void render() {
		// 如果没有设置响应码，则添加默认响应码
		if (getAttr(GlobalConstants.CODE) == null) {
			// 添加默认响应码
			setAttr(GlobalConstants.CODE, GlobalConstants.Code.SUCCESS);
		}
		// 渲染JSON数据
		renderJson();
	}

	protected void render(int code) {
		setCode(code);
		// 渲染JSON数据
		renderJson();
	}

	protected void render(int code, String msg) {
		setCode(code);
		setMsg(msg);
		// 渲染JSON数据
		renderJson();
	}

	protected void render(int code, String msg, Object data) {
		setCode(code);
		setMsg(msg);
		setData(data);
		// 渲染JSON数据
		renderJson();
	}
}
