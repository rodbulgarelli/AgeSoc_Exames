<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Exames</title>
</head>
<body>

<%@ page import="com.crud_exames.dao.ExamesDao
				,com.crud_exames.factory.ConnectionFactory
				,com.crud_exames.bean.Exame
				,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1> Relação de Exames Marcados</h1>
<%
List <Exame> list= ExamesDao.getAllExames();
request.setAttribute("list", list);
%>
  
  
 <table border="1">
 	<tr>
 		<th>NumExame</th>
 		<th>Exame</th>
 		<th>Nome</th>
 		<th>Data</th>
 		<th>Obs</th>
 		<th colspan="2">Opções</th>
 		
 	</tr>
 	<c:forEach items="${list}" var="exame">
 	<tr>
 		<td>${exame.getId()}</td>
 		<td>${exame.getExame()}</td>
 		<td>${exame.getPacienteexame()}</td>
 		<td>${exame.getData()}</td>
 		<td>${exame.getObs()}</td>
 		<td><a href="editformexames.jsp?id=${exame.getId()}">Editar</a></td>
 		<td><a href="deleteexame.jsp?id=${exame.getId()}">Excluir</a></td>	
 	</tr>	
 	</c:forEach>
 	<tr>
 		<td colspan="7" align="center"><a href="listapacientes.jsp">Listar Pacientes/Marcar Exames</a></td>
 	</tr>
 
 </table>  
  
</body>
</html>