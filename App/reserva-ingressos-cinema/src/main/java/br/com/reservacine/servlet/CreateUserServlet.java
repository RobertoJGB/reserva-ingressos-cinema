package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;
import br.com.reservacine.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-user")
public class CreateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String dtNasc = req.getParameter("dtNasc");
        String cpf = req.getParameter("cpf");
        String usuario = req.getParameter("usuario");
        String senha = req.getParameter("senha");


        Users users = new Users(name,dtNasc,cpf,usuario,senha);


        UsersDao usersDao = new UsersDao();
        usersDao.createUsers(users);

        resp.sendRedirect("/index.jsp");
    }
}
