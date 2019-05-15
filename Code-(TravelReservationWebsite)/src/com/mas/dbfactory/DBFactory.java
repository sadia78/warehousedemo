package com.mas.dbfactory;
import java.sql.*;
import com.mas.connection.AbstractDataAccessObject;
public class DBFactory 
{
	private static Connection con=null;
	public static Connection getConnection()
	{
		AbstractDataAccessObject ado=new AbstractDataAccessObject();
		try{
		   con=ado.getConnection();
		   
		}
		catch(Exception se)
		{
			
			se.printStackTrace();
		}
		return con;
	}

}
