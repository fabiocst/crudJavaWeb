<%-- 
    Document   : editarEspecialidade
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

        <title>Editar Especialidade</title>

    </head>

    <body>

        <h1>Editar Especialidade</h1>

        <%

        String valorNome=null;

        

        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){

        String valorID = request.getParameter("id");

        st = new Conexao().conectar().createStatement();

        try{

        rs = st.executeQuery("Select * from tbEspecialidade where codespecialidade='"+ valorID +"'");

        while(rs.next())

        {

        valorNome = rs.getString(2);

        

        }

        }

        catch(Exception e)

        {

        out.println(e);

        }

        }

        %>

        <form action="" method="post" id="cadastro">

            <label>Nome da Especialidade</label><br>

            <input type="text" name="txtNome" value="<%=valorNome%>"><br>

            

            

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


try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("Update tbEspecialidade set Especialidade='" + nome + "'where codEspecialidade='" + id + "'");

out.println("<meta http-equiv='refresh' content='0;URL=excluirEditarEspecialidade.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Especialidade atualizada com sucesso');");

out.println("</script>");

}

catch(Exception e)

{

out.println(e);

}

}

%>