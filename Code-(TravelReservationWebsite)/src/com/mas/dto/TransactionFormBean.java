package com.mas.dto;

public class TransactionFormBean {

	
	
	private String user;
	private String fname;
	private String lname;
		private String bdate;
		private String email;
		private String acctype;
		private int accno;
		private float accbal;
		public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getLname() {
			return lname;
		}
		public void setLname(String lname) {
			this.lname = lname;
		}
		public String getBdate() {
			return bdate;
		}
		public void setBdate(String bdate) {
			this.bdate = bdate;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getAcctype() {
			return acctype;
		}
		public void setAcctype(String acctype) {
			this.acctype = acctype;
		}
		public int getAccno() {
			return accno;
		}
		public void setAccno(int accno) {
			this.accno = accno;
		}
		public float getAccbal() {
			return accbal;
		}
		public void setAccbal(float accbal) {
			this.accbal = accbal;
		}
	
	private String photo;
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	private float tamount;
	private String ttype;
	public float getTamount() {
		return tamount;
	}
	public void setTamount(float tamount) {
		this.tamount = tamount;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	
}
