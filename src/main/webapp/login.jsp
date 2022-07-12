
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user=(User)session.getAttribute("User");
    if(user!=null){
        Message msg=new Message("You are already Logged in!!","error","alert-danger");
        session.setAttribute("msg",msg);
        if(user.getUserType().equals("normal")){
            response.sendRedirect("normal.jsp");
            return;
        }
        else if(user.getUserType().equals("admin")){
            response.sendRedirect("admin.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page - mycart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row my-4">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-header custom-bg text-center text-white p-0">
                            <span class="fa fa-user-plus fa-3x mt-1"></span>
                            <p>Login Here</p>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                
                                <div class="container text-center">
                                    <button type="submit" class=" btn text-white custom-bg mr-2">Submit</button>
                                    <button type="reset" class=" btn text-white custom-bg">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
