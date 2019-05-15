package com.mas.dto;

import java.io.Serializable;
import java.util.Date;

public class ServicesDTO implements Serializable {

	String sfrom;
	int sid;
	String sto;
	int bfare;
	int efare;
	String fnum;
	String dtime;
	String atime;
	String fname;
	int distance;
	double miles;
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getFnum() {
		return fnum;
	}
	public void setFnum(String fnum) {
		this.fnum = fnum;
	}
	public String getSfrom() {
		return sfrom;
	}
	public void setSfrom(String sfrom) {
		this.sfrom = sfrom;
	}
	public String getSto() {
		return sto;
	}
	public void setSto(String sto) {
		this.sto = sto;
	}
	public int getBfare() {
		return bfare;
	}
	public void setBfare(int bfare) {
		this.bfare = bfare;
	}
	public int getEfare() {
		return efare;
	}
	public void setEfare(int efare) {
		this.efare = efare;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public double getMiles() {
		return miles;
	}
	public void setMiles(double miles) {
		this.miles = miles;
	}
	
	
	
}
