package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.dao.MasterDAO;
import com.mas.dto.FlightDTO;
public class ViewFlights extends HttpServlet {

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
		try{
	    ArrayList<FlightDTO> flist=new MasterDAO().getFlights();
	    if(!flist.isEmpty()){
//		     request.getSession().setAttribute("flights", flist);
	    	 request.setAttribute("flist", flist);
		     RequestDispatcher rd=request.getRequestDispatcher("ViewFlights.jsp");
		     rd.forward(request, response);
		}
	    else
	    {
	    	 request.setAttribute("flist", flist);
		     RequestDispatcher rd=request.getRequestDispatcher("ViewFlights.jsp");
		     rd.forward(request, response);
	    	
	    }
		}catch(Exception e){
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
