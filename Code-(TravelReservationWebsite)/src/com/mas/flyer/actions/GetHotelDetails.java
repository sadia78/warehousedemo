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
import com.mas.dto.HotelDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.ServicesDTO;

public class GetHotelDetails extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doPost(request,response);
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String city=request.getParameter("city");
		System.out.println(city);
		
		ArrayList<HotelDTO> slist = null;
		try {
			slist = new MasterDAO().getHotels(city);
			System.out.println(slist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!slist.isEmpty())
		{
			request.setAttribute("journey", slist);
			RequestDispatcher rd=request.getRequestDispatcher("GetHotelDetails.jsp");
			rd.forward(request, response);
		}else
			
		
			response.sendRedirect("./Status.jsp");
		
		out.flush();
		out.close();
	}

}
