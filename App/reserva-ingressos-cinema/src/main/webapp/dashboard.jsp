<html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
<div>
    <h1>Tickets</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Lugar Escolhido</th>
        </tr>
        <c:forEach var="ticket" items="${ticket}">
            <tr>
                <td>${ticket.ticket}</td>
                <td>${ticket.lugarEsc}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
