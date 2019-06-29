package com.xianghuan.mobile.base.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xianghuan.jdbc.exception.BusinessException;
import org.xianghuan.util.DateUtil;
import org.xianghuan.util.Result;
import org.xianghuan.util.SmsUtils;
import org.xianghuan.util.StringUtil;
import org.xianghuan.util.SystemConstants;
import org.xianghuan.util.sms.SendViaWs;
import org.xianghuan.util.sms.SmsResultVO;

import com.xianghuan.admin.basetag.service.IBaseTagService;
import com.xianghuan.auth.base.cache.BaseDataDetailListCache;
import com.xianghuan.auth.base.cache.BaseParameterCache;
import com.xianghuan.auth.system.model.SysSms;
import com.xianghuan.auth.system.service.ISysSmsService;
import com.xianghuan.mobile.base.service.IAppBaseService;
import com.xianghuan.mobile.base.vo.Rep1001;
import com.xianghuan.mobile.base.vo.Rep1002;
import com.xianghuan.mobile.base.vo.Rep1003;
import com.xianghuan.mobile.base.vo.Req1001;
import com.xianghuan.mobile.base.vo.Req1002;
import com.xianghuan.mobile.base.vo.Req1003;
import com.xianghuan.util.BaseDataTypeCodeConstant;
import com.xianghuan.util.CommonConstants;
import com.xianghuan.util.RepBaseBean;

@Service("appBaseService")
public class AppBaseServiceImpl implements IAppBaseService{
	private static final Logger log = Logger.getLogger(AppBaseServiceImpl.class);
	@Autowired
	private ISysSmsService sysSmsService;
	
	@Autowired
	private IBaseTagService baseTagService;
	/**
	 * 发送短信
	 */
	@Override
	public Rep1001 sendSms(Req1001 req) {
		synchronized (this) {
			Rep1001 rep = new Rep1001();
			try {
				Result result = new Result<>();
				SmsUtils sms = new SmsUtils();
				SysSms sysSms = new SysSms();
				String template = "";
				String smsCode = "";
				String content = "";
				
				switch (req.getSmsType()+"") {
				//注册时候
				case SystemConstants.SYS_SMS_TYPE_1:
					
					// 注册码
					template = BaseParameterCache.getInstance().getValue("sms_reg");
					smsCode = StringUtil.random(4);
					if (StringUtils.isNotBlank(template)) {
						content = MessageFormat.format(template, new String[] { smsCode });
						result = sms.sendSms(req.getMobile(), content);
					}
					sysSms.setSs_type(SystemConstants.SYS_SMS_TYPE_1);
					break;
				//普通短信
				}
				
				SmsResultVO smsResultVO= SendViaWs.sendSms(req.getMobile(),"【享换】 您的短信验证码是"+smsCode+",五分钟有效,请查收 ");
				if(result.isFlag()){
					sysSms.setSs_status(SystemConstants.SUCCESS);
					rep.setRepCode(RepBaseBean.REQPCODE_SUC);
					rep.setRepMsg("短信已发送到您的手机，请注意查收！");
				}else{
					sysSms.setSs_status(SystemConstants.FILE);
					rep.setRepCode(RepBaseBean.REQPCODE_FAILD);
					rep.setRepMsg("短信发送失败");
				}
				sysSms.setSs_mobile(req.getMobile());
				sysSms.setSs_code(smsCode);
				sysSms.setSs_content(content);
				sysSms.setSs_msg(result.getMsg());
				sysSms.setSs_send_time(DateUtil.getCurrentDateToString2());
				sysSms.setSs_addtime(DateUtil.getCurrentDateToString2());
				sysSmsService.insert(sysSms);
				rep.setSuccess("短信发送成功");
			} catch (Exception e) {
				throw new BusinessException(rep.REQPCODE_FAILD,"发送短信失败！");
			}
			return rep;
		}
	}

	/**
	 * 上传图片 返回路径
	 */
	@Override
	public Rep1002 uploadImage(Req1002 req) {
		// TODO Auto-generated method stub
		Rep1002 rep = new Rep1002();
		if (StringUtils.isNotBlank(req.getImgStr())) {
			log.info("进入图片上传");
			
			try {
				log.info("==========11111111111=========================");
				byte[] b = Base64.decodeBase64(req.getImgStr().getBytes("UTF-8"));
				log.info("==========222222222=========================");
	            for(int i=0;i<b.length;++i)  
	            {  
	                if(b[i]<0)  
	                {//调整异常数据  
	                    b[i]+=256;  
	                }  
	            }  
	            //生成jpeg图片  
	            String saveRootPath = "/data/web/static/upload/image";
	            	 
	            // 根据公司分配上传路径
	            String dateStr = DateUtil.getCurrentDateToString();
	            String[] dateArr = dateStr.split("-");	 
	            
	            String imgFilePath = "/user/"+dateArr[0]+"/"+dateArr[1]+"/"+dateArr[2]+"/"+req.getUserId()+DateUtil.getCurrentDateToString5()+".jpg";
	            if (req.getType() ==2) {
	            	imgFilePath = "/house/"+dateArr[0]+"/"+dateArr[1]+"/"+dateArr[2]+"/"+req.getUserId()+DateUtil.getCurrentDateToString5()+".jpg";
	            }
	            
	            log.info("imgfilepath:"+imgFilePath);
	            File file = new File(saveRootPath+imgFilePath);
	            File parentPath = file.getParentFile();
	            log.info("图片路径是"+saveRootPath+imgFilePath);
	            log.info("==========4444444444444444444=========================");
	            parentPath.mkdirs();
	            file.createNewFile();
	            log.info("图片已经创建完成了");
	            OutputStream out = new FileOutputStream(saveRootPath+imgFilePath);      
	            out.write(b);  
	            out.flush();  
	            out.close();
	            log.info("图片上传完成");
	            
	            rep.setImgPath(imgFilePath);
	            rep.setSuccess("图片上传成功");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.info("上传图片报的异常 ："+e.getMessage());
				e.printStackTrace();
			} 
		}
		return rep;
	}

	/**
	 * 得到基础信息
	 */
	@Override
	public Rep1003 getBaseInfo(Req1003 req) {
		// TODO Auto-generated method stub
		Rep1003 rep = new Rep1003();
		
		rep.setPriceList(BaseDataDetailListCache.getInstance().get(BaseDataTypeCodeConstant.type_1013));
		rep.setRentTypeList(BaseDataDetailListCache.getInstance().get(BaseDataTypeCodeConstant.type_1004));
		rep.setHouseTypeList(BaseDataDetailListCache.getInstance().get(BaseDataTypeCodeConstant.type_1005));
		rep.setRoomTypeList(BaseDataDetailListCache.getInstance().get(BaseDataTypeCodeConstant.type_1006));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bt_type", CommonConstants.TYPE_HOUSE);
		map.put("bt_status", CommonConstants.STATUS_ON);
		map.put("bt_dr", CommonConstants.SAVE);
		rep.setTagList(baseTagService.select(map));
		rep.setSuccess("成功");
		return rep;
	}

}
