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
import org.apache.commons.beanutils.BeanUtils;
import com.mas.dao.AccountDAO;
import com.mas.dto.TransactionFormBean;
public class DepositeAction extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
String path="";
		
		RequestDispatcher rd=null;
        boolean flag=false;
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
		try{
			
			
		flag= new AccountDAO().insertTransaction(wf);
		
		if(flag){
			request.setAttribute("status", "Amount Deposited Successfully");
			path="./Deposite.jsp";
			
		}
		else{
			request.setAttribute("status", "Amount deposite Failed try again");
			path="./userhome.jsp";
			
		}
		}catch (NullPointerException e) {
		e.printStackTrace();
		request.setAttribute("status", "Amount deposite Failed try again");
		path="./userhome.jsp";
	}
        rd=request.getRequestDispatcher(path);
        rd.forward(request, response);
		
		
		
		
		
		
		
	}

}
