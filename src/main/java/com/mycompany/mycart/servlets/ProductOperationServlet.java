
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.dao.ProductDao;
import com.mycompany.mycart.entities.Category;
import com.mycompany.mycart.entities.Message;
import com.mycompany.mycart.entities.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import com.mycompany.mycart.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            operation 2:
//            add category and add servlet
              String operation=request.getParameter("operation");
//              System.out.println(operation);
              if(operation.trim().equals("addcategory")){
//                  fetching add category data  
                    String title=request.getParameter("catTitle");
                    String desc=request.getParameter("catDescription");
                    Category category=new Category();
                    category.setCategoryTitle(title);
                    category.setCategoryDescription(desc);
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    HttpSession session=request.getSession();
                    if(cdao.saveCategory(category)){
                    Message msg= new Message("Category Added Successfully...","success","alert-success");
                    session.setAttribute("msg",msg);
                    response.sendRedirect("admin.jsp");
                    return;
                    }
                    else{
                        Message msg=new Message("Something went wrong! try again...","error","alert-danger");
                        session.setAttribute("msg",msg);
                        response.sendRedirect("admin.jsp");
                        return;
                    }
              }
              else if(operation.trim().equals("addproduct")){
//                  fetching add product data
                    String pname=request.getParameter("pName");
                    String pdesc=request.getParameter("pDescription");
                    int pprice=Integer.parseInt(request.getParameter("pPrice"));
                    int pdiscount=Integer.parseInt(request.getParameter("pDiscount"));
                    int pquantity=Integer.parseInt(request.getParameter("pQuantity"));
                    int cid=Integer.parseInt(request.getParameter("catId"));
                    Part part=request.getPart("pPhoto");
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    Category category=cdao.getCategoryById(cid);
                    Product p=new Product(pname,pdesc,part.getSubmittedFileName(),pprice,pdiscount,pquantity,category);
                    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                    HttpSession session=request.getSession();
                    if(pdao.saveProduct(p)){
//                        String path="H:\\NetBeansJavaProjects\\mycart\\src\\main\\webapp\\product_pic\\"+part.getSubmittedFileName();
                        String path=request.getRealPath("product_pic")+File.separator+part.getSubmittedFileName();
                        System.out.println(path);
                        Helper.saveFile(part.getInputStream(), path);
                        Message msg=new Message("Product Added Successfully...","success","alert-success");
                        session.setAttribute("msg",msg);
                        response.sendRedirect("admin.jsp");
                        return;
                    }
                    else{
                        Message msg=new Message("Something went wrong! try again...","error","alert-danger");
                        session.setAttribute("msg",msg);
                        response.sendRedirect("admin.jsp");
                        return;
                    }
              }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
