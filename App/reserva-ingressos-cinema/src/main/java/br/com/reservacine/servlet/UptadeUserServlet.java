package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;
import br.com.reservacine.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/update-user")
public class UptadeUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String nome = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String dtNasc = req.getParameter("dtNasc");

        UsersDao uD = new UsersDao();
        Users user = new Users(id, nome, dtNasc, cpf, email, senha);
        if(id != null){
            uD.updateUser(user);
            req.setAttribute("successMessage", "Alteração bem sucedida");
            resp.sendRedirect("/find-acount?email=" + user.getEmail());
        }else{
            req.setAttribute("errorMessage", "Erro na alteração");
            resp.sendRedirect("/find-acount?email=" + user.getEmail());
        }



    }
}
