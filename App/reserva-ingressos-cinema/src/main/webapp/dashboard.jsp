<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
</head>
<style>
    /* Estilo para o card do filme */
    .movie-card {
        border: none;
        position: relative;
        overflow: hidden;
        border-radius: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background-color: #121212;
    }

    .movie-card:hover {
        transform: scale(1.03);
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.5);
    }

    /* Imagem com efeito dinâmico */
    .image-container img {
        border-radius: 20px;
        transition: transform 0.4s ease-in-out, filter 0.4s ease-in-out;
    }

    .movie-card:hover img {
        transform: scale(1.1);
        filter: brightness(80%);
    }

    /* Camada de sobreposição escura */
    .overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 20px;
        background: linear-gradient(to top, rgba(0, 0, 0, 0.85), transparent);
        text-align: center;
    }

    /* Título do filme */
    .overlay h4 {
        font-size: 1.8rem;
        color: #fff;
        font-weight: bold;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
        margin-bottom: 15px;
    }

    /* Botão elegante */
    .btn-action {
        display: inline-block;
        background-color: #e50914;
        color: white;
        font-weight: bold;
        padding: 12px 20px;
        border: none;
        border-radius: 10px;
        font-size: 1rem;
        text-transform: uppercase;
        transition: background-color 0.3s ease, transform 0.3s ease;
        box-shadow: 0 4px 12px rgba(229, 9, 20, 0.4);
    }

    .btn-action:hover {
        background-color: #ff0a16;
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(255, 10, 22, 0.6);
    }

    /* Texto com sombra */
    .text-shadow {
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
    }
</style>


<body>

<!-- Navbar -->
<div class="navbar">
    <div class="menu-icon" onclick="toggleMenu()">
        <img src="img/li.png" alt="Menu Icon">
    </div>
    <a href="/find-all-movies" class="logo" style="text-decoration: none; color: inherit;">PrimeTicket</a>
    <div class="icons">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <a href="minhaConta.jsp">
                    <img src="img/user.png" alt="Login Icon">
                </a>

            </c:when>
            <c:otherwise>
                <a href="/login.jsp" style="text-decoration: none; color: inherit;">
                    <img src="img/user.png" alt="Login Icon">
                    <span>Entre ou Cadastre-se</span>
                </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </c:otherwise>
        </c:choose>

    </div>
</div>

<!-- Side Menu -->
<div class="side-menu" id="sideMenu">
    <br><br>
    <div class="menu-header">
        <h2>Perfil</h2>
    </div>
    <div class="menu-content">
        <!-- Controle de diferenciação de logado ou não -->
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                Ola, ${sessionScope.user.nome}
                <button class="menu-button" onclick="window.location.href='minhaConta.jsp'">Minha Conta</button>
                <button class="menu-button" onclick="window.location.href='SaibaMais.jsp'">Saiba mais sobre
                    PrimeTicket
                </button>
                <form action="/logout" method="get">
                    <button type="submit" class="menu-button">Sair</button>
                </form>
            </c:when>
            <c:otherwise>
                Que tal <a href="/loginC" style="text-decoration: none; color: inherit; font-weight: bold;">criar uma
                conta?</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Carousel -->
<div class="container mt-5">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="movie" items="${movies}" varStatus="status">
                <c:if test="${movie.emcart == 'emDestaq'}">
                    <!-- Verifica se é o primeiro item e atribui a classe 'active' -->
                    <div class="carousel-item ${status.first ? 'active' : ''}">
                        <!-- Envolvendo a imagem do carrossel com um link -->
                        <a href="/find-session?id=${movie.idMovie}&nomeFilme=${movie.nomeFilme}&genero=${movie.genero}
                            &sinopse=${movie.sinopse}&classInd=${movie.classInd}&duracao=${movie.duracao}&image=${movie.image}">
                            <img src="${movie.image}" class="d-block w-100 rounded-image custom-carousel-image"
                                 alt="Imagem de ${movie.nomeFilme}">
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- Botões de navegação -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleSlidesOnly" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleSlidesOnly" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

    


<div class="container mt-5">
    <h1 class="display-4 mb-4 text-light">Filmes em Cartaz</h1>
    <div class="d-flex overflow-auto">
        <c:forEach var="movies" items="${movies}">
            <c:if test="${movies.emcart == 'emCartaz'}">
                <div class="movie-card me-4" style="width: 250px; position: relative; border-radius: 15px; overflow: hidden;">

                    <!-- Camada da imagem com efeitos de iluminação -->
                    <div class="image-container position-relative">
                        <img src="${movies.image}" alt="Poster" class="w-100 h-100"
                             style="height: 350px; object-fit: cover; filter: brightness(70%); transition: all 0.4s ease;">
                        <div class="overlay d-flex flex-column justify-content-end p-2">
                            <h5 class="text-white text-shadow mb-2">${movies.nomeFilme}</h5>
                            <a href="/find-session?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                            &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}"
                            class="btn btn-action">Assistir Agora</a>
                        </div>
                    </div>

                    <!-- Ações adicionais para admin (Delete e Update) -->
                    <c:if test="${sessionScope.user != null}">
                        <div class="p-2 text-center">
                            <!-- Formulário de Delete -->
                            <form action="/delete-movie" method="post" class="mt-2">
                                <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                            <!-- Link para Update -->
                            <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                                &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}"
                               class="btn btn-outline-primary mt-2" style="font-weight: bold; border-radius: 8px;">Update</a>
                        </div>
                    </c:if>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>




<div class="container mt-5">
    <h1 class="display-4 mb-4 text-light">Em Breve</h1>
    <div class="d-flex overflow-auto">
        <c:forEach var="movies" items="${movies}">
            <c:if test="${movies.emcart == 'emBreve'}">
                <div class="movie-card me-4" style="width: 250px; position: relative; border-radius: 15px; overflow: hidden;">

                    <!-- Camada da imagem com efeitos de iluminação -->
                    <div class="image-container position-relative">
                        <img src="${movies.image}" alt="Poster" class="w-100 h-100"
                             style="height: 350px; object-fit: cover; filter: brightness(70%); transition: all 0.4s ease;">
                        <div class="overlay d-flex flex-column justify-content-end p-2">
                            <button class="btn btn-secondary" disabled style="opacity: 0.8;">Em Breve</button>
                        </div>
                    </div>

                    <!-- Ações adicionais para admin (Delete e Update) -->
                    <c:if test="${sessionScope.user != null}">
                        <div class="p-2 text-center">
                            <!-- Formulário de Delete -->
                            <form action="/delete-movie" method="post" class="mt-2">
                                <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                            <!-- Link para Update -->
                            <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                                &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}"
                               class="btn btn-outline-primary mt-2" style="font-weight: bold; border-radius: 8px;">Update</a>
                        </div>
                    </c:if>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<script>
    function toggleMenu() {
        var menu = document.getElementById("sideMenu");
        menu.classList.toggle("active");
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
