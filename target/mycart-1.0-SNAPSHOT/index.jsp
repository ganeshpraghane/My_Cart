<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
        <!--bootstrap, css and js-->
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp"%>
        <div class="container">
            <div class="row my-3">
                <!--categories-->
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="index.jsp?cat=all" onclick="isActive(this)" class="c-link list-group-item list-group-item-action active">
                            All Products
                        </a>
                        <%  
                            String cat=request.getParameter("cat");
//                            out.println(cat);
                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list = cdao.getCategories();
                            for (Category c : list) {
                        %>
                        <a href="index.jsp?cat=<%=c.getCategoryId()%>" onclick="isActive(this)" class="c-link list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                        <%
                            }
                        %>  
                    </div>
                </div>
                <!--products-->
                <div class="col-md-8">
                    <section style="background-color: #eee;">
                        <div class="container py-5">
                            <div class="row">
                                <div class="col-md-12">
                                    <%
                                        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                                        List<Product> list1=null;
                                        
                                        if(cat==null || cat.trim().equals("all")){
                                            list1 = pdao.getAllProducts();
                                        }
                                        else{
                                            int cid=Integer.parseInt(cat.trim());
                                            list1=pdao.getAllProductsById(cid);
                                        }
                                        if(list1.size()==0){
                                            out.println("<h1>No Products in this Category</h1>");
                                        }
                                        for (Product p : list1) {
                                    %>
                                    <div class="card mb-2 product-card">
                                        <div class="d-flex justify-content-between p-3">
                                            <p class="lead mb-0">Today's Combo Offer</p>
                                            <div
                                                class="bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong"
                                                style="width: 35px; height: 35px;">
                                                <p class="text-white mb-0 small">x4</p>
                                            </div>
                                        </div>
                                        <div class="container text-center">
                                            <img src="product_pic/<%=p.getpPhoto()%>" style="max-width: 250px; max-height: 450px;" class="card-img-top" alt="Laptop" />
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <p class="small"><a href="#!" class="text-muted">Laptops</a></p>
                                                <p class="small text-danger"><s>&#x20B9;<%=p.getpPrice()%></s></p>
                                            </div>

                                            <div class="mb-3">
                                                <h5 class="mb-0"><%=p.getpName()%></h5>
                                                <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                                            </div>

                                            <div class="d-flex justify-content-between mb-2">
                                                <p class="text-muted mb-0">Available: <span class="fw-bold"><%=p.getpQuantity()%></span></p>
                                                <div class="ms-auto text-warning">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">

                                            <button onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpPrice()%>)" class="btn custom-bg text-white">Add to Cart</button>
                                            <button class="btn btn-outline-success">&#x20B9;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#x20B9;<%=p.getpPrice()%>,<%=p.getpDiscount()%>% off</span></button>
                                        </div>
                                    </div>
                                    <%
                                        }
                                        
                                    %>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
            </div>
                      
                                
                                
                  <!--cart modal-->
                  <%@include file="components/common_modals.jsp" %>
                                
                                
            <script> 
//                let buttons=document.querySelectorAll('.button');
//                buttons.forEach(button =>{
//                    button.addEventListener('click',function(){
//                        buttons.forEach(btn=> btn.classList.remove('active'));
//                            this.classList.add('active');
//                    })
//                })
//                    $(document).on('click','.button1',function(){
//                        $(this).addClass('active').siblings().removeClass('active');
//                    })
//                function isActive(temp){
//                    $('.c-link').attr('active',false);
//                    $(temp).attr('active',true);
//                }
//                $(document).ready(function(e){
//                    let allPostRef = $('.c-link')[0];
//                    isActive(allPostRef);
//            })
//                function isActive(temp){
//                    $('.c-link').removeClass('active');
//                    $(temp).addClass('active');
//                }
//                $(document).ready(function(e){
//                    let allPostRef = $('.c-link')[0];
//                    isActive(allPostRef);
//            })
            </script>                   
    </body>
</html>
