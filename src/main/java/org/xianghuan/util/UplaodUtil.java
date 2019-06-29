package org.xianghuan.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;
import org.xianghuan.web.model.Json;

/**
 * 文件控制器
 * 
 */
public class UplaodUtil {

	public static Json upload(HttpServletResponse response,
			HttpServletRequest request, String filepath)
			throws FileUploadException {
		Json j = new Json();
		String fileSavePath = FileConfigUtil.FILE_SAVE_PATH;
		String fileUrlPre = FileConfigUtil.FILE_URL_PRE;
		if (StringUtils.isBlank(filepath)) {
			filepath = "/excel";
		}
		// 文件保存目录路径
		String savePath = fileSavePath + filepath;
		// 文件保存目录URL
		String saveUrl = fileUrlPre + filepath;
		long maxSize = Long.parseLong(FileConfigUtil.get("maxFileSize")); // 允许上传最大文件大小(字节)
		if (!ServletFileUpload.isMultipartContent(request)) {
			j.setMsg("请选择文件！");
			return j;
		}
		// 检查目录
		File uploadDir = new File(savePath);
		if (!uploadDir.isDirectory()) {
			uploadDir.mkdirs();
		}
		// 检查目录写权限
		if (!uploadDir.canWrite()) {
			j.setMsg("上传目录没有写权限！");
			return j;
		}
		// 创建文件夹
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		//String dirName = "";
		SimpleDateFormat yearDf = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthDf = new SimpleDateFormat("MM");
		SimpleDateFormat dateDf = new SimpleDateFormat("dd");
		Date date = new Date();
		String dirName = "/" + yearDf.format(date) + "/" + monthDf.format(date) + "/"
				+ dateDf.format(date) + "/";
		savePath += dirName;
		saveUrl += dirName;
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		if (ServletFileUpload.isMultipartContent(request)) {// 判断表单是否存在enctype="multipart/form-data"
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {
				String fileName = item.getName();
				if (!item.isFormField()) {
					// 检查文件大小
					if (item.getSize() > maxSize) {
						j.setMsg("上传文件大小超过限制！(最大允许" + maxSize / 1024 + "k，您上传了"
								+ item.getSize() / 1024 + "k)");
						return j;
					}
					String newFileName = UUID.randomUUID().toString()
							.replaceAll("-", "")
							+ fileName;
					try {
						File uploadedFile = new File(savePath, newFileName);
						item.write(uploadedFile);
					} catch (Exception e) {
						j.setMsg("上传文件失败！");
						return j;
					}
					j.setSuccess(true);
					j.setMsg("上传成功");
					j.setObj(savePath + newFileName);
					return j;
				}
			}
		}
		return j;
	}
}
