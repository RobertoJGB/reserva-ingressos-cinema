<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta charset="UTF-8">
    <title>Saiba Mais</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/body.css">
    <link rel="stylesheet" href="css/sinopse.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">


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

<div class="container mt-4">
    <div class="row">
        <div class="col-md-4">
            <img src="${param.image}" alt="${param.nomeFilme}" class="img-fluid rounded">
        </div>
        <div class="col-md-8">
            <h2 style="font-size: 2em;">${param.nomeFilme}</h2>
            <p style="font-size: 1.2em;">Gênero: ${param.genero}</p>
            <p style="font-size: 1.2em;">Classificação Indicativa: ${param.classInd}</p>
            <p style="font-size: 1.2em;">Duração ${param.duracao} minutos</p>
            <p style="font-size: 1.2em;">Sinopse:</p>
            <p style="font-size: 1.2em;">${param.sinopse}</p>
        </div>

    </div>
</div>

<div class="container mt-5">
    <h3 class="hora text-center mb-4" style="font-family: 'Poppins', sans-serif; color: #fff; font-weight: bold;">Horarios Disponiveis</h3>
    <div class="row justify-content-center">
        <c:forEach var="session" items="${session}">
            <div class="col-md-4 mb-4">
                <div class="session-card text-center p-4" style="border-radius: 12px; background: linear-gradient(145deg, #1a1a2e, #16213e); color: #fff; box-shadow: 4px 4px 12px rgba(0, 0, 0, 0.6);">
                    <p style="font-size: 18px; margin: 0; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-door-open me-2" style="color: #ffd700;"></i>
                        Sala: <span style="margin-left: 5px;">${session.sala}</span>
                    </p>
                    <p style="font-size: 18px; margin: 10px 0; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-clock me-2" style="color: #ffd700;"></i>
                        Horario: <span style="margin-left: 5px;">${session.horario}</span>
                    </p>
                    <a href="/find-assentos?id=${param.id}&sessaoId=${session.idSession}"
                       class="btn btn-primary btn-block"
                       style="background: #1a73e8; border: none; border-radius: 8px; font-size: 16px; font-weight: 500; padding: 10px 20px; transition: background 0.3s;">
                        Selecionar
                    </a>

                    <c:if test="${sessionScope.user != null}">
                        <!-- Formulário de Delete -->
                        <form action="/delete-session?id=${session.idSession}&fkmovie=${movies.idMovie}"
                              method="post" class="mt-3" style="text-align: center;">
                            <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                            <button type="submit"
                                    class="btn btn-danger"
                                    style="border-radius: 8px; padding: 8px 20px; font-weight: bold;">
                                Deletar
                            </button>
                        </form>
                        <!-- Link para Update -->
                        <a href="index.jsp?sessaoId=${session.idSession}&id=${param.id}&sala=${session.sala}&horario=${session.horario}"
                           class="btn btn-outline-primary mt-2"
                           style="font-weight: bold; border: 2px solid #1a73e8; border-radius: 8px; padding: 8px 20px; color: #1a73e8;">
                            Atualizar
                        </a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<script type="text/javascript">
function selectSession(idMovie, sessionId) {
    // Lógica de redirecionamento ou exibição de modal pode ser implementada aqui
}
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>


<footer>


</footer>

<script>
    function toggleMenu() {
        var menu = document.getElementById("sideMenu");
        menu.classList.toggle("active");
    }
</script>
</body>
</html>
