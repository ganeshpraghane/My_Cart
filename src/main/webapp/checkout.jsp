<%@page import="com.mycompany.mycart.entities.Message"%>
<%
    User user = (User) session.getAttribute("User");
    if (user == null) {
        Message msg = new Message("You are not logged in ! login first to access Checkout Page...", "error", "alert-danger");
        session.setAttribute("msg", msg);
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row my-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your Selected Items</h3>
                            <div class="cart-body">
                                
                            </div>  
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your Details For Order</h3>
                            <form>
                                <div class="form-group">
                                    <label>Name:</label>
                                    <input value="<%=user.getUserEmail()%>" type="text" class="form-control" placeholder="Enter Your Name" name="name"/>
                                </div>
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" placeholder="Enter Your Email" name="email"/>
                                </div>
                                <div class="form-group">
                                    <label>Phone:</label>
                                    <input value="<%=user.getUserPhone()%>" type="phone" class="form-control" placeholder="Enter Your Phone" name="phone"/>
                                </div>
                                <div class="form-group">
                                    <label>Address:</label>
                                    <textarea value="<%=user.getUserAddress()%>" class="form-control" rows="5" name="address" placeholder="Enter Your Shipping Address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
