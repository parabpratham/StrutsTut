package com.c2s.test;

import java.sql.*;

class OracleCon
{
	public static void main(String args[])
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "hr", "pratham");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from employees");
			while (rs.next())
				System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

			con.close();

		} catch (Exception e)
		{
			System.out.println(e);
		}

	}
}