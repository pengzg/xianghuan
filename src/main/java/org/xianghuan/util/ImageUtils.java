package org.xianghuan.util;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class ImageUtils {

	/**
	 * 指定是否按照比例缩放，指定大小进行缩放
	 * 
	 * @param srcImg
	 * @param desImg
	 * @param width
	 * @param height
	 * @param isRatio
	 * @return
	 */
	public static File resize(File srcImg, File desImg, int width, int height,
			boolean isRatio) {
		try {
			Thumbnails.of(srcImg).size(width, height).keepAspectRatio(isRatio)
					.toFile(desImg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return desImg;
	}

	/**
	 * 指定大小，然后按比例缩放 若图片横比200小，高比300小，不变 若图片横比200小，高比300大，高缩小到300，图片比例不变
	 * 若图片横比200大，高比300小，横缩小到200，图片比例不变 若图片横比200大，高比300大，图片按比例缩小，横为200或高为300
	 * 
	 * @param srcImg
	 * @param desImg
	 * @param width
	 * @param height
	 * @return
	 */
	public static File resize(File srcImg, File desImg, int width, int height) {
		return resize(srcImg, desImg, width, height, true);
	}

	/**
	 * 按照比例进行缩放
	 * 
	 * @param srcImg
	 * @param desImg
	 * @param scale
	 * @return
	 */
	public static File resize(File srcImg, File desImg, double scale) {

		try {
			Thumbnails.of(srcImg).scale(scale).toFile(desImg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return desImg;
	}

	/**
	 * 文件格式转换
	 * 
	 * @param srcImg
	 * @param desImg
	 * @param fileType
	 * @return
	 */
	public static File format(File srcImg, File desImg, String fileType,
			int width, int height) {
		try {
			Thumbnails.of(srcImg).size(width, height).outputFormat(fileType)
					.toFile(desImg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return desImg;
	}

	/**
	 * 文件格式转换
	 * 
	 * @param srcImg
	 * @param desImg
	 * @param fileType
	 * @return
	 */
	public static File format(File srcImg, File desImg, String fileType) {
		try {
			Thumbnails.of(srcImg).outputFormat(fileType).toFile(desImg);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return desImg;
	}

	/*
	 * 调用测试
	 */
	public static void main(String[] args) throws Exception {
	}
}