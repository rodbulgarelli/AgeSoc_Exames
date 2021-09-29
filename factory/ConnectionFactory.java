package com.crud_exames.factory;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	
	//Define Usuário, senha e conexão com BD
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "teste123";
	private static final String DATABASE_URL = "jdbc:sqlserver://localhost:1433;database=AGE_SOC;";
	

	public static Connection createConnectionToSQL() throws Exception {
	
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection connection = DriverManager.getConnection(DATABASE_URL,USERNAME,PASSWORD);		
		return connection;
	}
	
	//Valida se conexão está ok
	public static void main(String[] args) throws Exception {
	       
		Connection con = createConnectionToSQL();
		if(con!=null) {
			System.out.println("Conexão OK");
			con.close();
		}
		
	}
	
}
		
   
