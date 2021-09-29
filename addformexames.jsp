<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inclusão de Novo Exame</title>
</head>
<body>

<%@page import="com.crud_exames.dao.PacienteDao
				,com.crud_exames.factory.ConnectionFactory
				,com.crud_exames.bean.Paciente
				,java.util.*"
				%>
<%
	String id = request.getParameter("id");
	Paciente paciente = PacienteDao.getRegistroById(Integer.parseInt(id));
 %>
 
 
 <h1>Inclusão de Novo Exame</h1><br>
 

 		

 	<form action="addexame.jsp?idpaciente=<%=paciente.getId()%>" method="post">
 		<table border = 1>	
 		<tr>
 			<th colspan=2><br>INFORMAÇÕES DO EXAME<br></th>
 		</tr>
 		
 		<tr>
 			<td>Cod</td><td><input type="text" name="id" value=<%=paciente.getId()%> disabled/></td>
 		</tr>
 		
 		<tr>
 			<td>Nome</td><td><input type="text" name="nome" value=<%=paciente.getNome()%> disabled/></td>
 		</tr>
 		<tr>
 			
			<td>CPF</td><td><input type="text" name="cpf" value=<%=paciente.getCpf()%> disabled/></td>
 		</tr>
 		
 		<tr>
 			<td>Nome do Exame</td><td><input type="text" name="exame" value=""/></td>
 		</tr>
 		<tr>
 			<td>Data do Exame</td><td><input type="text" name="data" value=""/></td>
 		</tr>
 		<tr>
 			<td>Obs</td><td><input type="text" name="obs" value=""/></td>
 		</tr>
 		<tr>
 			<td colspan=2><input type="submit" value="Agendar Exame"></input></td>
 			</tr>
 	</table>
 </form>


<a href="listapacientes.jsp">Voltar</a>
 

</body>
</html>