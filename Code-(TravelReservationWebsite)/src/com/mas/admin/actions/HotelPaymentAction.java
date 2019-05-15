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
import com.mas.dto.HotelDTO;
import com.mas.dto.JourneyDTO;
import com.mas.dto.TransactionFormBean;
public class HotelPaymentAction extends HttpServlet {

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
        HttpSession session=request.getSession();
        TransactionFormBean  wf=new TransactionFormBean();
	    Map map=request.getParameterMap();
		
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
		int person =Integer.parseInt(request.getParameter("person"));
		System.out.println(person);
		String jdate=request.getParameter("jdate");
		String rdate=request.getParameter("rdate");
		
	    HotelDTO hdto=( HotelDTO)request.getSession().getAttribute("hotel");
	    System.out.println(hdto);
	    String city=hdto.getCity();
	    System.out.println(city);
	    String hname=hdto.getHname();
	    System.out.println(hname);
	    String login=(String)session.getAttribute("loginuser");
	    System.out.println(login);
	    
	   float bal=0;
	    
		try{
			
		bal=new AccountDAO().verification(login);
		if(bal>=amount)
			
		{
			  flag1= new AccountDAO().paymentTransaction(wf);
	    	 try {
				flag=new UserDAO().conformHotel(login,jdate,rdate,person,hname,city);
			} catch (DataNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DataAcessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(flag && flag1){
			
			request.setAttribute("login", login);
			request.setAttribute("amount", amount);
			request.setAttribute("jdate", jdate);
			request.setAttribute("rdate", rdate);
			request.setAttribute("person", person);
			request.setAttribute("hname", hname);
			request.setAttribute("city", city);
			
			request.setAttribute("status", "Hotel Booking Sucessfully");
			path="./HotelStatus.jsp";
			
		}
		else{
			request.setAttribute("status", "Amount Balace is not sufficient plz deposit the Money");
			path="./HotelStatus.jsp";
			
		}
		}catch (NullPointerException e) {
		e.printStackTrace();
		request.setAttribute("status", "Amount Balace is not sufficient plz deposit the Money");
		path="./UserHome.jsp";
	}
        rd=request.getRequestDispatcher(path);
        rd.forward(request, response);
		
		
		
		
		
		
		
	}

}
