package com.blog.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * 
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("blog", "id", Blog.class);
		// arp.addMapping("blog_tag", "", BlogTag.class);
		arp.addMapping("category", "id", Category.class);
		arp.addMapping("comment", "id", Comment.class);
		arp.addMapping("tags", "id", Tags.class);
		arp.addMapping("user", "id", User.class);
	}
}