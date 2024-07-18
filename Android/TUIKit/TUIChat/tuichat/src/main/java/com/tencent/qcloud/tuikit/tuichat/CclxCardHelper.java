package com.tencent.qcloud.tuikit.tuichat;

import com.tencent.qcloud.tuikit.tuichat.bean.message.CclxCardMessageBean;

public class CclxCardHelper {

    private static volatile CclxCardHelper helper;

    private CclxCardHelper() {
    }

    public static CclxCardHelper getInstance() {
        if (helper == null) {
            synchronized (CclxCardHelper.class) {
                if (helper == null) {
                    helper = new CclxCardHelper();
                }
            }
        }
        return helper;
    }

    private OnCclxCardListener listener;

    public OnCclxCardListener getListener() {
        return listener;
    }

    public void setListener(OnCclxCardListener listener) {
        this.listener = listener;
    }

    public interface OnCclxCardListener {
        void onCardClick(CclxCardMessageBean bean);
    }
}
