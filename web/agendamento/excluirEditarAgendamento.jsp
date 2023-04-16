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

        <title>Lista de Agendamentos</title>

    </head>

    <body>

        <h1>Lista de Agendamentos</h1>
<br>


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
out.println("<td>Medico</td>");
out.println("<td>Sintoma</td>");
out.println("<td>Funções</td></tr>");
while(rs.next())

{
out.println("<td>" + rs.getString(1) + "</td>");
out.println("<td>" + rs.getString(2) + "</td>");

out.println("<td>" + rs.getString(3)+ "</td>");
out.println("<td>" + rs.getString(5)+ "</td>");
out.println("<td>" + rs.getString(6)+ "</td>");
out.println("<td>" + rs.getString(4)+ "</td>");
out.print("<td>");

out.print("<a href='editarAgendamento.jsp?funcao=editar&id="+rs.getString(1)+"' class='text-info'>Editar | <i class='far fa-edit'></i></a>");

out.print("<a href='excluirEditarAgendamento.jsp?funcao=excluir&id="+rs.getString(1)+"' class='text-danger'>Excluir<i class='far fa-trash-alt'></i></a>");

out.print("</td></tr>");

}

out.println("</table>");

}

catch(Exception e)

{

out.println(e);

}

if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("excluir")){

String id =request.getParameter("id");

try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("Delete from tbagendamento where codagendamento='"+ id +"'");

out.println("<meta http-equiv='refresh' content='0;URL=excluirEditarAgendamento.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Cadastro excluído com sucesso');");

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