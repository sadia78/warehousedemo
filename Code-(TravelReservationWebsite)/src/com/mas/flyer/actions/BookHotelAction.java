package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mas.core.util.DateWrapper;
import com.mas.dao.MasterDAO;
import com.mas.dto.HotelDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.ServicesDTO;

public class BookHotelAction extends HttpServlet {

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
		JourneyDTO jdto=new JourneyDTO();
		PrintWriter out = response.getWriter();
		ArrayList<JourneyDTO> jlist=null;
		HttpSession session=request.getSession();
		int day=Integer.parseInt(request.getParameter("day"));
		
		System.out.println(day);
		String jdate=request.getParameter("doj");

       
			
			
		System.out.println(jdate);
	    String rdate=request.getParameter("dor");
	    System.out.println(rdate);
		int adults=Integer.parseInt(request.getParameter("adults"));
		System.out.println(adults);
		int chills=Integer.parseInt(request.getParameter("children"));
		System.out.println(chills);
		int person=adults+chills;
		HotelDTO hdto =(HotelDTO)session.getAttribute("hotel");
		 String hname=hdto.getHname();
		 System.out.println(hname);
		 String city=hdto.getCity();
		 System.out.println(city);
		 String type=hdto.getHotelhype();
	     System.out.println(type);
		 float charge=hdto.getCharge();
		
	     float	totalcharge=charge*day;
	     
	     System.out.println(totalcharge);
		
		if(totalcharge>0)
		{
			request.setAttribute("totalcharge", totalcharge);
			request.setAttribute("person", person);
			request.setAttribute("jdate", jdate);
			request.setAttribute("rdate", rdate);
			
			RequestDispatcher rd=request.getRequestDispatcher("HPayment.jsp");
			rd.forward(request, response);
		}else
			
			response.sendRedirect("./NoFlights.jsp");
		
		out.flush();
		out.close();
	}

}
