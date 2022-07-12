
<%@page import="com.mycompany.mycart.entities.User"%>
<%@page import="com.mycompany.mycart.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("User");
    if(user==null){
        Message msg=new Message("You are not logged in! login first..","error","alert-danger");
        session.setAttribute("msg",msg);
        response.sendRedirect("login.jsp");
        return;
    }
    else if(user.getUserType().equals("admin")){
        Message msg=new Message("You are not normal user!!","error","alert-danger");
        session.setAttribute("msg",msg);
        response.sendRedirect("admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal User Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="m-2">
            <%@include file="components/message.jsp"%>
        </div>
        <h1><%= user.getUserName()%></h1>
    </body>
</html>
