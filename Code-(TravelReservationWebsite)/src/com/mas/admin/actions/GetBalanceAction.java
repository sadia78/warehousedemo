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
import com.mas.dao.AccountDAO;
import com.mas.dto.TransactionFormBean;


public class GetBalanceAction extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String path="";
		
		try{
		 String path1=request.getRealPath("/userimages");
		  
		 HttpSession session=request.getSession();
			String login=(String)session.getAttribute("loginuser");
		  
		    ArrayList<TransactionFormBean> vqb= new AccountDAO().getusers(path1,login);				  								 
		  
		 
		  System.out.println("in Action class vcb userinfo..........."+vqb);
		  
		  
		  if(!vqb.isEmpty())
		  {
			  request.setAttribute("AccInfo", vqb);
			  path="ViewAccountDetails.jsp";
			  request.setAttribute("status","Here Is The Users Info");
			 }
		  else {
			  
			  path="ViewAccountDetails.jsp";
			  request.setAttribute("status","No Users  Available ");
			
		}
		  
	}
	  catch (Exception e) {
		e.printStackTrace();
		path="userhome.jsp";
		request.setAttribute("status","No Users Available");
	}


	  RequestDispatcher rd=request.getRequestDispatcher(path);
		rd.forward(request,response);

		
		
		
	}

}