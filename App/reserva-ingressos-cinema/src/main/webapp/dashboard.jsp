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
        <img src="img/list.png" alt="Menu Icon">
    </div>
    <div class="logo">PrimeTicket</div>
    <div class="icons">
        <span>Pesquisar</span>
        <img src="img/pesq.png" alt="Pesquisar Icon">
        <a href="login.jsp" style="text-decoration: none; color: inherit;">
            <span>Entre ou Cadastre-se</span>
            <img src="img/user.png" alt="Login Icon">
        </a>
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
            <c:when test="${not empty sessionScope.loggeduser}">
                Olá, ${sessionScope.loggeduser}
                <button class="menu-button">Minha Conta</button>
                <button class="menu-button">Meus Ingressos</button>
                <button class="menu-button">Saiba mais sobre PrimeTicket</button>
                <form action="/logout" method="get">
                    <button type="submit" class="menu-button">Sair</button>
                </form>
            </c:when>
            <c:otherwise>
                Que tal <a href="login.jsp" style="text-decoration: none; color: inherit; font-weight: bold;">criar uma conta?</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Carousel -->
<div class="container mt-5">
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/sonic.png" class="d-block w-100 rounded-image" alt="Imagem Sonic">
            </div>
            <div class="carousel-item">
                <img src="img/StarWars.jpg" class="d-block w-100 rounded-image" alt="Imagem Star Wars">
            </div>
        </div>
    </div>
</div>
<!-- Em Cartaz -->
<div class="container mt-5">
    <h1>Em Cartaz</h1>
    <div class="row">
        <c:forEach var="movies" items="${movies}">
        <c:if test="${movies.emcart == 'emCartaz'}">
        <div class="col-md-3 mb-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="img/mufasa.jpg" alt="Leao cap">
                <div class="card-body">
                    <p class="card-text">Filme do leao.</p>
                </div>
            </div>
            <a href="#" class="btn btn-primary">Comprar Ingresso</a>
            <form action="/delete-movie" method="post" class="mt-2">
                <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                <button type="submit" class="btn btn-danger">Delete</button>
                <!-- Envia para index os parametros do filme escolhido para update -->
                <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                &classInd=${movies.classInd}&duracao=${movies.duracao}"
                   class="text-primary">Update</a>
            </form>
        </div>
    </div>
</div>
</c:if>
</c:forEach>

<!-- Em Breve -->
<div class="container mt-5">
    <h1>Em Breve</h1>
    <div class="row">
        <c:forEach var="movies" items="${movies}">
            <c:if test="${movies.emcart == 'emBreve'}">
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img class="card-img-top" src="img/${movies.nomeFilme}.jpg" alt="${movies.nomeFilme}">
                        <div class="card-body">
                            <h5 class="card-title">${movies.nomeFilme}</h5>
                            <p class="card-text">${movies.genero}</p>
                            <a href="#" class="btn btn-primary">Comprar Ingresso</a>
                            <form action="/delete-movie" method="post" class="mt-2">
                                <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                                <!-- Envia para index os parametros do filme escolhido para update -->
                                <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}
                                &classInd=${movies.classInd}&duracao=${movies.duracao}"
                                   class="text-primary">Update</a>
                            </form>
                        </div>
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
