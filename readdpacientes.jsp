<%@page import="com.crud_exames.dao.PacienteDao, com.crud_exames.factory.ConnectionFactory"%>
<jsp:useBean id="p" class="com.crud_exames.bean.Paciente"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
int i = PacienteDao.readdPaciente(p);
response.sendRedirect("pacientesinativos.jsp");
%>