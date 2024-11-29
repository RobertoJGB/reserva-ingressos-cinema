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
        }

        .cinema {
            display: inline-block;
            margin-top: 35px;
        }

        .seat-row {
            color: #fff;
            display: flex;
            justify-content: center;
        }
        span{
            color: #fff;
        }
        .esc{
            margin-top: 35px
        }

        .seat {
            width: 30px;
            height: 30px;
            margin: 10px;
            background-image: url('img/PoltronaLivre.png');
            background-size: cover;
            cursor: pointer;
            transition: background-image 0.3s;
        }

        .seat.occupied {
            background-image: url('img/PoltronaOcupada.png');
            cursor: not-allowed;
        }

        .seat.selected {
            background-image: url('img/PoltronaEscolhida.png');
        }

        .seat:hover:not(.occupied) {
            background-image: url('img/PoltronaEscolhida.png');
        }

        .screen {
            width: 68%;
            height: 50px;
            background-image: url('img/Tela.png');
            background-size: cover;
            margin: 20px auto;
        }

        .legend {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .legend-item {
            display: flex;
            align-items: center;
            margin: 0 10px;
        }

        .legend-item img {
            width: 30px;
            height: 30px;
            margin-right: 5px;
        }

        .row-label {
            margin-top: 15px;
            margin-right: 10px;
            font-weight: bold;
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
    <div class="seat-row" data-row="h">
        <div class="row-label">H</div>
        <div class="seat" data-row="h" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="2"></div>
        <div class="seat" data-row="h" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="5"></div>
        <div class="seat" data-row="h" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="8"></div>
        <div class="seat" data-row="h" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="11"></div>
        <div class="seat" data-row="h" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="2"></div>
        <div class="seat" data-row="h" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="16"></div>
        <div class="seat" data-row="h" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="h" data-seat="19"></div>
        <div class="seat" data-row="h" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="h" data-seat="21" onclick="selectSeat(this)"></div>
    </div>
    <div class="seat-row" data-row="g">
        <div class="row-label">G</div>
        <div class="seat" data-row="g" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="2" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="5" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="8" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="11" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="16" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="19" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="g" data-seat="22" onclick="selectSeat(this)"></div>
        <!-- Continue para todos os assentos na fileira g -->
    </div>
    <div class="seat-row" data-row="f">
        <div class="row-label">F</div>
        <div class="seat" data-row="f" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="2" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="5" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="8" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="11" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="16" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="19" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="f" data-seat="22" onclick="selectSeat(this)"></div>
    </div>
    <div class="seat-row" data-row="e">
        <div class="row-label">E</div>
        <div class="seat" data-row="e" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="2" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="5" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="8" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="11" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="16" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="19" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="e" data-seat="22" onclick="selectSeat(this)"></div>
    </div>
    <div class="seat-row" data-row="d">
        <div class="row-label">D</div>
        <div class="seat" data-row="d" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="2" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="5" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="d" data-seat="6"></div>
        <div class="seat occupied" data-row="d" data-seat="7"></div>
        <div class="seat occupied" data-row="d" data-seat="8"></div>
        <div class="seat occupied" data-row="d" data-seat="9"></div>
        <div class="seat" data-row="d" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="11" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="d" data-seat="2"></div>
        <div class="seat" data-row="d" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="d" data-seat="16"></div>
        <div class="seat" data-row="d" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="d" data-seat="19"></div>
        <div class="seat" data-row="d" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="d" data-seat="21" onclick="selectSeat(this)"></div>
    </div>
    <div class="seat-row" data-row="c">
        <div class="row-label">C</div>
        <div class="seat" data-row="c" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="2"></div>
        <div class="seat" data-row="c" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="5"></div>
        <div class="seat" data-row="c" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="8"></div>
        <div class="seat" data-row="c" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="11"></div>
        <div class="seat" data-row="c" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="14"></div>
        <div class="seat" data-row="c" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="16" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="17"></div>
        <div class="seat" data-row="c" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="19"></div>
        <div class="seat" data-row="c" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="c" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="c" data-seat="22"></div>
    </div>
    <div class="seat-row" data-row="b">
        <div class="row-label">B</div>
        <div class="seat occupied" data-row="b" data-seat="1"></div>
        <div class="seat" data-row="b" data-seat="2" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="4"></div>
        <div class="seat" data-row="b" data-seat="5" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="7"></div>
        <div class="seat" data-row="b" data-seat="8" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="10"></div>
        <div class="seat" data-row="b" data-seat="11" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="13"></div>
        <div class="seat" data-row="b" data-seat="14" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="16"></div>
        <div class="seat" data-row="b" data-seat="17" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="b" data-seat="19"></div>
        <div class="seat" data-row="b" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="b" data-seat="22" onclick="selectSeat(this)"></div>
    </div>
    <div class="seat-row" data-row="a">
        <div class="row-label">A</div>
        <div class="seat" data-row="a" data-seat="1" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="2"></div>
        <div class="seat" data-row="a" data-seat="3" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="4" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="5"></div>
        <div class="seat" data-row="a" data-seat="6" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="7" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="8"></div>
        <div class="seat" data-row="a" data-seat="9" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="10" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="11"></div>
        <div class="seat" data-row="a" data-seat="12" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="13" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="14"></div>
        <div class="seat" data-row="a" data-seat="15" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="16" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="17"></div>
        <div class="seat" data-row="a" data-seat="18" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="19"></div>
        <div class="seat" data-row="a" data-seat="20" onclick="selectSeat(this)"></div>
        <div class="seat" data-row="a" data-seat="21" onclick="selectSeat(this)"></div>
        <div class="seat occupied" data-row="a" data-seat="22"></div>
    </div>
</div>
<div class="legend">
    <div class="legend-item">
        <img src="img/PoltronaLivre.png" alt="Disponível">
        <span>Disponivel</span>
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
<button type="button" class="btn btn-outline-success" onclick="proceedToNextStep()">Continuar</button>
<br><br>
<div class="screen"></div>


<script>
    function toggleMenu() {
        var menu = document.getElementById("sideMenu");
        menu.classList.toggle("active");
    }

    function proceedToNextStep() {
        window.location.href = 'Resumo.jsp';
    }

    function selectSeat(seat) {
        if (!seat.classList.contains('occupied')) {
            seat.classList.toggle('selected');
            if (seat.classList.contains('selected')) {
                seat.style.backgroundImage = "url('img/PoltronaEscolhida.png')";
            } else {
                seat.style.backgroundImage = "url('img/PoltronaLivre.png')";
            }
            alert('Fileira: ' + seat.dataset.row + ', Assento: ' + seat.dataset.seat);
        }
    }
</script>
</body>
</html>
