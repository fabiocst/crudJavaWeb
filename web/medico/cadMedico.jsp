<%-- 
    Document   : cadMedico
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

        <h1>Cadastro de Medicos</h1>

        <form action="" method="post" id="cadastro">

            <!--<label>Codigo do Paciente</label><br>

            <input type="text" name="txtCod"><br>-->

            <label>Nome do Medico</label><br>

            <input type="text" name="txtMed"><br>

            <label>Telefone</label><br>

            <input type="text" name="txtTelefone"><br><!-- comment -->

            <label>Celular</label><br>

            <input type="text" name="txtCelular"><br><!-- comment -->
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

String medico = request.getParameter("txtMed");

String telefone = request.getParameter("txtTelefone");

String celular = request.getParameter("txtCelular");

String especialidade = request.getParameter("txtEspecialidade");
//String especialidade = request.getParameter(rs.getString(1));


try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("insert into tbMedico(nomeMedico,telMedico,celMedico,"
+ "codEspecialidade) values('"+medico+"', '"+telefone+"', '"+celular+"',"
+ "'"+especialidade+"')");

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