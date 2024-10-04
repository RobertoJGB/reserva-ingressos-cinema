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
        String dtNasc = req.getParameter("data-nascimento");
        String cpf = req.getParameter("");
        String usuario = req.getParameter("");
        String senha = req.getParameter("");

        System.out.println(name);
        System.out.println(dtNasc);

        Users users = new Users();
        users.setNome(name);
        users.setDtNasc(dtNasc);
        users.setCpf(cpf);
        users.setCpf(usuario);
        users.setCpf(senha);

        UsersDao usersDao = new UsersDao();
        usersDao.createUsers(users);

        req.getRequestDispatcher("index.html").forward(req,resp);
    }
}
