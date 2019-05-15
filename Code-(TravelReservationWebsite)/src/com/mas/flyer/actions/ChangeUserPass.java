package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class ChangeUserPass extends HttpServlet {

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
     String pwd=request.getParameter("pwd");
     String userid=(String)request.getSession().getAttribute("ownuser");
     try{
	 boolean flag=new MasterDAO().changePass(userid,pwd);
  	 if(flag)
		request.setAttribute("status", "Password Updated successfully");
  	 else
  		request.setAttribute("status", "Password Updation failed");
     }catch(Exception e){
	   e.printStackTrace();
     }
     
     RequestDispatcher rd=request.getRequestDispatcher("./FlyerChangePass.jsp");
     rd.forward(request, response);
    out.flush();
    out.close();
   }


}
