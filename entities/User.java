/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.librarymanagement.entities;


public class User {
    private int id;
     private String name;
      private String mobile;
       private String username;
        private String password;
         private String sec_qu;
          private String sec_ans;
           private String city;
             private String state;

    public User() {
    }

    public User(int id, String name, String mobile, String username, String password, String sec_qu, String sec_ans, String city, String state) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
        this.sec_qu = sec_qu;
        this.sec_ans = sec_ans;
        this.city = city;
        this.state = state;
    }

    public User(String name, String mobile, String username, String password, String sec_qu, String sec_ans, String city, String state) {
        this.name = name;
        this.mobile = mobile;
        this.username = username;
        this.password = password;
        this.sec_qu = sec_qu;
        this.sec_ans = sec_ans;
        this.city = city;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSec_qu() {
        return sec_qu;
    }

    public void setSec_qu(String sec_qu) {
        this.sec_qu = sec_qu;
    }

    public String getSec_ans() {
        return sec_ans;
    }

    public void setSec_ans(String sec_ans) {
        this.sec_ans = sec_ans;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
             
             
             
}
