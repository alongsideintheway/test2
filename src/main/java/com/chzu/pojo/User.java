package com.chzu.pojo;

public class User {
    private int account;
    private String password;
    private int type;
    private String uname;
    private int wid;

    public User(int account, String password, int type, String uname, int wid) {
        this.account = account;
        this.password = password;
        this.type = type;
        this.uname = uname;
        this.wid = wid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public int getAccount() {
        return account;
    }

    public void setAccount(int account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
