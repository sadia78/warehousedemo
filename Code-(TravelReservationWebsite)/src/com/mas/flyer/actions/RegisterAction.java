package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.core.util.DateWrapper;
import com.mas.dao.MasterDAO;
import com.mas.dto.FlyersDTO;

public class RegisterAction extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doPost(request, response);
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 String title=request.getParameter("title");
		    String surname=request.getParameter("surname");
		    String fullname=request.getParameter("fullname");
		    String gender=request.getParameter("gender");
		    String dob=DateWrapper.parseDate(request.getParameter("dob"));
		    String email=request.getParameter("email");
		    String mobile=request.getParameter("mobile");
		    String city=request.getParameter("city");
		    String state=request.getParameter("state");
		    String country=request.getParameter("country");
		    String pin=request.getParameter("pin");
		    String userid=request.getParameter("userid");
		    String pwd=request.getParameter("pwd");
		    String questn=request.getParameter("squest");
		    String ans=request.getParameter("ans");
		    String bank=request.getParameter("bank");
		    String acctype=request.getParameter("acctype");
		    float accbal=Float.parseFloat(request.getParameter("accbal"));
		    FlyersDTO fdto=new FlyersDTO();
		    fdto.setUserid(userid);
		    fdto.setPwd(pwd);
		    fdto.setQuestn(questn);
		    fdto.setAns(ans);
		    fdto.setTitle(title);
		    fdto.setSurname(surname);
		    fdto.setFullname(fullname);
		    fdto.setGender(gender);
		    fdto.setDob(dob);
		    fdto.setEmail(email);
		    fdto.setMobile(mobile);
		    fdto.setCity(city);
		    fdto.setState(state);
		    fdto.setCountry(country);
		    fdto.setPin(pin);
		    fdto.setBank(bank);
		    fdto.setAcctype(acctype);
		    fdto.setAccbal(accbal);
		    boolean flag=false;
		    try{
		    	flag=new MasterDAO().createNewAccount(fdto);		   
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
		    if(flag){
		    	response.sendRedirect("./FlyerLogin.jsp?status=<font color=green>Registration Suceess</font>");
		    }else
		    	response.sendRedirect("./Regustration.jsp?status=<font color=red>Registration failed</font>");
		out.flush();
		out.close();
	}

}
