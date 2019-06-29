package org.xianghuan.util;

import java.util.ResourceBundle;

public class FileConfigUtil {

	private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("file");
	public static final String IMAGE;
	public static final String FLASH;
	public static final String MEDIA;
	public static final String FILE;
	public static final long MAX_FILE_SIZE;
	public static final String FILE_URL_PRE;
	public static final String FILE_SAVE_PATH;
	public static final int THUMBNAIL_WIDTH;
	public static final int THUMBNAIL_HEIGHT;
	public static final String THUMBNAIL_IMG_SUF;
	public static final String THUMBNAIL_IMG_TYPE;
	public static final String HEADCOVERSAVEPATH;
	public static final String BBSTOPICSAVEPATH;
	public static final String ACTIVITYSAVEPATH;
	public static final String ACTIVITYTESTSAVEPATH;
	//本地测试
	public static final String ACTIVITYLOCALSAVEPATH;
	
	
	static{
		IMAGE = get("image");
		FLASH = get("flash");
		MEDIA = get("media");
		FILE = get("file");
		MAX_FILE_SIZE = Long.parseLong(get("maxFileSize"));
		FILE_URL_PRE = get("fileUrlPre");
		FILE_SAVE_PATH = get("fileSavePath");
		THUMBNAIL_WIDTH = Integer.parseInt(get("thumbnailWidth"));
		THUMBNAIL_HEIGHT = Integer.parseInt(get("thumbnailheight"));
		THUMBNAIL_IMG_SUF = get("thumbnailImgSuf");
		THUMBNAIL_IMG_TYPE = get("thumbnailImgType");
		HEADCOVERSAVEPATH  = get("headCoverSavePath");
		BBSTOPICSAVEPATH = get("bbstopicsavepath");
		//正式环境活动上传路径
		ACTIVITYSAVEPATH = get("activitysavepath");
		//测试环境的活动上传路径
		ACTIVITYTESTSAVEPATH = get("activityTestsavepath");
		ACTIVITYLOCALSAVEPATH = get("activitylocalsavepath");

	}

	/**
	 * 获得sessionInfo名字
	 * 
	 * @return
	 */
	public static final String getSessionInfoName() {
		return bundle.getString("sessionInfoName");
	}

	/**
	 * 通过键获取值
	 * 
	 * @param key
	 * @return
	 */
	public static final String get(String key) {
		return bundle.getString(key);
	}

}
