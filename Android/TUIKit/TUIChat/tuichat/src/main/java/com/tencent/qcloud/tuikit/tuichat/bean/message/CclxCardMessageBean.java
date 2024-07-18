package com.tencent.qcloud.tuikit.tuichat.bean.message;

import android.text.TextUtils;

import com.google.gson.Gson;
import com.tencent.imsdk.v2.V2TIMMessage;
import com.tencent.qcloud.tuikit.timcommon.bean.TUIMessageBean;
import com.tencent.qcloud.tuikit.timcommon.bean.TUIReplyQuoteBean;
import com.tencent.qcloud.tuikit.tuichat.R;
import com.tencent.qcloud.tuikit.tuichat.TUIChatService;
import com.tencent.qcloud.tuikit.tuichat.bean.CclxMessageCardBean;
import com.tencent.qcloud.tuikit.tuichat.bean.message.reply.CustomLinkReplyQuoteBean;
import com.tencent.qcloud.tuikit.tuichat.util.TUIChatLog;

/**
 * 自定义消息卡片
 */
public class CclxCardMessageBean extends TUIMessageBean {
    private CclxMessageCardBean cclxMessageCardBean;

    @Override
    public String onGetDisplayString() {
        return getText();
    }

    @Override
    public void onProcessMessage(V2TIMMessage v2TIMMessage) {
        String data = new String(v2TIMMessage.getCustomElem().getData());
        if (!TextUtils.isEmpty(data)) {
            try {
                cclxMessageCardBean = new Gson().fromJson(data, CclxMessageCardBean.class);
            } catch (Exception e) {
                TUIChatLog.e("CclxCardMessageBean", "exception e = " + e);
            }
        }
        if (cclxMessageCardBean != null) {
            setExtra(cclxMessageCardBean.getText());
        } else {
            String text = TUIChatService.getAppContext().getString(R.string.no_support_msg);
            setExtra(text);
        }
    }

    public String getText() {
        if (cclxMessageCardBean != null) {
            return cclxMessageCardBean.getText();
        }
        return getExtra();
    }

    public String getTitle() {
        if (cclxMessageCardBean != null) {
            return cclxMessageCardBean.getTitle();
        }
        return "";
    }

    public String getImgUrl() {
        if (cclxMessageCardBean != null) {
            return cclxMessageCardBean.getImgUrl();
        }
        return "";
    }

    public String getCopyRight() {
        if (cclxMessageCardBean != null) {
            return cclxMessageCardBean.getCopyright();
        }
        return "";
    }

    public String getAction() {
        if (cclxMessageCardBean != null) {
            return cclxMessageCardBean.getAction();
        }
        return "";
    }

    public CclxMessageCardBean getCclxMessageCardBean() {
        return cclxMessageCardBean;
    }

    @Override
    public Class<? extends TUIReplyQuoteBean> getReplyQuoteBeanClass() {
        return CustomLinkReplyQuoteBean.class;
    }
}
