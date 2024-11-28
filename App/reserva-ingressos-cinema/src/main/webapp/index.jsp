<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Ticket - Sistema de Gerenciamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <style>
        /* Corpo */
        body {
            background: linear-gradient(to bottom, #f0f4fc, #d9e2f1);
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            color: #343a40;
        }

        /* Navbar */
        .navbar {
            background-color: #003d80;
            padding: 6px 0;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        .navbar-brand {
            color: white;
            font-size: 2rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .navbar-brand:hover {
            color: #a0c4ff;
            text-decoration: none;
        }

        /* Títulos */
        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #003d80;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 1px 2px 10px rgba(0, 61, 128, 0.2);
        }

        /* Abas de Navegação */
        .nav-pills .nav-link {
            font-weight: 600;
            border-radius: 25px;
            padding: 12px 20px;
            color: #003d80;
            background-color: #e8f0ff;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .nav-pills .nav-link.active {
            background-color: #003d80;
            color: white;
            box-shadow: 0px 4px 10px rgba(0, 61, 128, 0.4);
        }

        .nav-pills .nav-link:hover {
            background-color: #cce4ff;
            color: #003d80;
        }

        /* Conteúdo das Abas */
        .tab-content {
            background-color: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0px 8px 24px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
        }

        /* Formulários */
        .form-label {
            font-weight: 600;
            color: #495057;
        }

        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #ced4da;
            padding: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #003d80;
            box-shadow: 0px 4px 10px rgba(0, 61, 128, 0.2);
        }

        textarea {
            resize: none;
        }

        /* Botões */
        .btn-primary {
            background-color: #003d80;
            border: none;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 12px;
            border-radius: 30px;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 8px rgba(0, 61, 128, 0.3);
        }

        .btn-primary:hover {
            background-color: #002c63;
            transform: translateY(-2px);
        }

        .btn-success {
            background-color: #28a745;
            border-radius: 30px;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 12px;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 8px rgba(40, 167, 69, 0.3);
        }

        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Links */
        a {
            color: white;
            text-decoration: none;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            .nav-pills .nav-link {
                font-size: 0.9rem;
            }

            .btn-primary, .btn-success {
                font-size: 1rem;
                padding: 10px;
            }
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
    <h1 class="text-center mb-4">Sistema de Gerenciamento</h1>

    <!-- Abas de navegação -->
    <ul class="nav nav-pills my-4 justify-content-center" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active me-4" id="pills-movie-tab" data-bs-toggle="pill"
                    data-bs-target="#pills-movie"
                    type="button" role="tab">
                <i class="fas fa-video me-2"></i> Create Movie
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link me-4" id="pills-user-tab" data-bs-toggle="pill" data-bs-target="#pills-user"
                    type="button" role="tab">
                <i class="fas fa-user me-2"></i> Create User
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link me-4" id="pills-session-tab" data-bs-toggle="pill" data-bs-target="#pills-session"
                    type="button" role="tab">
                <i class="fas fa-calendar me-2"></i> Create Session
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link me-4" id="pills-ticket-tab" data-bs-toggle="pill" data-bs-target="#pills-ticket"
                    type="button" role="tab">
                <i class="fas fa-ticket-alt me-2"></i> Create Ticket
            </button>
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
                <input type="hidden" id="ids" name="id" value="${param.sessaoId}">

                <div class="mb-3">
                    <label for="horario" class="form-label">Horario da Sessao:</label>
                    <input type="text" name="horario" id="horario" class="form-control" value="${param.horario}">
                </div>
                <div class="mb-3">
                    <label for="sala" class="form-label">Sala:</label>
                    <input type="text" name="sala" id="sala" class="form-control" value="${param.sala}">
                </div>
                <div class="mb-3">
                    <label for="fkfilme" class="form-label">ID do Filme:</label>
                    <input type="text" name="fkfilme" id="fkfilme" class="form-control" value="${param.id}">
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
