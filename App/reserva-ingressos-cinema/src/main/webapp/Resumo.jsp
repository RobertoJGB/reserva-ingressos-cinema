<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <title>Resumo da Reserva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
    <style>
        .navbar {
            background-color: black;
            color: white;
            display: flex;
            align-items: center;
            height: 55px;
            position: relative;
        }

        .menu-icon img {
            width: 24px;
            cursor: pointer;
            position: absolute;
            left: 3px;
        }

        .logo {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin: 0 auto;
            flex: 1;
        }

        .icons {
            position: absolute;
            right: 10px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .icons img {
            width: 24px;
            cursor: pointer;
        }

        .icons span {
            color: white;
            font-size: 14px;
        }
    </style>
</head>
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
                Que tal <a href="/login.jsp" style="text-decoration: none; color: inherit; font-weight: bold;">criar uma
                conta?</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<body>
<!-- Navbar -->
<div class="navbar">
    <!-- Ícone do Menu -->
    <div class="menu-icon" onclick="toggleMenu()">
        <img src="img/li.png" alt="Menu Icon">
    </div>

    <!-- Logo Centralizada -->
    <div class="logo">
        <a href="/find-all-movies" style="text-decoration: none; color: inherit;">PrimeTicket</a>
    </div>

    <!-- Ícones de Pesquisar e Conta -->
    <div class="icons">
        <div>
            <img src="img/pesqui.png" alt="Pesquisar Icon" onclick="window.location.href='/pesquisar.jsp'">
            <span>Pesquisar</span>
        </div>
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div>
                    <a href="/minhaConta.jsp" style="text-decoration: none; color: inherit;">
                        <img src="img/user.png" alt="Conta Icon">
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <a href="/login.jsp" style="text-decoration: none; color: inherit;">
                        <img src="img/user.png" alt="Login Icon">
                        <span>Entre ou Cadastre-se</span>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Conteúdo Principal -->
<div class="container mt-5 text-center text-white">
    <h1>Resumo da Reserva</h1>
    <div class="card mx-auto mt-3" style="width: 400px; background-color: black; border: none;">

        <div class="card-body">
            <p class="card-text text-white text-start">
                <strong>DEADPOOL & WOLVERINE</strong><br>
                Assento - E8<br>
                20 SETEMBRO 2024<br>
                22H<br>
                ASTROGILDO<br>
                123456789-00
            </p>
            <button class="btn btn-primary w-100" onclick="finalizarReserva()">Finalizar Reserva</button>
        </div>
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
</script>
</body>
</html>
