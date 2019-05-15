package com.mas.admin.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.mas.UDExceptions.DataAcessException;
import com.mas.UDExceptions.DataNotFoundException;
import com.mas.dao.AccountDAO;
import com.mas.dao.UserDAO;
import com.mas.dto.FlyersDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.TransactionFormBean;
public class PaymentAction extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
String path="";
		
		RequestDispatcher rd=null;
        boolean flag=false;
        boolean flag1=false;
        TransactionFormBean  wf=new TransactionFormBean();
	    Map map=request.getParameterMap();
	    HttpSession session=request.getSession();
		try{
			BeanUtils.populate(wf, map);
			
		}catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 float amount=Float.parseFloat(request.getParameter("tamount"));
		    System.out.println(amount);
	    JourneyDTO jdto=(JourneyDTO)request.getSession().getAttribute("flightdto");
	    System.out.println(jdto);
	    FlyersDTO fdto=(FlyersDTO)request.getSession().getAttribute("userdto");
	    System.out.println(fdto);
	    
	    String login=(String)session.getAttribute("loginuser");
	    System.out.println(login);
	    
	    double miles=0.4;
	    float bal=0;
		try{
			bal=new AccountDAO().verification(login);
			if(bal>=amount)
				
			{
			
			  flag1= new AccountDAO().paymentTransaction(wf);
			}
	    	 try {
				flag=new UserDAO().conformTickets(jdto,fdto,miles);
			} catch (DataNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DataAcessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		if(flag && flag1){
			request.setAttribute("status", "Flight Booking Sucessfully");
			request.setAttribute("login", login);
			request.setAttribute("amount", amount);
			request.setAttribute("jdto", jdto);
			
			path="./Status.jsp";
			
		}
		else{
			request.setAttribute("status", "Flight Booking Sucessfully");
			path="./Status.jsp";
			request.setAttribute("login", login);
			request.setAttribute("amount", amount);
			request.setAttribute("jdto", jdto);
			
		}
		}catch (NullPointerException e) {
		e.printStackTrace();
		request.setAttribute("status", "Amount deposite Failed try again");
		path="./UserHome.jsp";
		request.setAttribute("login", login);
		request.setAttribute("amount", amount);
		request.setAttribute("jdto", jdto);
		
	}
        rd=request.getRequestDispatcher(path);
        rd.forward(request, response);
		
		
		
		
		
		
		
	}

}
