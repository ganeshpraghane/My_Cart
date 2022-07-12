<%@page import="com.mycompany.mycart.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%
    Message msg= (Message) session.getAttribute("msg");
//    System.out.println(msg);
    if (msg != null) {
%>
<div class="alert <%=msg.getCssStyle()%> alert-dismissible fade show" role="alert">
    <strong><%=msg.getContent()%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
    session.removeAttribute("msg");
%>