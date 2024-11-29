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
                Que tal <a href="/loginC" style="text-decoration: none; color: inherit; font-weight: bold;">criar uma
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
                    <a href="/loginC" style="text-decoration: none; color: inherit;">
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
    <div class="card-body p-4">
        <!-- Informações do Filme -->
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-4">
                    <img src="${movie[0].image}" alt="${movie[0].nomeFilme}" class="img-fluid rounded" style="border-radius: 10px;">
                </div>
                <div class="col-md-8 text-start">
                    <h2 style="font-size: 2em; font-family: 'Poppins', sans-serif;">${movie[0].nomeFilme}</h2>
                    <p style="font-size: 1.2em; margin-bottom: 8px;">Genero: <span style="font-weight: 600;">${movie[0].genero}</span></p>
                    <p style="font-size: 1.2em; margin-bottom: 8px;">Classificacao Indicativa: <span style="font-weight: 600;">${movie[0].classInd}</span></p>
                    <p style="font-size: 1.2em; margin-bottom: 8px;">Duracao: <span style="font-weight: 600;">${movie[0].duracao} minutos</span></p>
                    <p style="font-size: 1.2em; margin-bottom: 8px;">Sinopse:</p>
                    <p style="font-size: 1.1em; font-weight: 300;">${movie[0].sinopse}</p>
                    <p style="font-size: 1.2em; margin-bottom: 8px;">Sala: <span style="font-weight: 600;">${session[0].sala}</span></p>
                    <p style="font-size: 1.2em;">Horario: <span style="font-weight: 600;">${session[0].horario}</span></p>
                </div>
            </div>
        </div>
        <!-- Assentos Selecionados -->
        <h3 class="mt-4">Assentos Selecionados:</h3>
        <ul class="list-group">
            <c:forEach var="assento" items="${lugarEsc}">
                <li class="list-group-item" style="background-color: black; color: white;">${assento}</li>
            </c:forEach>
        </ul>

        <!-- Botão Finalizar -->
        <form action="/save-seat" method="post">
            <!-- Campo escondido para enviar os assentos selecionados -->
            <input type="hidden" id="assento" name="assento" value="${lugarEsc}">

            <button type="submit" class="btn btn-outline-success w-50 mt-4"
                    style="border-radius: 10px; font-size: 1em; padding: 8px 16px; font-weight: 600; transition: background 0.3s;">
                Finalizar Reserva
            </button>
        </form>

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
