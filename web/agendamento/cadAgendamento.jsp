<%-- 
    Document   : cadAgendamento
    Created on : 1 de abr. de 2023, 11:40:18
    Author     : fabio
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%@page import="com.mysql.jdbc.Driver"%>

<%@page import="config.Conexao"%>

<%

Statement st = null;

ResultSet rs = null;

%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset=UTF-8>

        <title>JSP Page</title>

    </head>

    <body>

        <h1>Cadastro de Agendamentos</h1>

        <form action="" method="post" id="cadastro">

            <!--<label>Codigo do Paciente</label><br>

            <input type="text" name="txtCod"><br>-->

            <label>Data do Agendamento</label><br>

            <input type="date" name="txtData"><br>

            <label>Hora do Agendamento</label><br>

            <input type="time" name="txtHora"><br>
            
            <label>Diagnóstico</label><br>

            <input type="text" name="txtDiagnostico"><br><!-- comment -->

            <select name="txtPaciente">

                <option>Paciente Atendido</option>
                <%
                try {
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tbPaciente");
            
                while (rs.next()){ 
                out.println("<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>");
                }
                }
                catch(Exception e)
                {
                   out.println(e);
                }
                %>
            </select>
            
            <select name="txtMedico">

                <option>Médico Responsável</option>
                <%
                try {
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tbMedico");
            
                while (rs.next()){ 
                out.println("<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>");
                }
                }
                catch(Exception e)
                {
                   out.println(e);
                }
                %>
            </select>
            
            

<!--            <select name="txtNivel">

                <option>Escolha uma opção</option>

                <option value="usu">Usuário</option>

                <option value="admin">Administrador</option>

                <option value="vis">Visitante</option>

            </select>-->

            <br><br>

            <input type="submit" name="btnSalvar">

        </form>



<%

if(request.getParameter("btnSalvar")!=null){

//String cod = request.getParameter("txtCod");

String data = request.getParameter("txtData");

String hora = request.getParameter("txtHora");

String paciente = request.getParameter("txtPaciente");

String medico = request.getParameter("txtMedico");

String diagnostico = request.getParameter("txtDiagnostico");
//String especialidade = request.getParameter(rs.getString(1));


try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("insert into tbAgendamento(dataAgendamento,horaAgendamento,"
+ "codPaciente,codMedico,diagnosticoAgendamento) values('"+data+"', '"+hora+"', '"+paciente+"',"
+ "'"+medico+"','"+diagnostico+"')");

out.println("<meta http-equiv='refresh' content='0;URL=../index.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Cadastro realizado com sucesso');");

out.println("</script>");

}

catch(Exception e)

{

out.println(e);

}

}

%>
<br>
<a href="../index.jsp">Voltar</a>
</body>
</html>