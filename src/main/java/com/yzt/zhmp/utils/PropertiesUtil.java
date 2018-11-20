package com.yzt.zhmp.utils;



import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * @author wang
 */
public class PropertiesUtil {

	private static Properties props;
	static {
		loadProps();
	}

	synchronized static private void loadProps() {
		System.out.println("读取配置文件config.properties");
		props = new Properties();
		InputStream in = null;
		try {
			// 第一种，通过类加载器进行获取properties文件流
			in = PropertiesUtil.class.getClassLoader().getResourceAsStream("config.properties");
			// 第二种，通过类进行获取properties文件流
			// in=PropertiesUtil.class.getResourceAsStream("config.properties");
			// 解决中文乱码问题
			props.load(new InputStreamReader(in, "UTF-8"));
		} catch (FileNotFoundException e) {
			System.out.println("config.properties文件未找到");
		} catch (IOException e) {
			System.out.println("出现IOException");
		} finally {
			try {
				if (null != in) {
					in.close();
				}
			} catch (IOException e) {
				System.out.println("config.properties文件流关闭出现异常");
			}
		}
	}

	public static String getProperty(String key) {
		if (null == props) {
			loadProps();
		}
		return props.getProperty(key);
	}

	public static String getProperty(String key, String defaultValue) {
		if (null == props) {
			loadProps();
		}
		return props.getProperty(key, defaultValue);
	}
	
	public static void main(String[] args) {

	}

}