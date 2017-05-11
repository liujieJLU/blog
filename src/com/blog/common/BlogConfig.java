package com.blog.common;

import com.blog.controller.BlogController;
import com.blog.controller.TagController;
import com.blog.controller.UserController;
import com.blog.model._MappingKit;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;

public class BlogConfig extends JFinalConfig {

	public void configConstant(Constants me) {
		// 加载配置文件
		System.out.println("路径======：" + PathKit.getRootClassPath());
		PropKit.use("com/resource/jdbc.properties");
		// loadPropertyFile("com/resource/config.properties");
		// loadPropertyFile("jdbc.txt");

		me.setDevMode(true);// 打印调试的信息
		me.setViewType(ViewType.JSP);
	}

	// 设置拦截器加载常量
	public void afterJFinalStart() {
		JFinal.me().getServletContext()
				.setAttribute("token.css", PropKit.use("com/resource/config.properties").get("token.css"));
		JFinal.me().getServletContext()
				.setAttribute("token.js", PropKit.use("com/resource/config.properties").get("token.js"));
	}

	public void configRoute(Routes me) {
		me.add("/hello", BlogController.class);
		me.add("/admin/user", UserController.class, "/jsp/admin");
		me.add("/admin/tags", TagController.class, "/jsp/admin");
	}

	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		DruidPlugin dp = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("username"), PropKit.get(
				"password").trim());
		me.add(dp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		_MappingKit.mapping(arp);
		me.add(arp);
		// arp.addMapping("user", User.class);
	}

	public void configInterceptor(Interceptors me) {
	}

	public void configHandler(Handlers me) {
		// me.add(handler)
	}
}
