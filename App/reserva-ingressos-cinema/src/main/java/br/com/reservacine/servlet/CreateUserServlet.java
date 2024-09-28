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

        String UserName = req.getParameter("user-name");
        String dtNasc = req.getParameter("data-nascimento");

        System.out.println(UserName);
        System.out.println(dtNasc);

        Users users = new Users();
        users.setNomeUsuario(UserName);
        users.setDtNasc(dtNasc);

        UsersDao usersDao = new UsersDao();
        usersDao.createUsers(users);

        req.getRequestDispatcher("index.html").forward(req,resp);
    }
}
