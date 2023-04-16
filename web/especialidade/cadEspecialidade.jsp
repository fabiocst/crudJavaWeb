<%-- 
    Document   : cadEspecialidade
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

        <h1>Cadastro de Especialidades</h1>

        <form action="" method="post" id="cadastro">

            <!--<label>Codigo do Especialidade</label><br>

            <input type="text" name="txtCod"><br>-->

            <label>Nome do especialidade</label><br>

            <input type="text" name="txtNome"><br>

           <!-- <label>Telefone</label><br>

            <input type="text" name="txtTelefone"><br>

            <label>Celular</label><br>

            <input type="text" name="txtCelular"><br>
            <br>

           <select name="txtNivel">

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

String especialidade = request.getParameter("txtNome");

//String telefone = request.getParameter("txtTelefone");

//String celular = request.getParameter("txtCelular");

try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("insert into tbEspecialidade(especialidade) values('"+especialidade+"')");

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