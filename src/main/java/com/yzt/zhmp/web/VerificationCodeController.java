package com.yzt.zhmp.web;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.yzt.zhmp.service.SystemService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


/**
 * 获取验证码
 *
 * @author wangyinglong
 */
@Controller
public class VerificationCodeController {

    @Autowired
    SystemService systemService;

    /**
     * 获取验证码,并且判断两分钟之内不能重复获取
     *
     * @param telephone 手机号
     * @param response
     * @throws IOException
     * @throws ClientException
     */
    @PostMapping("/getVerificationCode")
    @CrossOrigin
    public void verificationCode(String telephone, HttpServletResponse response) throws IOException, ClientException {
        JSONObject jsonObject;
        long currentTime = System.currentTimeMillis();
        Date lastDate = systemService.getLast(telephone);
        long lastTime = lastDate.getTime();
        long intervalTime = currentTime - lastTime;
        //两分钟之内只发送一次
        if (intervalTime > 120000) {
            jsonObject = getVerificationCode(telephone);
            response.getWriter().write(jsonObject.toString());
        } else {
            response.getWriter().write("请2分钟后再试!");
        }
    }

    /**
     * @param telephone 手机号
     * @throws ClientException
     * @throws IOException
     */
    private JSONObject getVerificationCode(String telephone) throws ClientException, IOException {
        String vcode = RandomStringUtils.randomNumeric(4);
        SendSmsResponse sendSmsResponse = sendSms(telephone, vcode);
        JSONObject jsonObject = new JSONObject();
        if (null == sendSmsResponse) {
            jsonObject.put("msg", "获取验证码失败");
            return jsonObject;
        }
        //将验证码信息保存到数据库
        systemService.generateVerificationCode(vcode, telephone);
        jsonObject.put("msg", "获取验证码成功");
        jsonObject.put("vcode", vcode);
        jsonObject.put("ResultCode", sendSmsResponse.getCode());
        jsonObject.put("Message", sendSmsResponse.getMessage());
        jsonObject.put("RequestId", sendSmsResponse.getRequestId());
        jsonObject.put("BizId", sendSmsResponse.getBizId());
        return jsonObject;
    }

    /**
     * 阿里短信api
     *
     * @param telephone 手机号
     * @param vcode     验证码
     * @return
     * @throws ClientException
     */
    private static SendSmsResponse sendSms(String telephone, String vcode) throws ClientException {
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        /*
        不同账户修改accessKeyId,secret,SignName(短信签名),TemplateCode(模板编号)
         */
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIk78SqSaLG51X", "MUZiLi00JKufat7lsANmcWTvJOeWCg");
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi", "dysmsapi.aliyuncs.com");
        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendSmsRequest request = new SendSmsRequest();
        request.setPhoneNumbers(telephone);
        request.setSignName("一张图科技");
        request.setTemplateCode("SMS_150573489");
        request.setTemplateParam("{\"code\":\"" + vcode + "\"}");
        request.setOutId("yourOutId");
        try {
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            return sendSmsResponse;
        } catch (ClientException e) {
            return null;
        }
    }

}
