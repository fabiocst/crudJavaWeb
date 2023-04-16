<%-- 
    Document   : buscarPaciente
    Created on : 1 de abr. de 2023, 01:31:54
    Author     : fabio
--%>



<%@page import="java.sql.*"%>

<%@page import="com.mysql.jdbc.Driver"%>

<%@page import="config.Conexao"%>

<!DOCTYPE html>

<%

Statement st = null;

ResultSet rs = null;

%>

<html>

<head>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>JSP Page</title>

</head>

<body>

<h1>Busca de Pacientes</h1>

<form action="buscarPaciente.jsp" method="post">

<input type="text" name="txtNome"><input type="submit" name="btnSalvar">

</form>

<br>

<br>


<%

if(request.getParameter("btnSalvar")!=null){

String busca = "%" + request.getParameter("txtNome") + "%";

try{

st = new Conexao().conectar().createStatement();

rs = st.executeQuery("Select * from tbPaciente where nomePaciente like'"+busca+"'");

out.println("<table border=1><tr>");

out.println("<td>ID</td>");
out.println("<td>Nome Paciente</td>");
out.println("<td>Telefone</td>");
out.println("<td>Celular</td></tr><tr>");

while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");

out.println("<td>" + rs.getString(3)+ "</td>");

out.println("<td>" + rs.getString(4)+ "</td></tr>");

}

out.println("</table>");

}

catch(Exception e)

{

out.println(e);

}

}

%>
<a href="../index.jsp">Voltar</a>
</body>

</html>