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

        if (lugarEsc != null && !lugarEsc.isEmpty()) {

            String[] seats = lugarEsc.split(",");


            for (String seat : seats) {

                int idLugarSessao = ld.mapearIdLugar(seat);


                if (idLugarSessao != -1) {
                    ld.reservarLugar(idLugarSessao);
                } else {
                    System.out.println("Lugar não encontrado: " + seat);
                }
            }
        }else{
            System.out.println("ERROOODAODOAD");
        }




        resp.sendRedirect("confirmacao.jsp");
    }
}

