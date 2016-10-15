package com.zx.stlife.tools.weixin;

import java.io.UnsupportedEncodingException;

import com.zx.stlife.constant.Const;

public class HeepaySubmit {

    // 提交构建提交url
    public SubmitReturn SubmitUrl(GatewayModel gatewayModel)
            throws UnsupportedEncodingException {
        SubmitReturn submitReturn = new SubmitReturn();

        String sign = GatewayHelper.SignMd5(Const.HEEPAY_AGENT_KEY,
                gatewayModel);// 构建签名
        String StrUrl = GatewayHelper.GatewaySubmitUrl(sign, gatewayModel);// 构建提交地址

        submitReturn.set_success(true);
        submitReturn.set_error_message(StrUrl);

        return submitReturn;
    }

    public SubmitReturn SubmitQueryString(GatewayModel gatewayModel)
            throws UnsupportedEncodingException {

        SubmitReturn submitReturn = new SubmitReturn();

        String sign = GatewayHelper.SignQueryMd5(Const.HEEPAY_AGENT_KEY,
                gatewayModel);// 构建签名
        String QureyStr = GatewayHelper.GatewaySubmitQuery(sign, gatewayModel);// 构建提交地址

        // 此处默认为成功
        // 需要加判断，后期完善，需要处理好异常情况
        submitReturn.set_success(true);
        submitReturn.set_error_message(QureyStr);

        return submitReturn;
    }
}
