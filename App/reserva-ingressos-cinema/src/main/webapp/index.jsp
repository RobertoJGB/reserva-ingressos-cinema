<html>
<head>
    <title>HOME PRIME TICKET</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>


<!-- Criando o formulario para create movie -->
<div class="container">
    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#movie"
            aria-expanded="false" aria-controls="movie">
        Create Movie
    </button>

    <div class="collapse" id="movie">
        <div class="card card-body">
            <h2>Create Movie!</h2>

            <form action="/create-movie" method="post">

                <input type="hidden" id="id" name="id" value="${param.id}">

                <div class="mb-3">
                    <label for="nomeFilme" class="form-label">Nome:</label>
                    <input type="text" name="nomeFilme" id="nomeFilme" value="${param.nomeFilme}" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="genero" class="form-label">Genero:</label>
                    <input type="text" name="genero" id="genero" value="${param.genero}" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="sinopse" class="form-label">Sinopse:</label>
                    <input type="text" name="sinopse" id="sinopse" value="${param.sinopse}" class="form-control">
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
                    <select name="categoria" id="categoria" class="form-control">
                        <option value="emCartaz">Em Cartaz</option>
                        <option value="emBreve">Em Breve</option>
                        <option value="emDestaq">Em Destaque</option>
                    </select>
                </div>

                <button class="btn btn-primary" type="submit">Registrar</button>

            </form>
        </div>
    </div>
</div>

<br>

<!-- Criando o formulario para create user -->
<div class="container">
    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#user" aria-expanded="false"
            aria-controls="user">
        Create User
    </button>

    <div class="collapse" id="user">
        <div class="card card-body">
            <h2>Create User!</h2>

            <form action="/create-user" method="post">

                <div class="mb-3">
                    <label for="name" class="form-label">Nome:</label>
                    <input type="text" name="name" id="name" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="dtNasc" class="form-label">Data de Nascimento:</label>
                    <input type="text" name="dtNasc" id="dtNasc" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF:</label>
                    <input type="text" name="cpf" id="cpf" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario:</label>
                    <input type="text" name="usuario" id="usuario" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="senha" class="form-label">Senha:</label>
                    <input type="password" name="senha" id="senha" class="form-control">
                </div>

                <button class="btn btn-primary" type="submit">Registrar</button>
            </form>
        </div>
    </div>
</div>

<br>

<!-- Criando o formulario para create session -->
<div class="container">
    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#session"
            aria-expanded="false"
            aria-controls="user">
        Create Session
    </button>

    <div class="collapse" id="session">
        <div class="card card-body">
            <h2>Create Session!</h2>

            <form action="/create-session" method="post">

                <div class="mb-3">
                    <label for="horario" class="form-label">Informe o horario da sessão:</label>
                    <input type="text" name="horario" id="horario" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="sala" class="form-label">Sala:</label>
                    <input type="text" name="sala" id="sala" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="fkfilme" class="form-label">Id Do filme:</label>
                    <input type="text" name="fkfilme" id="fkfilme" class="form-control">
                </div>

                <button class="btn btn-primary" type="submit">Registrar</button>
            </form>
        </div>
    </div>
</div>


<br>

<!-- Criando o formulario para create ticket -->
<div class="container">
    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#ticket"
            aria-expanded="false"
            aria-controls="user">
        Create Ticket
    </button>

    <div class="collapse" id="ticket">
        <div class="card card-body">
            <h2>Create Ticket!</h2>

            <form action="/create-ticket" method="post">

                <div class="mb-3">
                    <label for="fkiduser" class="form-label">Informe o ID do usuario:</label>
                    <input type="text" name="fkiduser" id="fkiduser" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="fknomefilme" class="form-label">Informe o ID do filme:</label>
                    <input type="text" name="fknomefilme" id="fknomefilme" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="fksession" class="form-label">Informe o ID da sessão:</label>
                    <input type="text" name="fksession" id="fksession" class="form-control">
                </div>

                <button class="btn btn-primary" type="submit">Registrar</button>
            </form>
        </div>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>