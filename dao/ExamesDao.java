package com.crud_exames.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crud_exames.bean.Exame;
import com.crud_exames.factory.ConnectionFactory;

public class ExamesDao {

////Método SELECT (obter id)
	public static Exame getRegistroById(int id) {
		Exame exame = null;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "select * from dbo.view_lista_exames WHERE id_historico=?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				exame = new Exame();
				exame.setId(rs.getInt("id_historico"));
				exame.setIdpaciente(rs.getInt("id_paciente"));
				exame.setExame(rs.getString("desc_exame"));
				exame.setData(rs.getString("data_exame"));
				exame.setObs(rs.getString("desc_obs"));

				}
			
			conn.close();
			}catch (Exception e) {
				System.out.println("");
			}
		
			return exame;
		}
	
////Método INSERT
	public static int addExame(Exame x) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "EXEC dbo.proc_alimenta_tbl_historico_exames 'I',NULL,?,?,?,?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setInt(1, x.getIdpaciente());
			ps.setString(2, x.getExame());
			ps.setString(3, x.getData());
			ps.setString(4, x.getObs());
			
			
			//ResultSet rs = ps.executeQuery();
			status = ps.executeUpdate();
			
			System.out.println("");
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}
	
////Método UPDATE (Editar)
	public static int updateExame(Exame x) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			//String sql = "UPDATE dbo.tbl_historico_exames set desc_exame=?, desc_obs=? where id_historico=?";
			String sql = "EXEC dbo.proc_alimenta_tbl_historico_exames 'U',?,NULL,?,?,?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setInt(1, x.getId());
			ps.setString(2, x.getExame());
			ps.setString(3, x.getData());
			ps.setString(4, x.getObs());
			
			
			
			//ResultSet rs = ps.executeQuery();
			status = ps.executeUpdate();
			
			//System.out.println("");
			conn.close();
	}catch (Exception e) {
		System.out.println("NK");
		}
		return status;
		
	}
////Método DELETE 
	public static int deleteExame(Exame x) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "DELETE FROM dbo.tbl_historico_exames where id_historico =?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setInt(1, x.getId());
			
			
			//ResultSet rs = ps.executeQuery();
			status = ps.executeUpdate();
			
			//System.out.println("ok");
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}


////Método SELECT (Lista Exames)
public static List<Exame> getAllExames(){
		
		List<Exame> list = new ArrayList<Exame>();
		
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			String sql = "SELECT * FROM dbo.view_lista_exames where 1=1 order by id_ord, desc_exame";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			
			
			//Adicionar os valores para a query
			while(rs.next()) {
				Exame exame = new Exame();
				exame.setId(rs.getInt("id_historico"));
				exame.setIdpaciente(rs.getInt("id_paciente"));
				exame.setExame(rs.getString("desc_exame"));
				exame.setData(rs.getString("data_exame"));
				exame.setObs(rs.getString("desc_obs"));
				exame.setPacienteexame(rs.getString("nome_sobrenome"));
				
				list.add(exame);
				
				System.out.println("");
			}conn.close();
		}catch (Exception e) {
			System.out.println("");
		}
		
//validadoresConsole
		if(conn!=null) {
			System.out.println("ConexaoOK");
			}
		if(list!=null) {
			System.out.println("ListaExiste");}
		
		return list;
		
		
	}	


}
