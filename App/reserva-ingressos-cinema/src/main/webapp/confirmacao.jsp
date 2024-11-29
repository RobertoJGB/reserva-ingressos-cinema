<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <title>Confirmação de Reserva - PrimeTicket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
    <link rel="stylesheet" href="css/saibaMais.css">
    <style>
        .confirmation-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top: -50px; /* Ajuste da margem superior */
        }

        .confirmation-box {
            background: linear-gradient(145deg, #1a1a2e, #16213e);
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 50%; /* Ajuste da largura */
            height: auto; /* Ajuste da altura */
            min-height: 300px; /* Altura mínima */
        }

        .confirmation-box h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }

        .confirmation-box p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }

        .confirmation-box .reservation-code {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .confirmation-box .btn {
            background-color: #388e3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1.2em;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .confirmation-box .btn:hover {
            background-color: #2e7d32;
        }

        .confirmation-icon {
            width: 100px;
            margin: 0 auto 20px;
            display: block;
            animation: pulse 2s infinite; /* Adiciona a animação de pulsação */
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1); /* Aumenta ligeiramente o tamanho */
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
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

<div class="confirmation-container">
    <div class="confirmation-box">
        <img src="img/chec.png" alt="Ícone de Confirmação" class="confirmation-icon">
        <h1>RESERVA CONFIRMADA!</h1>
        <p>Obrigado por reservar com a gente!</p>
        <p>Sua reserva foi realizada com sucesso. Apresente os códigos abaixo no caixa do cinema para concluir o
            processo.</p>
        <p>Seus Ingressos: </p>


        <ul>
            <c:forEach var="ticket" items="${tickets}">
            <li>
                <strong>Código do Ticket:</strong> ${ticket.idTicket}<br>

                </c:forEach>
        </ul>

        <!-- Botão para voltar -->
        <a href="/find-all-movies" class="btn">Voltar ao Início</a>

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
