package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.UserDAO;

public class HowManyPointsINeed extends HttpServlet {

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
	    String from=request.getParameter("from");
	    String to=request.getParameter("to");
	    try{
	    	int distance=new UserDAO().getDistance(from,to);
	    	
	    	if(distance==0){
	    		request.setAttribute("status", "there is no service provided between selected points");
	    	}
	    	else
	    	{
	    		double points=distance*0.2;
	    		request.setAttribute("status", "You Need "+points+"points");
	    	}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    RequestDispatcher rd=request.getRequestDispatcher("./UserHome.jsp");
	    rd.forward(request, response);
		out.flush();
		out.close();
	}

}
