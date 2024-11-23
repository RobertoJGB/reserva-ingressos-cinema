<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="menu-icon" onclick="toggleMenu()">
        <img src="img/li.png" alt="Menu Icon">
    </div>
    <a href="/find-all-movies" class="logo" style="text-decoration: none; color: inherit;">PrimeTicket</a>
    <div class="icons">
        <img src="img/pesqui.png" alt="Pesquisar Icon">
        <span>Pesquisar</span> &nbsp;
        <c:choose>
            <c:when test="${not empty sessionScope.user}">

                <img src="img/user.png" alt="Login Icon">
            </c:when>
            <c:otherwise>
                <a href="/login" style="text-decoration: none; color: inherit;">
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

                 <a href="minhaConta.jsp" class="text-primary mt-2">Minha Conta</a>


                <button class="menu-button" onclick="window.location.href='SaibaMais.jsp'">Saiba mais sobre PrimeTicket</button>
                <form action="/logout" method="get">
                    <button type="submit" class="menu-button">Sair</button>
                </form>
            </c:when>
            <c:otherwise>
                Que tal <a href="/login.jsp" style="text-decoration: none; color: inherit; font-weight: bold;">criar uma
                conta?</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Carousel -->
<div class="container mt-5">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="img/coringa.png" class="d-block w-100 rounded-image custom-carousel-image"
                     alt="Imagem Star Wars">
            </div>
            <div class="carousel-item active">
                <img src="img/sonic.png" class="d-block w-100 rounded-image custom-carousel-image" alt="Imagem Sonic">
            </div>
            <div class="carousel-item">
                <img src="img/StarWars.jpg" class="d-block w-100 rounded-image custom-carousel-image"
                     alt="Imagem Star Wars">
            </div>
        </div>
    </div>
    <div class="button-container">
        <span class="carousel-button">Saiba mais</span>
        <span class="carousel-button">Comprar ingresso</span>
    </div>
</div>


<!-- Em Cartaz -->
<div class="container mt-5">
    <h1>Em Cartaz</h1>
    <div class="d-flex overflow-auto">
        <c:forEach var="movies" items="${movies}">
            <c:if test="${movies.emcart == 'emCartaz'}">
                <div class="card me-3" style="width: 18rem;">
                    <img src="${movies.image}" alt="poster" class="card-img-top"
                         style="height: 300px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">${movies.nomeFilme}</h5>
                        <a href="sinopse.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                        &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}" class="btn btn-primary">Comprar Ingresso</a>
                        <c:if test="${sessionScope.user != null}">
                        <!-- Formulário de Delete -->
                        <form action="/delete-movie" method="post" class="mt-2">
                            <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <!-- Link para Update -->
                        <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                        &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}"
                           class="text-primary mt-2">Update</a>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<!-- Em Breve -->
<div class="container mt-5">
    <h1>Em Breve</h1>
    <div class="d-flex overflow-auto">
        <c:forEach var="movies" items="${movies}">
            <c:if test="${movies.emcart == 'emBreve'}">
                <div class="card me-3" style="width: 18rem;">
                    <img src="${movies.image}" alt="poster" class="card-img-top"
                         style="height: 300px; object-fit: cover;">
                    <div class="card-body text-center">
                        <h5 class="card-title">${movies.nomeFilme}</h5>
                        <a href="#" class="btn btn-primary">Comprar Ingresso</a>
                        <c:if test="${sessionScope.user != null}">
                        <!-- Formulário de Delete -->
                        <form action="/delete-movie" method="post" class="mt-2">
                            <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                        <!-- Link para Update -->
                        <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                        &classInd=${movies.classInd}&duracao=${movies.duracao}&image=${movies.image}"
                           class="text-primary mt-2">Update</a>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<script>
    function toggleMenu() {
        var menu = document.getElementById("sideMenu");
        menu.classList.toggle("active");
    }
</script>

</body>
</html>
