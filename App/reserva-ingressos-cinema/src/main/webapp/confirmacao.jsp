<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmação de Reserva</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .confirmation-box {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 90%;
        }
        .confirmation-icon {
            width: 80px;
            height: auto;
            margin-bottom: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        p {
            color: #666;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        .reservation-code {
            color: #e50914;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            text-decoration: none;
            background-color: #e50914;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #b00710;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background: #f8f8f8;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="confirmation-container">
    <div class="confirmation-box">
        <img src="img/chec.png" alt="Ícone de Confirmação" class="confirmation-icon">
        <h1>RESERVA CONFIRMADA!</h1>
        <p>Obrigado por reservar com a gente!</p>
        <p>Sua reserva foi realizada com sucesso. Apresente os códigos abaixo no caixa do cinema para concluir o processo.</p>


        <ul>
            <c:forEach var="ticket" items="${tickets}">
                <li>
                    <strong>Código do Ticket:</strong> ${ticket.idTicket}<br>

            </c:forEach>
        </ul>

        <!-- Botão para voltar -->
        <a href="/find-all-movies" class="btn">Voltar ao Início</a>
    </div>
</div>
</body>
</html>
