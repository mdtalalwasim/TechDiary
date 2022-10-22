package com.tech.diary.data.model;

/**
 *
 * @author Md. Talal Wasim
 */
public class Message {

    private String msgContent;
    private String type;
    private String cssClass;

    public Message(String msgContent, String type, String cssClass) {
        this.msgContent = msgContent;
        this.type = type;
        this.cssClass = cssClass;
    }

    //getter and setter....
    public String getContent() {
        return msgContent;
    }

    public void setContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
    
    

}
