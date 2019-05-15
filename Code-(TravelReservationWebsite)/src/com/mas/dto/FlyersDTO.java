package com.mas.dto;

import java.io.Serializable;

public class FlyersDTO implements Serializable {

	String userid;                
	String pwd;               
	String surname;          
	String fullname;              
	String dob;               
	String gender;            
	String email;             
	String mobile;            
	String dor;               
	String city;              
	String state;            
	String country;           
	String pin;               
	String maxmiles;               
	Float rmiles;         
	String title;             
	int benfitid;            
	String type;
	String questn;
	String ans;
	public String getQuestn() {
		return questn;
	}
	public void setQuestn(String questn) {
		this.questn = questn;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDor() {
		return dor;
	}
	public void setDor(String dor) {
		this.dor = dor;
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getMaxmiles() {
		return maxmiles;
	}
	public void setMaxmiles(String maxmiles) {
		this.maxmiles = maxmiles;
	}

	public Float getRmiles() {
		return rmiles;
	}
	public void setRmiles(Float rmiles) {
		this.rmiles = rmiles;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBenfitid() {
		return benfitid;
	}
	public void setBenfitid(int benfitid) {
		this.benfitid = benfitid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}  
	
private String  acctype;
	
	private String  bank;


	public String getAcctype() {
		return acctype;
	}
	
	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}
	
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	} 
	
	private float accbal;


	public float getAccbal() {
		return accbal;
	}
	public void setAccbal(float accbal) {
		this.accbal = accbal;
	}
	
}
