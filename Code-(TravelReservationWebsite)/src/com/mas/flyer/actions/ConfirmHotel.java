package com.mas.flyer.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.mas.dao.AccountDAO;
import com.mas.dao.UserDAO;
import com.mas.dto.FlyersDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.TransactionFormBean;

public class ConfirmHotel extends HttpServlet {

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
		
		
		

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
        boolean flag=false;
        boolean flag1=false;
		TransactionFormBean  wf=new TransactionFormBean();
	   
	    String atype=request.getParameter("ttype");
	    System.out.println(atype);
	    int acno=Integer.parseInt(request.getParameter("accno"));
	    System.out.println(acno);
	    
	    float ammout=Float.parseFloat(request.getParameter("tamount"));
	    System.out.println(ammout);
	    wf.setAccno(acno);
	    wf.setAccbal(ammout);
	    wf.setAcctype(atype);
	    JourneyDTO jdto=(JourneyDTO)request.getSession().getAttribute("flightdto");
	    System.out.println(jdto);
	    FlyersDTO fdto=(FlyersDTO)request.getSession().getAttribute("userdto");
	    System.out.println(fdto);
	   
	    double miles=0.4;
	    
	    try{
	    	flag1= new AccountDAO().paymentTransaction(wf);
	    	 flag=new UserDAO().conformTickets(jdto,fdto,miles);
	    	if(flag){
	    		out.println("<font color=red size=4><center>Your request successfully processed</center></font>");
	    		
	    		
	    	}else
	    		out.println("sorry your requested process failed try again");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		out.flush();
		out.close();
	}

}
