package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mas.UDExceptions.DataAcessException;
import com.mas.UDExceptions.DataNotFoundException;
import com.mas.dao.MasterDAO;
public class LoginAction extends HttpServlet {

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
		RequestDispatcher rd=null;
		String target="FlyerLogin.jsp?status=<font color=red>invalid userid/password</font>";
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		  session.setAttribute("amount",0.0);
          session.setAttribute("payment",0.0);
		String user=request.getParameter("userid");		
		String pwd=request.getParameter("userpwd");
		try{
		    String type=new MasterDAO().isAuthenticated(user,pwd);
		    if(type.equals("admin"))
		    {
		    	session.setAttribute("ownuser", user);
		    	session.setAttribute("usertype", type);
		    	target="AdminHome.jsp";
			}else if(type.equals("flyer"))
			{
				 session.setAttribute("ownuser", user);
				 session.setAttribute("loginuser", user);
				 session.setAttribute("usertype", type);
				 target="UserHome.jsp";
			}
		}catch(DataAcessException de){
			de.printStackTrace();
		}catch(DataNotFoundException dn){
			dn.printStackTrace();
		}
		rd=request.getRequestDispatcher(target);
		rd.forward(request, response);
		out.flush();
		out.close();
	}

}
