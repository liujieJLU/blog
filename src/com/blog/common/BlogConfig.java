package com.blog.common;

import com.blog.blog.BlogController;
import com.blog.user.User;
import com.blog.user.UserController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;

public class BlogConfig extends JFinalConfig {
	
	public void configConstant(Constants me) {
		//加载配置文件
		System.out.println("路径======："+PathKit.getRootClassPath());
		loadPropertyFile("com/resource/config.properties");
//		loadPropertyFile("jdbc.txt");
		me.setDevMode(true);//打印调试的信息
		me.setViewType(ViewType.JSP);
	}

	public void configRoute(Routes me) {
		me.add("/hello", BlogController.class);
		me.add("/user", UserController.class);
	}
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"),getProperty("username"),getProperty("password").trim());
		me.add(dp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		me.add(arp);
		arp.addMapping("user",User.class);
	}

	public void configInterceptor(Interceptors me) {
	}

	public void configHandler(Handlers me) {
	}
}
