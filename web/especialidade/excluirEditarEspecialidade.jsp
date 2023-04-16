<%-- 
    Document   : editarEspecialidade
    Created on : 3 de abr. de 2023, 20:19:04
    Author     : Fatec 3D
--%>

<%@page import="javax.swing.JOptionPane"%>

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

        <title>Lista de Especialidades</title>

    </head>

    <body>

        <h1>Lista de Especialidades</h1>
<br>


<%

try{

st = new Conexao().conectar().createStatement();

rs = st.executeQuery("Select * from tbEspecialidade");

out.println("<table border=1><tr>");
out.println("<td>ID</td>");
out.println("<td>Nome Especialidade</td>");

out.println("<td>Funções</td></tr>");
while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");



out.print("<td>");

out.print("<a href='editarEspecialidade.jsp?funcao=editar&id="+rs.getString(1)+"' class='text-info'>Editar <i class='far fa-edit'></i></a>");



out.print("</td></tr>");

}

out.println("</table>");

}

catch(Exception e)

{

out.println(e);

}


%>
<a href="../index.jsp">Voltar</a>
    </body>

</html>