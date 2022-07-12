
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <!--bootstrap, css and js-->
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row my-4">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center custom-bg text-white p-0">
                            <span class="fa fa-user-circle mt-4 fa-3x"></span>
                            <br>
                            <p>SignUp Here!!</p>
                        </div>
                        <div class="card-body px-5">
                            <%@include file="components/message.jsp" %>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" id="name" class="form-control" required placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" id="email" class="form-control" required placeholder="Enter Email" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_pass" type="password" id="password" class="form-control" required placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" type="phone" id="phone" class="form-control" required placeholder="Enter Phone">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" id="address" class="form-control" placeholder="Enter Address" rows="5"></textarea>
                                </div>
                                <div class="container">
                                    <button class="btn btn-outline-success" type="submit">Register</button>
                                    <button class="btn btn-outline-warning" type="reset">Reset</button>
                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
