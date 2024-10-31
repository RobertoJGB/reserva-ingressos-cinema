<html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel = "stylesheet" href="css/body.css">
</head>
<body>
    <div class="navbar">
            <div class="menu-icon">Menu</div>
            <div class="logo">PrimeTicket</div>
            <div class="icons">
                <img src="../../../Imagens/Login.png" alt="Login Icon">
                <img src="../../../Imagens/Pesquisar.png" alt="Pesquisar Icon">
            </div>
    </div>

    <div class="container">
        <h1>Movies</h1>

        <br>

    <div class = "container">

        <c:forEach var="movies" items="${movies}">
            <div class="card" style="width: 18rem;">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">${movies.nomeFilme}</h5>
                <p class="card-text">${movies.genero}</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
                <form action="/delete-movie" method="post">
                  <input type="hidden" id="idMovie" name="idMovie" value="${movies.idMovie}">
                     <button type="submit" class="btn btn-danger">Delete</button>
                      <span> | </span>
                      <a href="index.jsp?id=${movies.idMovie}&nomeFilme=${movies.nomeFilme}&genero=${movies.genero}&sinopse=${movies.sinopse}&classInd=${movies.classInd}&duracao=${movies.duracao}">Update</a>
                 </form>
              </div>
            </div>
        </c:forEach>

    </div>

</body>
</html>
