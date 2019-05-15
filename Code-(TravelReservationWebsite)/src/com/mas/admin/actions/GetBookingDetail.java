package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mas.dao.MasterDAO;
import com.mas.dto.JourneyDTO;

public class GetBookingDetail extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
	    doPost(request, response);
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        HttpSession session=request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ArrayList<JourneyDTO> jlist=null;
		String userid=(String)session.getAttribute("loginuser");
		try{
			jlist=new MasterDAO().getBookingDetail(userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(jlist!=null){
			request.setAttribute("booking", jlist);
		}
		
		RequestDispatcher rd=request.getRequestDispatcher("./ViewBookingDetail.jsp");
		rd.forward(request, response);
		out.flush();
		out.close();
	}

}
