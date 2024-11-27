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


@WebServlet("/find-acount")
public class FindMinhaContaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        UsersDao dao = new UsersDao();
        Users user = dao.searchUser(email);

        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        req.getRequestDispatcher("/minhaConta.jsp").forward(req, resp);


    }
}
