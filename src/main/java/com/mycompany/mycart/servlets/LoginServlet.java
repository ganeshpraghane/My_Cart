
package com.mycompany.mycart.servlets;

import com.mycompany.mycart.dao.UserDao;
import com.mycompany.mycart.entities.Message;
import com.mycompany.mycart.entities.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email=request.getParameter("email");
            String password=request.getParameter("password");
//            validations


//            authenticating user
                UserDao userdao=new UserDao(FactoryProvider.getFactory());
                User user=userdao.getUserByEmailAndPass(email, password);
                HttpSession session=request.getSession();
                if(user==null){
                    Message msg=new Message("Invalid Details try again...","error","alert-danger");
                    session.setAttribute("msg",msg);
                    response.sendRedirect("login.jsp");
                    return;
                }
                else{
                    Message msg=new Message("Welcome...","success","alert-success");
                    session.setAttribute("msg",msg);
                    session.setAttribute("User",user);
                    if(user.getUserType().equals("admin"))
                    {
                        response.sendRedirect("admin.jsp");
                    }
                    else if(user.getUserType().equals("normal"))
                    {
                        response.sendRedirect("normal.jsp");
                    }
                    else{
                        out.println("we have not identified by user type");
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
