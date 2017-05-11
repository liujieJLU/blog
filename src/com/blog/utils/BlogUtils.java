package com.blog.utils;

import java.util.UUID;

public class BlogUtils {
	/**
	 * 获取 UUID
	 * 
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 对内容进行签名，使用MD5进行哈希
	 * 
	 * @param value
	 * @return
	 */
	public static String signByMD5(String value) {
		//
		return MD5Coder.encodeMD5Hex(value);
	}
}
