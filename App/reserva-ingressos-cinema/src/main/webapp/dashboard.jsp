<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="menu-icon">Menu</div>
        <div class="logo">PrimeTicket</div>
        <div class="icons">
            <img src="../../../Imagens/Login.png" alt="Login Icon">
            <img src="../../../Imagens/Pesquisar.png" alt="Pesquisar Icon">
        </div>
    </div>
    <div class="container">
        <h1>Movies</h1>
        <br>
        <div class="container mt-5">
            <h1>Em Cartaz</h1>
            <div class="row">
                <c:forEach var="movies" items="${movies}">
                    <div class="col-md-3">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">${movies.nomeFilme}</h5>
                                <p class="card-text">${movies.genero}</p>
                                <a href="#" class="btn btn-primary">Comprar Ingresso</a>
                                <form action="/delete-movie" method="post" class="mt-2">
                                    <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                    <span> | </span>
                                    <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}&classInd=${movies.classInd}&duracao=${movies.duracao}" class="text-primary">Update</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Seção "Em Breve" -->
            <h1 class="mt-5">Em Breve</h1>
            <div class="row">
                <c:forEach var="upcomingMovies" items="${upcomingMovies}">
                    <div class="col-md-3">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">${upcomingMovies.nomeFilme}</h5>
                                <p class="card-text">${upcomingMovies.genero}</p>
                                <a href="#" class="btn btn-primary">Saiba Mais</a>
                                <form action="/delete-movie" method="post" class="mt-2">
                                    <input type="hidden" id="idMovie" name="idMovie" value="${upcomingMovies.idMovie}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                    <span> | </span>
                                    <a href="index.jsp?id=${upcomingMovies.idMovie}&nomeFilme=${upcomingMovies.nomeFilme}&genero=${upcomingMovies.genero}&sinopse=${upcomingMovies.sinopse}&classInd=${upcomingMovies.classInd}&duracao=${upcomingMovies.duracao}" class="text-primary">Update</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
