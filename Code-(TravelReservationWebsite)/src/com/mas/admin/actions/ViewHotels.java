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
import com.mas.dto.HotelDTO;
public class ViewHotels extends HttpServlet {

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
		try{
			ArrayList<HotelDTO> hlist=new MasterDAO().getHotels();
			request.setAttribute("hotels", hlist);
			RequestDispatcher rd=request.getRequestDispatcher("./ViewHotels.jsp");
			rd.forward(request,response);
		}catch(Exception e){
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}

}
