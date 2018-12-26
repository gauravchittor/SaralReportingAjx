package com.saralReporting.bean;

import java.util.HashMap;

public class UserBean {
	
	private String sign_no;
	private String passwd;
	private String user_id;
	private String user_name;
	private String role_id;
	private String role_name;
	private String department_level_name;
	private String department_id;
	private String designation_id;
	private String designation_name;
	private String location_id;
	private String location_type_id;
	private String state_id;
	private String username;
    private String password;
    private String firstName;
    private String loginMessage;
    
    public String getLoginMessage() {
		return loginMessage;
	}
	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}
	private HashMap<String,String> role_list;
    
	public HashMap<String, String> getRole_list() {
		return role_list;
	}
	public void setRole_list(HashMap<String, String> role_list) {
		this.role_list = role_list;
	}
	public boolean valid;

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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSign_no() {
		return sign_no;
	}
	public void setSign_no(String sign_no) {
		this.sign_no = sign_no;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getDepartment_level_name() {
		return department_level_name;
	}
	public void setDepartment_level_name(String department_level_name) {
		this.department_level_name = department_level_name;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getDesignation_id() {
		return designation_id;
	}
	public void setDesignation_id(String designation_id) {
		this.designation_id = designation_id;
	}
	public String getDesignation_name() {
		return designation_name;
	}
	public void setDesignation_name(String designation_name) {
		this.designation_name = designation_name;
	}
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getLocation_type_id() {
		return location_type_id;
	}
	public void setLocation_type_id(String location_type_id) {
		this.location_type_id = location_type_id;
	}
	public String getState_id() {
		return state_id;
	}
	public void setState_id(String state_id) {
		this.state_id = state_id;
	}

    
}
