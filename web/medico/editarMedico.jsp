<%-- 
    Document   : editarMedico
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

        <title>Editar Medico</title>

    </head>

    <body>

        <h1>Editar Medico</h1>

        <%

        String valorNome=null;

        String valorTel=null;

        String valorCel=null;
        String valorEspecialidade=null;

        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){

        String valorID = request.getParameter("id");

        st = new Conexao().conectar().createStatement();

        try{

        rs = st.executeQuery("Select * from tbMedico where codMedico='"+ valorID +"'");

        while(rs.next())

        {

        valorNome = rs.getString(2);

        valorTel = rs.getString(3);

        valorCel = rs.getString(4);
        valorEspecialidade = rs.getString(5);

        }

        }

        catch(Exception e)

        {

        out.println(e);

        }

        }

        %>

        <form action="" method="post" id="cadastro">

            <label>Nome do Medico</label><br>

            <input type="text" name="txtNome" value="<%=valorNome %>"><br>

            <br>
            <label>Telefone do Medico</label><br>

            <input type="text" name="txtTelefone" value="<%=valorTel %>"><br>
            
            <label>Celular do Medico</label><br>

            <input type="text" name="txtCelular" value="<%=valorCel %>"><br>

            <br>

            <select name="txtEspecialidade">

                <option>Escolha uma opção de especialidade</option>
                <%
                try {
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tbEspecialidade");
            
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

String telMedico = request.getParameter("txtTelefone");

String celMedico = request.getParameter("txtCelular");
String especialidade = request.getParameter("txtEspecialidade");

try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("Update tbMedico set nomeMedico='" + nome + "',telMedico='" + telMedico

+ "',celMedico='" + celMedico + "',codEspecialidade='"+especialidade+"' where codMedico='" + id + "'");

out.println("<meta http-equiv='refresh' content='0;URL=excluirEditarMedico.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Medico atualizado com sucesso');");

out.println("</script>");

}

catch(Exception e)

{

out.println(e);

}

}

%>