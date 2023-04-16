<%-- 
    Document   : editarAgendamento
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

        <title>Editar Agendamento</title>

    </head>

    <body>

        <h1>Editar Agendamento</h1>

        <%

        String data=null;

        String hora=null;

        String diagnostico=null;
        
        String medico=null;
        String paciente=null;

        if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){

        String valorID = request.getParameter("id");

        st = new Conexao().conectar().createStatement();

        try{

        rs = st.executeQuery("Select tbAgendamento.codAgendamento,"
+ "tbAgendamento.dataAgendamento, tbAgendamento.horaAgendamento,"
+ "tbAgendamento.diagnosticoAgendamento,tbPaciente.nomePaciente,"
+ "tbMedico.nomeMedico from tbAgendamento inner join tbPaciente on "
+ "tbAgendamento.codPaciente=tbPaciente.codPaciente inner join tbMedico on "
+ "tbAgendamento.codMedico=tbMedico.codMedico where codAgendamento='"+ valorID +"'");

        while(rs.next())

        {

        data = rs.getString(2);

        hora = rs.getString(3);
        medico=rs.getString(6);
        paciente=rs.getString(5);

        diagnostico = rs.getString(4);

        }

        }

        catch(Exception e)

        {

        out.println(e);

        }

        }

        %>

        <form action="" method="post" id="cadastro">

            <!--<label>Codigo do Paciente</label><br>

            <input type="text" name="txtCod"><br>-->

            <label>Data do Agendamento</label><br>

            <input type="date" name="txtData" value="<%=data%>"><br>

            <label>Hora do Agendamento</label><br>

            <input type="time" name="txtHora" value="<%=hora%>"><br>
            
            <label>Diagnóstico</label><br>

            <input type="text" name="txtDiagnostico" value="<%=diagnostico%>"><br><!-- comment -->

            <select name="txtPaciente">

                <option>Informe o paciente</option>
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

                <option>Informe o médico</option>
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

            

            <input type="submit" name="btnAtualizar" value="Atualizar">

        </form>
<br>
<a href="../index.jsp">Voltar</a>
    </body>

</html>

<%

if(request.getParameter("btnAtualizar")!=null){

String id = request.getParameter("id");

String vdata = request.getParameter("txtData");

String vhora = request.getParameter("txtHora");

String vpaciente = request.getParameter("txtPaciente");
String vmedico = request.getParameter("txtMedico");
String vdiagnostico = request.getParameter("txtDiagnostico");


try{

st = new Conexao().conectar().createStatement();

st.executeUpdate("Update tbAgendamento set dataAgendamento='" + vdata + "',horaAgendamento='" + vhora

+ "',codpaciente='" + vpaciente + "',codMedico='"+vmedico+"',diagnosticoAgendamento='"+vdiagnostico+"'where codAgendamento='" + id + "'");

out.println("<meta http-equiv='refresh' content='0;URL=excluirEditarAgendamento.jsp'>");

out.println("<script type=\"text/javascript\">");

out.println("alert('Agendamento atualizado com sucesso');");

out.println("</script>");

}

catch(Exception e)

{

out.println(e);

}

}

%>