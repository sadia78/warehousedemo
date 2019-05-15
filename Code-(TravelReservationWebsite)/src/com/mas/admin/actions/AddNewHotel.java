package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class AddNewHotel extends HttpServlet {

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
		doPost(request,response);
		
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
	    String hname=request.getParameter("hname");
	    String city=request.getParameter("city");
	    String street=request.getParameter("street");
	    String mobile=request.getParameter("mobile");
	    String country=request.getParameter("country");
	   
	   
	    
	    int roomcapacity=Integer.parseInt(request.getParameter("rcapacity"));
	    Float charge=Float.parseFloat(request.getParameter("charge"));  
	    int acroomcapacity=Integer.parseInt(request.getParameter("acrcapacity"));
	    int nonacroomcapacity=Integer.parseInt(request.getParameter("nonacrcapacity"));   
	    int accharge=Integer.parseInt(request.getParameter("accharge"));   
	    int nonaccharge=Integer.parseInt(request.getParameter("nonaccharge"));
	    String hoteltype=request.getParameter("hoteltype");
	    
	    
	    try{
	    	boolean flag=new MasterDAO().insertNewHotel(hname,city,street,charge,mobile,country,roomcapacity,acroomcapacity,nonacroomcapacity,accharge,nonaccharge,hoteltype);
	    	if(flag){
	    		response.sendRedirect("AddHotel.jsp?status=<font color=red>Added successfully</font>");
	    	}else
	    		response.sendRedirect("AddHotel.jsp?status=<font color=red>Sorry updation failed</font>");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		out.flush();
		out.close();
	}

}
