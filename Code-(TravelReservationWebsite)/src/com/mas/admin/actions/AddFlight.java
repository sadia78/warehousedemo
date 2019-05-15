package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class AddFlight extends HttpServlet {

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
        String target="AddFlight.jsp?status=<font color=red>Sorry Adding Failed Try again</font>";
		response.setContentType("text/html");
		int distance1=0,distance=0;
		PrintWriter out = response.getWriter();
		String fnum=request.getParameter("fnumber");
		String fname=request.getParameter("fname");
		int capacity=Integer.parseInt(request.getParameter("capacity"));
		String avail[]=request.getParameterValues("avail");
		
		try{
		   boolean flag=new MasterDAO().addNewFlight(fnum,fname,capacity,avail);
		    if(flag){
			  target="AddFlight.jsp?status=<font>Flight added successfully</font>";
		    }		 
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect(target);
		
	}

}
