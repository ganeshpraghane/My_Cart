<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.Message"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("User");
    if (user == null) {
        Message msg = new Message("You are not logged in ! login first...", "error", "alert-danger");
        session.setAttribute("msg", msg);
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            Message msg = new Message("You are not admin ! don't access...", "error", "alert-danger");
            session.setAttribute("msg", msg);
            response.sendRedirect("normal.jsp");
            return;
        }
    }
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
//    getting count
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container admin">
            <div class="my-2">
                <%@include file="components/message.jsp"%>
            </div>
            <div class="row my-3">
                <!--first column-->
                <div class="col-md-4 mb-2">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/team.png" alt="user-img">
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 style="font-size:3vw;" class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <!--second column-->
                <div class="col-md-4 mb-2">
                    <!--second box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/options.png" alt="user-img">
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 style="font-size:3vw;" class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div
                <!--third column-->
                <div class="col-md-4 mb-2">
                    <!--third box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/shipping.png" alt="user-img">
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 style="font-size:3vw;" class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!--second row-->
            <div class="row my-3">
                <div class="col-md-6 mb-2">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/menu.png" alt="user-img">
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 style="font-size:3vw;" class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-2">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user-img">
                            </div>
                            <p class="mt-2">Click here to add new Product</p>
                            <h1 style="font-size:3vw;" class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- start add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class="form-group">
                                <input type="text" name="catTitle" class="form-control" placeholder="Enter Category Title" required />
                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px" class="form-control" name="catDescription" placeholder="Enter Category Description"></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success mr-2">Add Category</button>
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end add category modal-->
        <!--start add product modal-->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"/>
                            <div class="form-group">
                                <input type="text" name="pName" class="form-control" placeholder="Enter Product Name" required />
                            </div>
                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" name="pDescription" placeholder="Enter Product Description"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" name="pPrice" class="form-control" placeholder="Enter Product Price" required />
                            </div>
                            <div class="form-group">
                                <input type="number" name="pDiscount" class="form-control" placeholder="Enter Product Discount" required />
                            </div>
                            <div class="form-group">
                                <input type="number" name="pQuantity" class="form-control" placeholder="Enter Product Quantity" required />
                            </div>
                            <!--product category-->
                            <div class="form-group">
                                <select name="catId" class="form-control">
                                    <option disabled selected>--Select Category--</option>
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value=<%=c.getCategoryId()%>><%=c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Select Photo of Product</label>
                                <br>
                                <input type="file" name="pPhoto"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success mr-2">Add Product</button>
                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end add product modal-->
        <!--cart modal-->
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
