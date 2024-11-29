package br.com.reservacine.servlet;

import br.com.reservacine.dao.LugarSessaoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/save-seat")
public class ReservarAssentoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LugarSessaoDao ld = new LugarSessaoDao();

        String lugarEsc = req.getParameter("assento");
        String idUser = req.getParameter("idUser");
        String idMovie = req.getParameter("idMovie");
        String idSession = req.getParameter("idSession");

        if (lugarEsc != null && !lugarEsc.isEmpty()) {
            String[] seats = lugarEsc.split(",");

            for (String seat : seats) {
                int idLugarSessao = ld.mapearIdLugarPorSessao(seat, idSession);

                if (idLugarSessao != -1) {
                    ld.reservarLugar(idLugarSessao);
                } else {
                    System.out.println("Lugar não encontrado: " + seat);
                }
            }

            // Armazenando lugarEsc na sessão
            req.getSession().setAttribute("lugarEsc", lugarEsc); // Modificado para salvar na sessão
            req.getSession().setAttribute("idUser", idUser);     // Armazenando os outros parâmetros, se necessário
            req.getSession().setAttribute("idMovie", idMovie);
            req.getSession().setAttribute("idSession", idSession);
        } else {
            System.out.println("Nenhum assento foi selecionado.");
        }

        // Redireciona para a próxima servlet para criar o ticket
        req.getRequestDispatcher("/create-ticket").forward(req, resp);
    }
}
