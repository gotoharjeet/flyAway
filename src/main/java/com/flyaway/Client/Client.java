package com.flyaway.Client;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.flyaway.dao.CustomerDAO;
import com.flyaway.dao.DBConnect;
import com.flyaway.model.Customer;

public class Client {
	private Connection con = null;
	private PreparedStatement pst = null;
	private Statement stmt = null;

	public static void main(String[] args) {
		// CustomerDAO cust= new CustomerDAO();
		Client client = new Client();
		int custId = 0;
		Customer customer = new Customer();

		customer.setFirstName("Durga");
		customer.setLastName("Ji");
		customer.setEmail("durga2019@durgasoft.com");
		customer.setPassword("Durga@2019");
		customer.setPhone("9999999999");

		custId = client.addCustomer(customer);
		System.out.println(custId);
		customer.setCustomerId(custId);

	}

	public int addCustomer(Customer custBean) {

		int customerId = 0;
		String jdbcUrl = "jdbc:mysql://localhost:3306/mytrgdb";
		String driver = "com.mysql.cj.jdbc.Driver";
		String user = "root";
		String password = "root";
		int pstInt=0;

		String sql = "insert into customer (first_name , last_name , email , password , phone)"
				+ " values(? , ? , ? , ? , ?)";

		try {
			con = DBConnect.getConnection();
			
			
			
			System.out.println("dbconnected...");
			
			
			/*
			 * stmt=con.createStatement();
			 * 
			 * stmt.
			 * executeUpdate("create table customer (first_name varchar(25),last_name varchar(25), email varchar(25), password varchar(25), phone integer)"
			 * );
			 */
			 
			  	
				  pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				  
					pst.setString(1, custBean.getFirstName());
					pst.setString(2, custBean.getLastName());
					pst.setString(3, custBean.getEmail());
					pst.setString(4, custBean.getPassword());
					pst.setString(5, custBean.getPhone());
				  pstInt=pst.executeUpdate();
				  System.out.println("pstint1 ="+pstInt);
				  
				  if (pstInt == 1) 
				  { 
					  ResultSet rs = pst.getGeneratedKeys(); 
					  if(rs.next()) 
					  { 
						  customerId = rs.getInt(1); 
					  }
				  
				  } else { System.out.println("hello"); customerId = 0; }
				 
		} catch (SQLException e) {
			customerId = 0;
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		System.out.println("pstint2 ="+pstInt);
		return customerId;
	}

}
