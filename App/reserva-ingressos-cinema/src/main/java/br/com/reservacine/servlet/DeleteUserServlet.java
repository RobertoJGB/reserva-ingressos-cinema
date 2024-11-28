package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        UsersDao uD = new UsersDao();

            uD.deleteUserById(id);
            req.setAttribute("successMessage", "Exclusão bem sucedida");
            resp.sendRedirect("/logout");




    }
}
