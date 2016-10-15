package com.zx.stlife.tools.weixin;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class GatewayHelper {

    public static String SignMd5(String key, GatewayModel gatewayModel) {
        StringBuilder _StringSign = new StringBuilder();

        _StringSign
                .append("version=1")
                .append("&agent_id=" + gatewayModel.getagent_id())
                .append("&agent_bill_id=" + gatewayModel.getagent_bill_id())
                .append("&agent_bill_time=" + gatewayModel.getagent_bill_time())
                .append("&pay_type=" + gatewayModel.getpay_type());

        _StringSign.append("&pay_amt=" + gatewayModel.getpay_amt())
                .append("&notify_url=" + gatewayModel.getnotify_url())

                .append("&user_ip=" + gatewayModel.getuser_ip());

        _StringSign.append("&key=" + key);
        return MD5Tools.MD5(_StringSign.toString()).toLowerCase();
    }

    @SuppressWarnings("deprecation")
    public static String GatewaySubmitUrl(String sign, GatewayModel gatewayModel)
            throws UnsupportedEncodingException {
        StringBuilder sbURL = new StringBuilder();
        sbURL.append("version=" + gatewayModel.getversion());
        sbURL.append("&pay_type=" + gatewayModel.getpay_type());

        sbURL.append("&agent_id=" + gatewayModel.getagent_id());
        sbURL.append("&agent_bill_id=" + gatewayModel.getagent_bill_id());
        sbURL.append("&pay_amt=" + gatewayModel.getpay_amt());

        sbURL.append("&notify_url=" + gatewayModel.getnotify_url());
        sbURL.append("&return_url=" + gatewayModel.getreturn_url());
        sbURL.append("&user_ip=" + gatewayModel.getuser_ip());
        sbURL.append("&agent_bill_time=" + gatewayModel.getagent_bill_time());
        sbURL.append("&goods_name="
                + URLEncoder.encode(gatewayModel.getgoods_name()));
        sbURL.append("&goods_num=" + gatewayModel.getgoods_num());
        sbURL.append("&remark=" + URLEncoder.encode(gatewayModel.getremark()));

        sbURL.append("&goods_note="
                + URLEncoder.encode(gatewayModel.getgoods_note()));
        sbURL.append("&sign=" + sign);
        return sbURL.toString();
    }

    // 锟姐付锟斤拷锟斤拷询锟斤拷锟斤拷签锟斤拷
    public static String SignQueryMd5(String key, GatewayModel gatewayModel) {
        StringBuilder _StringSign = new StringBuilder();

        _StringSign.append("version=" + gatewayModel.getversion())
                .append("&agent_id=" + gatewayModel.getagent_id())
                .append("&agent_bill_id=" + gatewayModel.getagent_bill_id())

                .append("&key=" + key);
        return MD5Tools.MD5(_StringSign.toString()).toLowerCase();
    }

    // 锟姐付锟斤拷锟斤拷询锟斤拷锟斤拷锟结交url锟斤拷址
    public static String GatewaySubmitQuery(String sign,
            GatewayModel gatewayModel) throws UnsupportedEncodingException {
        StringBuilder sbURL = new StringBuilder();
        sbURL.append("version=1");
        sbURL.append("&agent_id=" + gatewayModel.getagent_id());
        sbURL.append("&agent_bill_id=" + gatewayModel.getagent_bill_id());

        sbURL.append("&sign=" + sign);

        return sbURL.toString();
    }
}
