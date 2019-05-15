package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class DeleteBooking extends HttpServlet {

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
		String target="./GetBookingDetail";
		String fnum=request.getParameter("fnumber");
		System.out.println(fnum);
		String fname=request.getParameter("fname");
		System.out.println(fname);
		String from=request.getParameter("from");
		System.out.println(from);
		String to=request.getParameter("to");
		System.out.println(to);
		String doj=request.getParameter("doj");
		System.out.println(doj);
		try{
			boolean flag=new MasterDAO().deleteBooking(fnum,fname,from,to,doj);
			System.out.println(flag);
			if(flag){
				target="./GetBookingDetail";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect(target);
		out.flush();
		out.close();
	}

}
