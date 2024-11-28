<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <title>Saiba Mais</title>
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
                <a href="/loginC" style="text-decoration: none; color: inherit;">
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
<main>
    <section class="topo-do-site" id="inicio">
        <div class="interface">
            <div class="flex">
                <div class="txt-topo">
                    <h2 class="titulo">PLATAFORMA DE CINEMA <span>RESERVA DE INGRESSOS</span></h2>
                    <p>
                        Bem-vindo a pagina de informacoes do nosso projeto integrador! Aqui, voce vai conhecer os
                        detalhes por tras da criacao da nossa plataforma de cinema, uma solucao full-stack pensada para
                        proporcionar uma experiencia completa e otimizada aos usuarios na hora de reservar ingressos
                        para o cinema. Nosso projeto foi desenvolvido com tecnologias modernas, como Java, HTML e Banco
                        de Dados, para garantir que a plataforma seja robusta, eficiente e facil de usar.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <h2 class="titulo">Desenvolvedores</h2>
    <div class="img-topo">
        <img src="img/Leo.jpg" alt="teste"> &nbsp;
        <img src="img/Bahia.jpg" alt="teste"> &nbsp;
        <img src="img/Roberto.jpg" alt="teste"> &nbsp;
        <img src="img/noleto.jpg" alt="teste"> &nbsp;
    </div>
    <section class="especialidades" id="especialidades">
        <div class="interface">
            <h2 class="titulo">Arquitetura do <span>Sistema</span></h2>
            <div class="flex">
                <div class="esp-box">
                    <i class="bi bi-code-square"></i>
                    <h3>Java</h3>
                    <p>O coracao do nosso sistema e construido em Java, uma das linguagens mais poderosas e confiaveis
                        para o desenvolvimento de sistemas robustos. Usamos Java para criar as classes que controlam
                        toda a logica de funcionamento da plataforma.</p>
                </div>
                <div class="esp-box">
                    <i class="bi bi-bug"></i>
                    <h3>HTML</h3>
                    <p>No front-end, usamos HTML para criar a estrutura da plataforma, garantindo navegacao intuitiva.
                        Estruturamos a pagina principal para busca de filmes, escolha de horarios e sessoes. A exibicao
                        dos filmes, descricoes, horarios e disponibilidade de assentos e feita de forma clara e
                        objetiva, dando ao usuario uma visao completa de sua escolha.</p>
                </div>
                <div class="esp-box">
                    <i class="bi bi-window-sidebar"></i>
                    <h3>Banco de Dados</h3>
                    <p>Para organizar e acessar facilmente as informacoes, usamos um banco de dados relacional, onde
                        armazenamos dados sobre filmes, sessoes e assentos disponiveis. Registramos as reservas e
                        preferencias dos usuarios, garantindo seguranca nas transacoes e mantendo o historico de
                        compras.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="tecnologias" id="habilidades">
        <div class="interface">
            <h2 class="titulo">Tecnologias <span>Utilizadas</span></h2>
            <div class="flex">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="tec-box">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100"
                         viewBox="0,0,256,256">
                        <g fill="#5c6f7d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt"
                           stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
                           font-family="none" font-weight="none" font-size="none" text-anchor="none"
                           style="mix-blend-mode: normal">
                            <g transform="scale(5.12,5.12)">
                                <path d="M28.1875,0c2.75,6.36328 -9.85937,10.29297 -11.03125,15.59375c-1.07422,4.87109 7.49219,10.53125 7.5,10.53125c-1.30078,-2.01562 -2.25781,-3.67578 -3.5625,-6.8125c-2.20703,-5.30469 13.44141,-10.10547 7.09375,-19.3125zM36.5625,8.8125c0,0 -11.0625,0.71094 -11.625,7.78125c-0.25,3.14844 2.91016,4.80469 3,7.09375c0.07422,1.87109 -1.875,3.4375 -1.875,3.4375c0,0 3.54688,-0.67578 4.65625,-3.53125c1.23047,-3.16797 -2.39844,-5.30859 -2.03125,-7.84375c0.35156,-2.42578 7.875,-6.9375 7.875,-6.9375zM19.1875,25.15625c0,0 -10.125,-0.14453 -10.125,2.71875c0,2.99219 13.25391,3.21484 22.71875,1.375c0,0 2.51563,-1.73047 3.1875,-2.375c-6.20312,1.26563 -20.34375,1.40625 -20.34375,0.3125c0,-1.00781 4.5625,-2.03125 4.5625,-2.03125zM38.65625,25.15625c-0.99219,0.07813 -2.0625,0.46094 -3.03125,1.15625c2.28125,-0.49219 4.21875,0.92188 4.21875,2.53125c0,3.625 -5.25,7.03125 -5.25,7.03125c0,0 8.125,-0.92187 8.125,-6.875c0,-2.70312 -1.87891,-4.01562 -4.0625,-3.84375zM16.75,30.71875c-1.55469,0 -3.875,1.21875 -3.875,2.375c0,2.32422 11.6875,4.11328 20.34375,0.71875l-3,-1.84375c-5.86719,1.87891 -16.67187,1.26563 -13.46875,-1.25zM18.1875,35.9375c-2.12891,0 -3.53125,1.28516 -3.53125,2.25c0,2.98438 12.71484,3.28516 17.75,0.25l-3.1875,-2.03125c-3.76172,1.58984 -13.20312,1.83203 -11.03125,-0.46875zM11.09375,38.625c-3.46875,-0.07031 -5.71875,1.48828 -5.71875,2.78125c0,6.875 35.5,6.55859 35.5,-0.46875c0,-1.16797 -1.34766,-1.73437 -1.84375,-2c2.90234,6.71875 -29.0625,6.18359 -29.0625,2.21875c0,-0.90234 2.35156,-1.76562 4.53125,-1.34375l-1.84375,-1.0625c-0.54297,-0.08203 -1.06641,-0.11328 -1.5625,-0.125zM44.625,43.25c-5.39844,5.11719 -19.07812,6.97266 -32.84375,3.8125c13.76172,5.63281 32.77734,2.47266 32.84375,-3.8125z"></path>
                            </g>
                        </g>
                    </svg>
                    <h3>Java</h3>
                </div>
                <div class="tec-box">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100"
                         viewBox="0,0,256,256">
                        <g fill="#5c6f7d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt"
                           stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
                           font-family="none" font-weight="none" font-size="none" text-anchor="none"
                           style="mix-blend-mode: normal">
                            <g transform="scale(5.12,5.12)">
                                <path d="M44.5,6H11.5A5.5,5.5,0,0,0,6,11.5v33A5.5,5.5,0,0,0,11.5,50h33A5.5,5.5,0,0,0,50,44.5v-33A5.5,5.5,0,0,0,44.5,6ZM25,42a7,7,0,1,1,7-7A7,7,0,0,1,25,42ZM40,22H10V18H40Z"></path>
                            </g>
                        </g>
                    </svg>
                    <h3>H2 DB</h3>
                </div>
                <div class="tec-box">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100"
                         viewBox="0,0,256,256">
                        <g fill="#5c6f7d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt"
                           stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
                           font-family="none" font-weight="none" font-size="none" text-anchor="none"
                           style="mix-blend-mode: normal">
                            <g transform="scale(5.12,5.12)">
                                <path d="M45.274,2.325c-0.19,-0.207 -0.457,-0.325 -0.738,-0.325h-39.072c-0.281,0 -0.548,0.118 -0.738,0.325c-0.19,0.207 -0.283,0.485 -0.258,0.764l3.52,39.427c0.037,0.412 0.324,0.759 0.722,0.873l16.01,4.573c0.089,0.025 0.182,0.038 0.274,0.038c0.092,0 0.185,-0.013 0.274,-0.038l16.024,-4.573c0.398,-0.114 0.685,-0.461 0.722,-0.873l3.518,-39.427c0.025,-0.279 -0.069,-0.557 -0.258,-0.764zM12,29.004l7,1.942v-19.946h4v26l-11,-3.051zM38.054,22l-1.054,12.25l-10,2.75v-4.601l6.75,-1.855l0.25,-3.75l-7,1.206v-17h12l-0.345,4h-7.655v8z"></path>
                            </g>
                        </g>
                    </svg>
                    <h3>JS</h3>
                </div>
                <div class="tec-box">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100"
                         viewBox="0,0,256,256">
                        <g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt"
                           stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
                           font-family="none" font-weight="none" font-size="none" text-anchor="none"
                           style="mix-blend-mode: normal">
                            <g transform="scale(5.33333,5.33333)">
                                <path d="M41,5h-34l3,34l14,4l14,-4l3,-34z" fill="#5c6f7d"></path>
                                <path d="M24,8v31.9l11.2,-3.2l2.5,-28.7z" fill="#5c6f7d"></path>
                                <path d="M33.1,13h-9.1v4h4.9l-0.3,4h-4.6v4h4.4l-0.3,4.5l-4.1,1.4v4.2l7.9,-2.6l0.7,-11.5v0z"
                                      fill="#000000"></path>
                                <path d="M24,13v4h-8.9l-0.3,-4zM19.4,21l0.2,4h4.4v-4zM19.8,27h-4l0.3,5.5l7.9,2.6v-4.2l-4.1,-1.4z"
                                      fill="#000000"></path>
                            </g>
                        </g>
                    </svg>
                    <h3>CSS</h3>
                </div>
                <div class="tec-box">
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100"
                         viewBox="0,0,256,256">
                        <g fill="#5c6f7d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt"
                           stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0"
                           font-family="none" font-weight="none" font-size="none" text-anchor="none"
                           style="mix-blend-mode: normal">
                            <g transform="scale(5.12,5.12)">
                                <path d="M45.27344,2.32422c-0.1875,-0.20703 -0.45703,-0.32422 -0.73828,-0.32422h-39.07031c-0.28125,0 -0.55078,0.11719 -0.73828,0.32422c-0.19141,0.20703 -0.28516,0.48438 -0.25781,0.76563l3.51953,39.42578c0.03516,0.41406 0.32422,0.75781 0.72266,0.875l16.01172,4.57031c0.08594,0.02734 0.17969,0.03906 0.27344,0.03906c0.09375,0 0.18359,-0.01172 0.27344,-0.03906l16.02344,-4.57031c0.39844,-0.11719 0.68359,-0.46094 0.72266,-0.875l3.51563,-39.42578c0.02734,-0.28125 -0.06641,-0.55859 -0.25781,-0.76562zM36.84766,15.91797h-18.8125l0.44922,5.08984h17.91016l-1.34375,15.04297l-10.05859,3.03906l-0.09766,-0.03125l-9.94141,-3.01172l-0.54297,-6.12891h4.87109l0.21094,2.37891l5.55859,1.16406l5.45703,-1.16406l0.58203,-6.4375h-17.04297l-1.32422,-14.80469h24.55859z"></path>
                            </g>
                        </g>
                    </svg>
                    <h3>HTML</h3>
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
