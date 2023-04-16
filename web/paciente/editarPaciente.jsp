<%-- 
    Document   : editarPaciente
    Created on : 1 de abr. de 2023, 01:32:26
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Editar Paciente</title>

    </head>

    <body>

        <h1>Editar Paciente</h1>

        <%

        String valorNome=null;

        String valorTel=null;

        String valorCel=null;

        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){

        String valorID = request.getParameter("id");

        st = new Conexao().conectar().createStatement();

        try{

        rs = st.executeQuery("Select * from tbPaciente where codPaciente='"+ valorID +"'");

        while(rs.next())

        {

        valorNome = rs.getString(2);

        valorTel = rs.getString(3);

        valorCel = rs.getString(4);

        }

        }

        catch(Exception e)

        {

        out.println(e);

        }

        }

        %>

        <form action="" method="post" id="cadastro">

            <label>Nome do Paciente</label><br>

            <input type="text" name="txtNome" value="<%=valorNome %>"><br>

            <br>
            <label>Telefone do Paciente</label><br>

            <input type="text" name="txtTelefone" value="<%=valorTel %>"><br>
            
            <label>Celular do Paciente</label><br>

            <input type="text" name="txtCelular" value="<%=valorCel %>"><br>

            <br>

            <!--<select name="txtNivel">

                <option value="<%=valorCel %>"><%=valorCel %></option>

                <option value="usu">Usuário</option>

                <option value="admin">Administrador</option>

                <option value="vis">Visitante</option>

            </select>-->

            <br>

            <input type="submit" name="btnAtualizar" value="Atualizar">

        </form>
<br>
<a href="../index.jsp">Voltar</a>
    </body>

</html>

<%

if(request.getParameter("btnAtualizar")!=null){

String id = request.getParameter("id");

String nome = request.getParameter("txtNome");

String telPaciente = request.getParameter("txtTelefone");

String celPaciente = request.getParameter("txtCelular");

try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("Update tbPaciente set nomePaciente='" + nome + "',telPaciente='" + telPaciente

+ "',celPaciente='" + celPaciente + "'where codPaciente='" + id + "'");

out.println("<meta http-equiv='refresh' content='0;URL=excluirEditarPaciente.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Usuário atualizado com sucesso');");

out.println("</script>");

}

catch(Exception e)

{

out.println(e);

}

}

%>