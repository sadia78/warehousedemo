package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class PostMailAction extends HttpServlet {

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
		String user=request.getSession().getAttribute("ownuser").toString();
		String to=request.getParameter("to");
		String sub=request.getParameter("subject");
		String body=request.getParameter("body");
		boolean flag=false;
		try{
			flag=new MasterDAO().insertMail(user,to,sub,body);
		}catch (Exception e) {
		    e.printStackTrace();
			// TODO: handle exception
		}
		if(flag){
			request.setAttribute("status", "Mail delivered successfully");
		}else
			request.setAttribute("status", "sending failed");
		
		RequestDispatcher rd=request.getRequestDispatcher("./ReplyMail.jsp");
		rd.forward(request, response);
		out.flush();
		out.close();
	}

}
