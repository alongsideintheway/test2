package com.chzu.pojo;

public class Teacher {
    private int wid;
    private String name;
    private int age;
    private String sex;
    private String detail;
    private String title;
    private int iphone;
    private String email;

    public Teacher() {
    }

    public Teacher(int wid, String name, int age, String sex, String detail, String title, int iphone, String email) {
        this.wid = wid;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.detail = detail;
        this.title = title;
        this.iphone = iphone;
        this.email = email;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIphone() {
        return iphone;
    }

    public void setIphone(int iphone) {
        this.iphone = iphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
