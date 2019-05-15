package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mas.core.util.DateWrapper;
import com.mas.dao.MasterDAO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.ServicesDTO;

public class GetFareDetails extends HttpServlet {

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
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String jtype=request.getParameter("journey");	
		int adults=Integer.parseInt(request.getParameter("adults"));
		int chills=Integer.parseInt(request.getParameter("children"));
		
		try{
			if(jtype!=null && jtype.equals("return"))
			{
//			    int dod=Integer.parseInt(request.getParameter("dod"));
//			    int dom=Integer.parseInt(request.getParameter("dom"));
//			    int doy=Integer.parseInt(request.getParameter("doy"));
//			    int rod=Integer.parseInt(request.getParameter("rod"));
//			    int rom=Integer.parseInt(request.getParameter("rom"));
//			    int roy=Integer.parseInt(request.getParameter("roy"));
//              Integer.toString(dod)+"/"+Integer.toString(dom)+"/"+Integer.toString(doy)
//              Integer.toString(rod)+"/"+Integer.toString(rom)+"/"+Integer.toString(roy);
				/*
				 * jdto.setDod(dod);
			    jdto.setDom(dom);
			    jdto.setDoy(doy);
			    jdto.setRod(rod);
			    jdto.setDom(dom);
			    jdto.setDoy(doy);
			    
			    
			    jdto.setDod(dod);
				    jdto.setDom(dom);
				    jdto.setDoy(doy);	
				 * */
				
				
				
				String jdate=request.getParameter("doj");
			    String rdate=request.getParameter("dor");
			    jdto.setFrom(from);
			    jdto.setTo(to);
			    jdto.setJtype(jtype);
			    jdto.setJdate(jdate);
			    jdto.setRdate(rdate);
			    jdto.setAdults(adults);
			    jdto.setChills(chills);
			    jdto.setJdate(jdate);
			    jdto.setRdate(rdate);
			    jlist=new MasterDAO().checkTwoWayAvailability(jdto);
			}
			else if(jtype!=null && jtype.equals("oneway")){
//				    int dod=Integer.parseInt(request.getParameter("dod"));
//				    int dom=Integer.parseInt(request.getParameter("dom"));
//				    int doy=Integer.parseInt(request.getParameter("doy"));
//				    String jdate=Integer.toString(dod)+"/"+Integer.toString(dom)+"/"+Integer.toString(doy);				   
				    jdto.setFrom(from);
				    jdto.setTo(to);
				    jdto.setJtype(jtype);
				    jdto.setJdate(request.getParameter("doj"));
				    			   
				    jdto.setAdults(adults);
				    jdto.setChills(chills);
				    jlist=new MasterDAO().checkOneWayAvailability(jdto);
			}
		  
		}catch(Exception e){
			e.printStackTrace();
		}
		if(!jlist.isEmpty())
		{
			request.setAttribute("journey", jlist);
			request.setAttribute("jtype", jdto.getJtype());
			RequestDispatcher rd=request.getRequestDispatcher("GetFareDetails.jsp");
			rd.forward(request, response);
		}else
			
			response.sendRedirect("./NoFlights.jsp");
		
		out.flush();
		out.close();
	}

}
