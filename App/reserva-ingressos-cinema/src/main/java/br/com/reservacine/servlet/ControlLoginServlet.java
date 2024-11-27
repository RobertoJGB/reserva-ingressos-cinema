package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;
import br.com.reservacine.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class ControlLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("loginEmail");
        String senha = req.getParameter("loginSenha");

        UsersDao usersDao = new UsersDao();
        Users user = usersDao.searchUsers(email, senha);


        try {
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("/find-all-movies");
            } else {
                req.setAttribute("errorMessage", "E-mail ou senha incorretos.");
                req.getRequestDispatcher("/loginC").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Erro no processamento do login.");
            req.getRequestDispatcher("/loginC").forward(req, resp);
        }
    }
}
