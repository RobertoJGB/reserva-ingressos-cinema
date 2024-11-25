<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Ticket - Sistema de Gerenciamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
        }
        .navbar {
                background-color: #0056b3;
                font-family: 'Roboto', sans-serif;
            }
            .navbar-brand {
                color: white;
                font-weight: 700;
                text-align: center;
            }
            .navbar-brand:hover {
                color: #dce1f3;
            }
        .tab-content {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .nav-pills .nav-link.active {
            background-color: #0056b3;
        }
        .btn-primary {
            background-color: #0056b3;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        h1 {
            font-weight: 700;
            color: #343a40;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container d-flex justify-content-center">
        <a class="navbar-brand" href="find-all-movies">Prime Ticket</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h1 class="text-center">Sistema de Gerenciamento</h1>
    <ul class="nav nav-pills my-4 justify-content-center" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-movie-tab" data-bs-toggle="pill" data-bs-target="#pills-movie" type="button" role="tab">Create Movie</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-user-tab" data-bs-toggle="pill" data-bs-target="#pills-user" type="button" role="tab">Create User</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-session-tab" data-bs-toggle="pill" data-bs-target="#pills-session" type="button" role="tab">Create Session</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-ticket-tab" data-bs-toggle="pill" data-bs-target="#pills-ticket" type="button" role="tab">Create Ticket</button>
        </li>
    </ul>

    <div class="tab-content" id="pills-tabContent">
        <!-- Movie Form -->
        <div class="tab-pane fade show active" id="pills-movie" role="tabpanel">
            <form action="/create-movie" method="post" enctype="multipart/form-data">
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
                    <select name="categoria" id="categoria" class="form-select">
                        <option value="emCartaz">Em Cartaz</option>
                        <option value="emBreve">Em Breve</option>
                        <option value="emDestaq">Em Destaque</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Imagem:</label>
                    <input type="file" name="image" id="image" value="${param.image}" class="form-control">
                </div>
                <button class="btn btn-primary w-100" type="submit">Registrar</button>
            </form>
        </div>

        <!-- User Form -->
        <div class="tab-pane fade" id="pills-user" role="tabpanel">
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
                    <input type="email" name="email" id="email" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label">Senha:</label>
                    <input type="password" name="senha" id="senha" class="form-control">
                </div>
                <button class="btn btn-primary w-100" type="submit">Registrar</button>
            </form>
        </div>

        <!-- Session Form -->
        <div class="tab-pane fade" id="pills-session" role="tabpanel">
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

        <!-- Ticket Form -->
        <div class="tab-pane fade" id="pills-ticket" role="tabpanel">
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

    <a href="/find-all-movies" class="btn btn-success mt-4 w-100">Ir para Dashboard</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
