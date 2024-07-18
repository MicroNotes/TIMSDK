package com.tencent.qcloud.tuikit.tuichat.bean;

public class CclxMessageCardBean {

    private String text = "[皇包车卡片]"; //卡片展示文本
    private String title = ""; //内容标题
    private String imgUrl = ""; //主图片地址
    private String copyright = "皇包车旅行"; //来源：皇包车旅行
    private String action = ""; //跳转协议

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
