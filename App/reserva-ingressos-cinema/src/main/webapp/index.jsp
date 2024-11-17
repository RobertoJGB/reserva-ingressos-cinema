<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME PRIME TICKET</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light text-dark">


<!-- Titulo Principal -->
<div class="container mt-4">
    <h1 class="text-center mb-4">Prime Ticket - Sistema de Gerenciamento</h1>
</div>

<!-- Formularios -->
<div class="container">
    <!-- Create Movie Form -->
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-primary text-white" data-bs-toggle="collapse" data-bs-target="#movie">
            <h3 class="card-title d-flex justify-content-between align-items-center">
                <span>Create Movie</span>
            </h3>
        </div>
        <div class="collapse" id="movie">
            <div class="card-body">

                <form action="/create-movie" method="post" enctype="multipart/form-data">

                    <input type="hidden" id="id" name="id" value="${param.id}">

                    <div class="mb-3">
                        <label for="nomeFilme" class="form-label">Nome:</label>
                        <input type="text" name="nomeFilme" id="nomeFilme" value="${param.nomeFilme}"
                               class="form-control">
                    </div>

                    <div class="mb-3">
                        <label for="genero" class="form-label">Genero:</label>
                        <input type="text" name="genero" id="genero" value="${param.genero}" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label for="sinopse" class="form-label">Sinopse:</label>
                        <textarea name="sinopse" id="sinopse" class="form-control">${param.sinopse}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="classind" class="form-label">Classificacao:</label>
                        <input type="text" name="classind" id="classind" value="${param.classInd}" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label for="duracao" class="form-label">Duracao:</label>
                        <input type="text" name="duracao" id="duracao" value="${param.duracao}" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label for="categoria" class="form-label">Categoria:</label>
                        <select name="categoria" id="categoria" value="${param.categoria}" class="form-select">
                            <option value="emCartaz">Em Cartaz</option>
                            <option value="emBreve">Em Breve</option>
                            <option value="emDestaq">Em Destaque</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="image" class="form-label">Imagem</label>
                        <input type="file" name="image" id="image" value="${param.image}" class="form-control">
                    </div>

                    <button class="btn btn-primary w-100" type="submit">Registrar</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Create User Form -->
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-primary text-white" data-bs-toggle="collapse" data-bs-target="#user">
            <h3 class="card-title d-flex justify-content-between align-items-center">
                <span>Create User</span>
            </h3>
        </div>
        <div class="collapse" id="user">
            <div class="card-body">
                <form action="/create-user" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Nome:</label>
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="dtNasc" class="form-label">Data de Nascimento:</label>
                        <input type="date" name="dtNasc" id="dtNasc" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="cpf" class="form-label">CPF:</label>
                        <input type="text" name="cpf" id="cpf" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="text" name="email" id="email" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="senha" class="form-label">Senha:</label>
                        <input type="password" name="senha" id="senha" class="form-control">
                    </div>
                    <button class="btn btn-primary w-100" type="submit">Registrar</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Create Session Form -->
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-primary text-white" data-bs-toggle="collapse" data-bs-target="#session">
            <h3 class="card-title d-flex justify-content-between align-items-center">
                <span>Create Session</span>
            </h3>
        </div>
        <div class="collapse" id="session">
            <div class="card-body">
                <form action="/create-session" method="post">
                    <div class="mb-3">
                        <label for="horario" class="form-label">Horario da Sessao:</label>
                        <input type="time" name="horario" id="horario" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="sala" class="form-label">Sala:</label>
                        <input type="text" name="sala" id="sala" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="fkfilme" class="form-label">ID do Filme:</label>
                        <input type="text" name="fkfilme" id="fkfilme" class="form-control">
                    </div>
                    <button class="btn btn-primary w-100" type="submit">Registrar</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Create Ticket Form -->
    <div class="card mb-4 shadow-sm">
        <div class="card-header bg-primary text-white" data-bs-toggle="collapse" data-bs-target="#ticket">
            <h3 class="card-title d-flex justify-content-between align-items-center">
                <span>Create Ticket</span>
            </h3>
        </div>
        <div class="collapse" id="ticket">
            <div class="card-body">
                <form action="/create-ticket" method="post">
                    <div class="mb-3">
                        <label for="fkiduser" class="form-label">ID do Usuario:</label>
                        <input type="text" name="fkiduser" id="fkiduser" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="fknomefilme" class="form-label">ID do Filme:</label>
                        <input type="text" name="fknomefilme" id="fknomefilme" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="fksession" class="form-label">ID da Sessao:</label>
                        <input type="text" name="fksession" id="fksession" class="form-control">
                    </div>
                    <button class="btn btn-primary w-100" type="submit">Registrar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<a href="/find-all-movies" id="button" class="btn btn-success">Ir para Dashboard</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>