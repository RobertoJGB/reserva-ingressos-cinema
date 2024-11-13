<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>
</head>
<body>

<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
%>
<script>
    alert("<%= errorMessage %>");
</script>
<%
    }
%>

<div class="container" id="container">
    <div class="form-container cadastrar">
        <form action="/create-user" method="post">
            <h1>Criar conta</h1>
            <input type="text" name="name" id="name" placeholder="Nome" value="${param.nome}" class="form-control">
            <input type="text" name="email" id="email" placeholder="Email" value="${param.email}" class="form-control">
            <input type="text" name="dtNasc" id="dtNasc" placeholder="Data de nascimento" value="${param.dtNasc}"
                   class="form-control">
            <input type="text" name="cpf" id="cpf" placeholder="CPF" value="${param.cpf}" class="form-control">
            <input type="text" name="senha" id="senhaCadastro" placeholder="Senha" value="${param.senha}"
                   class="form-control">
            <button class="btn btn-primary" type="submit">Cadastrar</button>
        </form>
    </div>

    <div class="form-container login">
        <form action="/login" method="post">
            <h1>Logar</h1>
            <input type="text" name="loginEmail" id="loginEmail" placeholder="Email" class="form-control">
            <input type="password" name="loginSenha" id="loginSenha" placeholder="Senha" class="form-control">
            <button class="btn btn-primary" type="submit">Entrar</button>
        </form>
    </div>

    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <h1>Ola!</h1>
                <p>Que bom que voltou!</p>
                <button class="hidden" id="login">Logar</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Ola, Amigo!</h1>
                <p>Se cadastre para comprar ingressos com conforto e comodidade!</p>
                <button class="hidden" id="register">Cadastrar</button>
            </div>
        </div>
    </div>
</div>

<script src="js/login.js"></script>
</body>
</html>
