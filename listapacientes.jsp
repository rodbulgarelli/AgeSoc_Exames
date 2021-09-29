<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Pacientes</title>
</head>
<body>

<%@ page import="com.crud_exames.dao.PacienteDao
				,com.crud_exames.factory.ConnectionFactory
				,com.crud_exames.bean.Paciente
				,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1> Lista de Pacientes Cadastrados</h1>
<%
List <Paciente> list= PacienteDao.getAllPacientes();
request.setAttribute("list", list);
%>
  

 <table border="1">
 	<tr>
 		<th>Cod</th>
 		<th>Nome Completo</th>
 		<th>CPF</th>
 		<th colspan="3">Opções</th>
 		
 	</tr>
 	<c:forEach items="${list}" var="paciente">
 	<tr>
 		<td>${paciente.getId()}</td>
 		<td>${paciente.getNome()}</td>
 		<td>${paciente.getCpf()}</td>
 		<td><a href="editformpacientes.jsp?id=${paciente.getId()}">Editar</a></td>
 		<td><a href="cancelpaciente.jsp?id=${paciente.getId()}">Inativar</a></td>
 		<td><a href="addformexames.jsp?id=${paciente.getId()}">Cadastrar Exame</a></td>
 	</tr>
 
 	</c:forEach>
</table>
<br>
<a href="listaexames.jsp">> Exames Marcados</a><br><br>
<a href="addformpacientes.jsp">> Cadastrar Novo Paciente</a><br>
<a href="pacientesinativos.jsp">> Relação de Pacientes Inativos</a><br>
 
 

    
</body>
</html>