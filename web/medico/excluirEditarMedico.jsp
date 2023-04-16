<%-- 
    Document   : excluirEditarPaciente
    Created on : 1 de abr. de 2023, 01:33:58
    Author     : fabio
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

        <title>Lista de Medicos</title>

    </head>

    <body>

        <h1>Lista de Medicos</h1>
<br>


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
out.println("<td>Especialidade</td>");
out.println("<td>Funções</td></tr>");
while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");

out.println("<td>" + rs.getString(3)+ "</td>");
out.println("<td>" + rs.getString(4)+ "</td>");
out.println("<td>" + rs.getString(5)+ "</td>");

out.print("<td>");

out.print("<a href='editarMedico.jsp?funcao=editar&id="+rs.getString(1)+"' class='text-info'>Editar  <i class='far fa-edit'></i></a>");



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