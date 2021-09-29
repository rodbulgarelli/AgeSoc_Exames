package com.crud_exames.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crud_exames.bean.Paciente;
import com.crud_exames.factory.ConnectionFactory;

public class PacienteDao {

	public static Paciente getRegistroById(int id) {
		Paciente paciente = null;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "select * from dbo.tbl_pacientes_cadastro WHERE id_paciente=?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				paciente = new Paciente();
				paciente.setId(rs.getInt("id_paciente"));
				paciente.setNome(rs.getString("nome_sobrenome"));
				paciente.setCpf(rs.getString("cpf"));
				paciente.setIdOrd(rs.getInt("id_ord"));

				}
			
			conn.close();
			}catch (Exception e) {
				System.out.println("");
			}
		
			return paciente;
		}
	
////Método INSERT
	public static int addPaciente(Paciente p) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "EXEC dbo.proc_alimenta_tbl_pacientes_cadastro 'I',NULL,?,?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setString(1, p.getNome());
			ps.setString(2, p.getCpf());
			
			
			ResultSet rs = ps.executeQuery();
			//status = ps.executeUpdate();
			
			System.out.println(rs.getString("msg_retorno"));
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}
	
////Método UPDATE (Editar)
	public static int updatePaciente(Paciente p) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "EXEC dbo.proc_alimenta_tbl_pacientes_cadastro 'U',?,?,?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setInt(1, p.getId());
			ps.setString(2, p.getNome());
			ps.setString(3, p.getCpf());
			//ps.setInt(3, u.getIdOrd());
			
			
			ResultSet rs = ps.executeQuery();
			//status = ps.executeUpdate();
			
			System.out.println(rs.getString("msg_retorno"));
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}
////Método UPDATE (Inativar)
	public static int cancelPaciente(Paciente p) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "UPDATE dbo.tbl_pacientes_cadastro SET ativo = 0 where id_paciente =?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			
			ps.setInt(1, p.getId());
			
			
			//ResultSet rs = ps.executeQuery();
			status = ps.executeUpdate();
			
			System.out.println("");
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}

////Método UPDATE (Reativar)
public static int readdPaciente(Paciente p) {
		int status=0;
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			String sql = "UPDATE dbo.tbl_pacientes_cadastro SET ativo = 1 where id_paciente =?";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, p.getId());

			status = ps.executeUpdate();
			
			System.out.println("");
			conn.close();
	}catch (Exception e) {
		System.out.println("");
		}
		return status;
		
	}

////Método SELECT (Lista - ativos)
public static List<Paciente> getAllPacientes(){
		
		List<Paciente> list = new ArrayList<Paciente>();
		
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			String sql = "SELECT * FROM dbo.tbl_pacientes_cadastro where ativo=1 order by id_ord";
			conn = ConnectionFactory.createConnectionToSQL();
			ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			
			
			//Adicionar os valores para a query
			while(rs.next()) {
				Paciente paciente = new Paciente();
				paciente.setId(rs.getInt("id_paciente"));
				paciente.setNome(rs.getString("nome_sobrenome"));
				paciente.setCpf(rs.getString("cpf"));
				
				list.add(paciente);
				
				System.out.println("");
			}conn.close();
		}catch (Exception e) {
			System.out.println("");
		}
		
//validadoresConsole
		if(conn!=null) {
			System.out.println("");
			}
		if(list!=null) {
			System.out.println("");}
		
		return list;
		
		
	}	


////Método SELECT (Lista - ativos)
public static List<Paciente> getAllPacientesInativos(){
	
	List<Paciente> list = new ArrayList<Paciente>();
	
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		
		String sql = "SELECT * FROM dbo.tbl_pacientes_cadastro where ativo=0 order by id_ord";
		conn = ConnectionFactory.createConnectionToSQL();
		ps = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		
		
		//Adicionar os valores para a query
		while(rs.next()) {
			Paciente paciente = new Paciente();
			paciente.setId(rs.getInt("id_paciente"));
			paciente.setNome(rs.getString("nome_sobrenome"));
			paciente.setCpf(rs.getString("cpf"));
			
			list.add(paciente);
			
			System.out.println("");
		}conn.close();
	}catch (Exception e) {
		System.out.println("");
	}
	
//validadoresConsole
	if(conn!=null) {
		System.out.println("");
		}
	if(list!=null) {
		System.out.println("");}
	
	return list;
	
	
}	

}
