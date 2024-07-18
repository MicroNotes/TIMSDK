package com.tencent.qcloud.tuikit.tuichat.classicui.widget.message.viewholder;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.tencent.qcloud.tuikit.timcommon.bean.TUIMessageBean;
import com.tencent.qcloud.tuikit.timcommon.classicui.widget.message.MessageContentHolder;
import com.tencent.qcloud.tuikit.tuichat.CclxCardHelper;
import com.tencent.qcloud.tuikit.tuichat.R;
import com.tencent.qcloud.tuikit.tuichat.bean.message.CclxCardMessageBean;
import com.tencent.qcloud.tuikit.tuichat.util.TUIChatLog;

public class CclxCardMessageHolder extends MessageContentHolder {
    private TextView titleTv;
    private ImageView imgIv;
    private TextView copyRightTv;

    public CclxCardMessageHolder(View itemView) {
        super(itemView);
        titleTv = itemView.findViewById(R.id.cclx_card_message_title);
        imgIv = itemView.findViewById(R.id.cclx_card_message_img);
        copyRightTv = itemView.findViewById(R.id.cclx_card_message_copyright);
    }

    public static final String TAG = CclxCardMessageHolder.class.getSimpleName();

    @Override
    public int getVariableLayout() {
        return R.layout.cclx_card_message_layout;
    }

    @Override
    public void layoutVariableViews(TUIMessageBean msg, int position) {
        String title = "";
        String imgUrl = "";
        String copyRight = "";
        if (msg instanceof CclxCardMessageBean) {
            title = ((CclxCardMessageBean) msg).getTitle();
            imgUrl = ((CclxCardMessageBean) msg).getImgUrl();
            copyRight = ((CclxCardMessageBean) msg).getCopyRight();
        }

        titleTv.setText(title);
        flushImg(imgIv, imgUrl);
        if (!copyRight.isEmpty()) {
            copyRightTv.setText(copyRight);
        }
        msgContentFrame.setClickable(true);
        msgContentFrame.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (CclxCardHelper.getInstance().getListener() != null && msg instanceof CclxCardMessageBean) {
                    CclxCardHelper.getInstance().getListener().onCardClick((CclxCardMessageBean) msg);
                } else {
                    TUIChatLog.e(TAG, "点击卡片无监听或数据信息不匹配");
                }
            }
        });
    }

    private void flushImg(ImageView imgIv, String imgUrl) {
        switch (imgUrl) {
            case "1":
                imgIv.setImageResource(R.drawable.cclx_card_style_img_guide);
                break;
            case "2":
                imgIv.setImageResource(R.drawable.cclx_card_style_img_order);
                break;
            case "3":
                imgIv.setImageResource(R.drawable.cclx_card_style_img_roadbook);
                break;
            default:
                Glide.with(imgIv).load(imgUrl).centerCrop().placeholder(R.drawable.cclx_card_style_img_order).into(imgIv);
                break;
        }
    }
}
