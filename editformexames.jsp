<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Painel de Edição</title>
</head>
<body>

<%@page import="com.crud_exames.dao.ExamesDao
				,com.crud_exames.factory.ConnectionFactory
				,com.crud_exames.bean.Exame
				,java.util.*"
				%>
<%
	String id = request.getParameter("id");
	Exame exame = ExamesDao.getRegistroById(Integer.parseInt(id));
 %>
 
 <h1>Editar Exame Marcado</h1>
 
 <form action="editexame.jsp" method="post">
 	
 	<table>
 		<tr>
 			<td><input type="hidden" name="id" value="<%=exame.getId()%>" /></td>
 		</tr>
 		<tr>
 			<td>Exame: </td>
 			<td><input type="text" name="exame" value="<%=exame.getExame() %>"/></td>
 		</tr>
 		<tr>
 			<td>Data (DD/MM/YYYY): </td>
 			<td><input type="text"  name="data" value="<%=exame.getData() %>"/></td>
 		</tr>
 		 <tr>
 			<td>Obs: </td>
 			<td><input type="text"  name="obs" value="<%=exame.getObs() %>"/></td>
 		</tr>
 		<tr>
 			<td colspan=2><input type="submit" value="Salvar Alterações"></input></td>
 			</tr>

 	</table>
 </form>
<br>
<a href="listaexames.jsp">Voltar à lista de exames</a>
 

</body>
</html>