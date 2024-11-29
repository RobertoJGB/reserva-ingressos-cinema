<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <title>Escolha seus assentos</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
              <link rel="stylesheet" href="css/body.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #121212;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        h1 {
            margin-top: 20px; /* Ajusta a distância do topo */
            margin-bottom: 40px; /* Cria mais espaço entre o título e os assentos */
        }

        .cinema {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 30px; /* Aumenta o espaçamento entre fileiras */
            margin: 0 auto;
        }

        .seat-row {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px 0;
            gap: 15px; /* Aumenta o espaçamento entre assentos na mesma fileira */
        }

        .row-label {
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
            align-self: center;
        }

        .seat {
            width: 40px; /* Aumenta a largura do ícone */
            height: 40px; /* Aumenta a altura do ícone */
            margin: 5px;
            background-image: url('img/PoltronaLivre.png');
            background-size: cover;
            cursor: pointer;
            transition: transform 0.3s, background-image 0.3s;
        }

        .seat.occupied {
            background-image: url('img/PoltronaOcupada.png');
            cursor: not-allowed;
        }

        .seat.selected {
            background-image: url('img/PoltronaEscolhida.png');
        }

        .seat:hover:not(.occupied) {
            transform: scale(1.1);
            background-image: url('img/PoltronaEscolhida.png');
        }

        .screen {
            width: 80%;
            height: 50px;
            background-image: url('img/Tela.png');
            background-size: cover;
            margin: 40px auto 0 auto;
            border-radius: 10px;
        }

        .legend {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            gap: 30px; /* Espaço entre as legendas */
        }

        .legend-item {
            display: flex;
            align-items: center;
        }

        .legend-item img {
            width: 40px; /* Ajusta o tamanho da legenda para combinar com os assentos */
            height: 40px;
            margin-right: 5px;
        }

        button {
            margin: 20px 0;
        }

        .seat.unavailable {
            background-image: url('img/PoltronaOcupada.png');
            cursor: not-allowed;
        }

    </style>

</head>
<body>
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

<h1 class="esc">Escolha seus assentos</h1>

<div class="cinema">
    <div class="seat-row" data-row="H">
        <div class="row-label">H</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('H')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>




<div class="cinema">
    <div class="seat-row" data-row="G">
        <div class="row-label">G</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('G')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


<div class="cinema">
    <div class="seat-row" data-row="F">
        <div class="row-label">F</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('F')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


<div class="cinema">
    <div class="seat-row" data-row="E">
        <div class="row-label">E</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('E')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<div class="cinema">
    <div class="seat-row" data-row="D">
        <div class="row-label">D</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('D')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<div class="cinema">
    <div class="seat-row" data-row="C">
        <div class="row-label">C</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('C')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


<div class="cinema">
    <div class="seat-row" data-row="B">
        <div class="row-label">B</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('B')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>


<div class="cinema">
    <div class="seat-row" data-row="A">
        <div class="row-label">A</div>
        <c:forEach var="assento" items="${assentos}">
            <c:if test="${assento.lugar.startsWith('A')}">
                <div class="seat ${assento.disponivel ? '' : 'unavailable'}"
                     data-row="${assento.lugar}"
                     data-available="${assento.disponivel ? 'true' : 'false'}"
                     onclick="selectSeat(this)">
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<div class="legend">
    <div class="legend-item">
        <img src="img/PoltronaLivre.png" alt="Disponível">
        <span>Disponível</span>
    </div>
    <div class="legend-item">
        <img src="img/PoltronaOcupada.png" alt="Ocupado">
        <span>Ocupado</span>
    </div>
    <div class="legend-item">
        <img src="img/PoltronaEscolhida.png" alt="Selecionada">
        <span>Selecionada</span>
    </div>
</div>


<form action="/all-resumo" method="post">
    <input type="hidden" name="selectedSeats" id="selectedSeats">
    <input type="hidden" name="idMovie" value="${param.id}">
    <input type="hidden" name="sessaoId" value="${param.sessaoId}">
    <button type="submit" class="btn btn-outline-success">Continuar</button>
</form>

<div class="screen"></div>

<script>
    let selectedSeats = [];

    function selectSeat(seat) {
        const isAvailable = seat.dataset.available === 'true';  // Verifique se o assento está disponível

        if (isAvailable && !seat.classList.contains('occupied')) {
            seat.classList.toggle('selected');
            const seatId = seat.dataset.row;

            // Atualiza a lista de assentos selecionados
            if (seat.classList.contains('selected')) {
                selectedSeats.push(seatId);
            } else {
                selectedSeats = selectedSeats.filter(id => id !== seatId);
            }

            // Atualiza o campo oculto no formulário com os assentos selecionados
            document.getElementById('selectedSeats').value = selectedSeats.join(',');
        }
    }



    // Função para salvar os assentos selecionados
    function saveSelectedSeats() {
        // Aqui você já coletou os assentos no campo oculto, então você pode enviar o formulário normalmente
        // Se quiser fazer mais validações ou ajustes, pode adicioná-los aqui.
        return true;
    }
</script>
</body>
</html>
