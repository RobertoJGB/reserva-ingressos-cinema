<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <title>Carrinho</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
    <link rel="stylesheet" href="css/saibaMais.css">

</head>
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
                <a href="login.jsp" style="text-decoration: none; color: inherit;">
                    <img src="img/user.png" alt="Login Icon">
                    <span>Entre ou Cadastre-se</span>
                </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </c:otherwise>
        </c:choose>
    </div>
</div>

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
                <button class="menu-button">Minha Conta</button>
                <button class="menu-button">Meus Ingressos</button>
                <button class="menu-button">Saiba mais sobre PrimeTicket</button>
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
<main>
    <section class="topo-do-site" id="inicio">
        <div class="interface">
            <div class="flex">
                <div class="txt-topo">
                    <h2 class="titulo">CONFIRMAÇÃO DE <span>RESERVA</span></h2><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="img/chec.png" alt="teste">
                    <p>Obrigado por realizar a reserva conosco!<br>Va ao caixa do cinema e apresente o código: ID</p>
                </div>
            </div>
        </div>
    </section>
</main>


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
