package br.com.reservacine.servlet;


import br.com.reservacine.dao.MoviesDao;
import br.com.reservacine.model.Movies;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;

@WebServlet("/create-movie")
public class CreateMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Map<String, String> parameters = uploadImage(req);


        String idMovie = parameters.get("id");

        String NOMEFILME = parameters.get("nomeFilme");

        String GENERO = parameters.get("genero");

        String SINOPSE = parameters.get("sinopse");

        String CLASSIND = parameters.get("classind");

        String DURACAO = parameters.get("duracao");

        String emcart = parameters.get("categoria");

        String movieImagePath = parameters.get("image");


        MoviesDao moviesDao = new MoviesDao();

        if (idMovie.isBlank()) {
            Movies movies = new Movies(NOMEFILME, GENERO, SINOPSE, CLASSIND, DURACAO, emcart, movieImagePath);
            moviesDao.createMovie(movies);
        } else {
            Movies movies = new Movies(idMovie, NOMEFILME, GENERO, SINOPSE, CLASSIND, DURACAO, emcart, movieImagePath);
            moviesDao.updateMovie(movies);
        }


        resp.sendRedirect("/find-all-movies");

    }

    private String processUploadedFile(FileItem fileItem) throws Exception {
        Long currentTime = new Date().getTime();
        String fileName = currentTime.toString().concat("-").concat(fileItem.getName().replace(" ", ""));
        String filePath = this.getServletContext().getRealPath("img").concat(File.separator).concat(fileName);
        fileItem.write(new File(filePath));
        return fileName;
    }

    private void checkFieldType(FileItem item, Map requestParameters) throws Exception {

        if (item.isFormField()) {

            requestParameters.put(item.getFieldName(), item.getString());

        } else {

            String fileName = processUploadedFile(item);
            requestParameters.put("image", "img/".concat(fileName));

        }

    }

    private Map<String, String> uploadImage(HttpServletRequest httpServletRequest) {

        Map<String, String> requestParameters = new HashMap<>();

        if (isMultipartContent(httpServletRequest)) {

            try {

                DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

                List<FileItem> fileItems = new ServletFileUpload(diskFileItemFactory).parseRequest(httpServletRequest);

                for (FileItem fileItem : fileItems) {

                    checkFieldType(fileItem, requestParameters);

                }

            } catch (Exception ex) {

                requestParameters.put("image", "img/default-car.jpg");

            }

        }

        return requestParameters;

    }
}
