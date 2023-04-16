<%-- 
    Document   : cadPaciente
    Created on : 18 de mar. de 2023, 15:14:39
    Author     : Fatec 3D
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

        <h1>Cadastro de Pacientes</h1>

        <form action="" method="post" id="cadastro">

            <!--<label>Codigo do Paciente</label><br>

            <input type="text" name="txtCod"><br>-->

            <label>Nome do paciente</label><br>

            <input type="text" name="txtPac"><br>

            <label>Telefone</label><br>

            <input type="text" name="txtTelefone"><br><!-- comment -->

            <label>Celular</label><br>

            <input type="text" name="txtCelular"><br><!-- comment -->
            <br>

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

String paciente = request.getParameter("txtPac");

String telefone = request.getParameter("txtTelefone");

String celular = request.getParameter("txtCelular");

try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("insert into tbPaciente(nomePaciente,telPaciente,celPaciente) values('"+paciente+"', '"+telefone+"', '"+celular+"')");

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