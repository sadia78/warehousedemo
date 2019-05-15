package com.mas.dto;

import java.io.Serializable;

public class StatusDTO implements Serializable {
  String fnumber;
  int capacity;
  int available;
  int reserved;
  int sid;
  String dtime;
  String atime;
  String from;
  String to;
public String getFrom() {
	return from;
}
public void setFrom(String from) {
	this.from = from;
}
public String getTo() {
	return to;
}
public void setTo(String to) {
	this.to = to;
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
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public String getFnumber() {
	return fnumber;
}
public void setFnumber(String fnumber) {
	this.fnumber = fnumber;
}
public int getCapacity() {
	return capacity;
}
public void setCapacity(int capacity) {
	this.capacity = capacity;
}
public int getAvailable() {
	return available;
}
public void setAvailable(int available) {
	this.available = available;
}
public int getReserved() {
	return reserved;
}
public void setReserved(int reserved) {
	this.reserved = reserved;
}


}
