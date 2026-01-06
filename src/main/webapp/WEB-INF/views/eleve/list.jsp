<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Élèves</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .btn {
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin: 10px 5px 10px 0;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        .btn-warning {
            background-color: #ffc107;
            color: black;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .actions a {
            margin-right: 10px;
        }
        .nav {
            margin-bottom: 20px;
        }
        .nav a {
            margin-right: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="${pageContext.request.contextPath}/filieres?action=list" class="btn btn-primary">Filières</a>
        <a href="${pageContext.request.contextPath}/eleves?action=list" class="btn btn-primary">Élèves</a>
    </div>

    <h1>Liste des Élèves</h1>

    <a href="${pageContext.request.contextPath}/eleves?action=new" class="btn btn-success">
        + Nouvel Élève
    </a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Matricule</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Filière</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="eleve" items="${eleves}">
            <tr>
                <td>${eleve.id}</td>
                <td><strong>${eleve.matricule}</strong></td>
                <td>${eleve.nom}</td>
                <td>${eleve.prenom}</td>
                <td>${eleve.email}</td>
                <td>${eleve.filiere.nom}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/eleves?action=edit&id=${eleve.id}"
                       class="btn btn-warning">Modifier</a>
                    <a href="${pageContext.request.contextPath}/eleves?action=delete&id=${eleve.id}"
                       class="btn btn-danger"
                       onclick="return confirm('Supprimer cet élève ?');">
                        Supprimer
                    </a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty eleves}">
            <tr>
                <td colspan="7" style="text-align: center; color: #999;">
                    Aucun élève enregistré.
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>

