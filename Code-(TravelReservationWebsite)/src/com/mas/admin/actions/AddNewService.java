package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;

public class AddNewService extends HttpServlet {

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
        String target="AddServices.jsp?status=<font color=red>Ading Failed may be same service exist/Try again</font>";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String sfrom=request.getParameter("sfrom");
		String sto=request.getParameter("sto");
		String fnumber=request.getParameter("fnumber");
		int bfare=Integer.parseInt(request.getParameter("bfare"));
		int efare=Integer.parseInt(request.getParameter("efare"));
		String dtime=request.getParameter("dhr");
		dtime+="-";
		dtime+=request.getParameter("dmin");
	    String atime=request.getParameter("ahr");
	    atime+="-";
	    atime+=request.getParameter("amin");
	    int distance=Integer.parseInt(request.getParameter("distance"));
		try{
			boolean flag=new MasterDAO().insertNewService(sfrom, sto,fnumber, bfare, efare ,dtime ,atime,distance);
			if(flag){
				target="AddServices.jsp?status=<font color=red>Service Added Successfully</font>";		
			}				
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(target);
		out.flush();
		out.close();
	}

}
