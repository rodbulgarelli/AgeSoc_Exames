<%@page import="com.crud_exames.dao.ExamesDao, com.crud_exames.factory.ConnectionFactory"%>
<jsp:useBean id="x" class="com.crud_exames.bean.Exame"></jsp:useBean>
<jsp:setProperty property="*" name="x"/>

<%
int i = ExamesDao.updateExame(x);
response.sendRedirect("listaexames.jsp");
%>