package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.UserDAO;
import com.mas.dto.FlyersDTO;

public class UpdateUserProfile extends HttpServlet {

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
	    String email=request.getParameter("email");
	    String mobile=request.getParameter("mobile");
	    String city=request.getParameter("city");
	    String state=request.getParameter("state");
	    String country=request.getParameter("country");
	    String pin=request.getParameter("pin");
	    FlyersDTO fdto=new FlyersDTO();
	    fdto.setTitle(title);
	    fdto.setSurname(surname);
	    fdto.setFullname(fullname);
	    fdto.setGender(gender);
	    fdto.setEmail(email);
	    fdto.setMobile(mobile);
	    fdto.setCity(city);
	    fdto.setState(state);
	    fdto.setCountry(country);
	    fdto.setPin(pin);
	    fdto.setUserid((String)request.getSession().getAttribute("ownuser"));
	    try{
	    	boolean flag=new UserDAO().updateProfile(fdto);
	    	if(flag){
	    		response.sendRedirect("./UserHome.jsp?status=profile updated successfully");
	    	}else
	    		response.sendRedirect("./UserHome.jsp?status=profile updation failed/try again");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		out.flush();
		out.close();
	}

}
