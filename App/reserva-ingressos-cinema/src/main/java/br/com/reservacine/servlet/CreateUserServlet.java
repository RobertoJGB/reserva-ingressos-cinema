package br.com.reservacine.servlet;

import br.com.reservacine.dao.UsersDao;
import br.com.reservacine.model.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet("/create-user")
public class CreateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String dtNasc = req.getParameter("dtNasc");
        String cpf = req.getParameter("cpf");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");


        Users user = new Users(name, dtNasc, cpf, email, senha);
        UsersDao usersDao = new UsersDao();

        ResultSet rs = null;
        try {
            // Verifica se o usuário já existe
            rs = usersDao.searchUser(user.getEmail());

            if (rs != null) {
                String achadoEmail = rs.getString("email");
                if (achadoEmail.equals(email)) {
                    // Caso o usuario já exista, redireciona para login.jsp com mensagem de erro
                    req.setAttribute("errorMessage", "Usuário já existe. Por favor, faça login.");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/login");
                    dispatcher.forward(req, resp);
                    return;
                }
            } else {
                // Cria o usuário se não foi encontrado
                usersDao.createUsers(user);
            }

        } catch (Exception e) {
            req.setAttribute("errorMessage", "Erro ao criar usuário: " + e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login");
            dispatcher.forward(req, resp);
            return;

        } finally {
            // Fecha o ResultSet
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                System.out.println("Erro ao fechar ResultSet: " + e.getMessage());
            }
        }

        // Redireciona para a página inicial após a criação bem-sucedida
        resp.sendRedirect("/login");
    }
}




