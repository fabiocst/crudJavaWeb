<%-- 
    Document   : listarPaciente
    Created on : 18 de mar. de 2023, 16:09:48
    Author     : Fatec 3D
--%>

<%@page import="java.sql.*"%>

<%@page import="com.mysql.jdbc.Driver"%>

<%@page import="config.Conexao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

Statement st = null;

ResultSet rs = null;

%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP Page</title>

</head>

<body>

<h1>Lista de Agendamentos</h1>

<%

try{

st = new Conexao().conectar().createStatement();

rs = st.executeQuery("Select tbAgendamento.codAgendamento,"
+ "tbAgendamento.dataAgendamento, tbAgendamento.horaAgendamento,"
+ "tbAgendamento.diagnosticoAgendamento,tbPaciente.nomePaciente,"
+ "tbMedico.nomeMedico from tbAgendamento inner join tbPaciente on "
+ "tbAgendamento.codPaciente=tbPaciente.codPaciente inner join tbMedico on "
+ "tbAgendamento.codMedico=tbMedico.codMedico;");

out.println("<table border=1><tr>");
out.println("<td>ID</td>");
out.println("<td>Data Agendamento</td>");
out.println("<td>Hora Agendamento</td>");
out.println("<td>Paciente</td>");
out.println("<td>Médico</td>");
out.println("<td>Sintoma</td></tr>");
while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");

out.println("<td>" + rs.getString(3)+ "</td>");
out.println("<td>" + rs.getString(5)+ "</td>");
out.println("<td>" + rs.getString(6)+ "</td>");
out.println("<td>" + rs.getString(4)+ "</td></tr>");

}

out.println("</table>");

}

catch(Exception e)

{

out.println(e);

}

%>
<br>
<a href="../index.jsp">Voltar</a>
</body>

</html>