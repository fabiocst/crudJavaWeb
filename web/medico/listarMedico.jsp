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

<h1>Lista de Medicos</h1>

<%

try{

st = new Conexao().conectar().createStatement();

rs = st.executeQuery("SELECT tbmedico.codmedico,tbmedico.nomeMedico,"
+ "tbmedico.telMedico,tbmedico.celMedico,tbespecialidade.especialidade"
+ " from tbmedico INNER JOIN tbespecialidade on "
+ "tbmedico.codEspecialidade=tbespecialidade.codEspecialidade;");

out.println("<table border=1><tr>");
out.println("<td>ID</td>");
out.println("<td>Nome Medico</td>");
out.println("<td>Telefone</td>");
out.println("<td>Celular</td>");
out.println("<td>Especialidade</td></tr>");
while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");

out.println("<td>" + rs.getString(3)+ "</td>");
out.println("<td>" + rs.getString(4)+ "</td>");
out.println("<td>" + rs.getString(5)+ "</td></tr>");

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