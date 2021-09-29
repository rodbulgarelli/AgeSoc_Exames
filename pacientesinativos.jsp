<html>
<head>
<meta charset="ISO-8859-1">
<title>Pacientes Inativos</title>
</head>
<body>

<%@ page import="com.crud_exames.dao.PacienteDao
				,com.crud_exames.factory.ConnectionFactory
				,com.crud_exames.bean.Paciente
				,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1> Pacientes Inativos</h1>
<%
List <Paciente> list= PacienteDao.getAllPacientesInativos();
request.setAttribute("list", list);
%>
  
  
 <table border="1">
 	<tr>
 		<th>Cod</th>
 		<th>Nome Completo</th>
 		<th>CPF</th>
 		<th colspan="1">Opções</th>
 		
 	</tr>
 	<c:forEach items="${list}" var="paciente">
 	<tr>
 		<td align="center">${paciente.getId()}</td>
 		<td>${paciente.getNome()}</td>
 		<td>${paciente.getCpf()}</td>
 		
 		<td><a href="readdpacientes.jsp?id=${paciente.getId()}">Reativar</a></td>
 	</tr>
 	</c:forEach> 	
 </table>  
    <br>
    <br>
    <a href="listapacientes.jsp">Voltar</a>
</body>
</html>