<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Painel de Edição</title>
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
 
 <h1>Editar Paciente Cadastrado</h1>
 
 <form action="editpaciente.jsp" method="post">
 	<input type="hidden" name="id" value="<%=paciente.getId()%>"/>
 	<table>
 		<tr>
 			<td>Nome Completo: </td>
 			<td><input type="text" name="nome" value="<%=paciente.getNome() %>"/></td>
 		</tr>
 		<tr>
 			<td>CPF (somente números): </td>
 			<td><input type="text"  name="cpf" value="<%=paciente.getCpf() %>"/></td>
 		</tr>
 		<tr>
 			<td colspan=2><input type="submit" value="Salvar Alterações"></input></td>
 			</tr>

 	</table>
 </form>
<br>
<a href="listapacientes.jsp">Voltar à lista de pacientes</a>
 

</body>
</html>