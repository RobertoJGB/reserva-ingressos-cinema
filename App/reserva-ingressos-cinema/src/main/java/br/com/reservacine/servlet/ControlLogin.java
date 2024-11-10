package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/login")
public class ControlLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("loginEmail");
        String senha = req.getParameter("loginSenha");

        UsersDao usersDao = new UsersDao();
        ResultSet resultSet = usersDao.searchUsers(email, senha);

        try {
            if (resultSet != null) {
                resp.sendRedirect("dashboard.jsp");
            } else {
                req.setAttribute("errorMessage", "E-mail ou senha incorretos.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Erro no processamento do login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
