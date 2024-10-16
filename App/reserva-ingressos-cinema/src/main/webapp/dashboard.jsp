<html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Movies</h1>

        <br>

<!--
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="movies" items="${movies}">
                    <tr>
                        <td>${movies.nomeFilme}</td>
                        <td>${movies.genero}</td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>
-->

    <div class = "container">

        <c:forEach var="movies" items="${movies}">
            <div class="card" style="width: 18rem;">
              <img src="..." class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">${movies.nomeFilme}</h5>
                <p class="card-text">${movies.genero}</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
        </c:forEach>

    </div>

</body>
</html>
