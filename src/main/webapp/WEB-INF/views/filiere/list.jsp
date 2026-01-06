<%--
  Created by IntelliJ IDEA.
  User: fatim
  Date: 11/18/2025
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Filières</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1000px;
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

    <h1>Liste des Filières</h1>

    <a href="${pageContext.request.contextPath}/filieres?action=new" class="btn btn-success">
        + Nouvelle Filière
    </a>

    <c:if test="${not empty error}">
        <div style="color: red; padding: 10px; background-color: #ffeeee; border-radius: 4px; margin: 10px 0;">
            Erreur: ${error}
        </div>
    </c:if>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Nombre d'élèves</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="filiere" items="${filieres}">
            <tr>
                <td>${filiere.id}</td>
                <td><strong>${filiere.code}</strong></td>
                <td>${filiere.nom}</td>
                <td>${filiere.description}</td>
                <td>${filiere.eleves.size()}</td>
                <td class="actions">
                    <a href="${pageContext.request.contextPath}/filieres?action=edit&id=${filiere.id}"
                       class="btn btn-warning">Modifier</a>
                    <a href="${pageContext.request.contextPath}/filieres?action=delete&id=${filiere.id}"
                       class="btn btn-danger"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette filière ?');">
                        Supprimer
                    </a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty filieres}">
            <tr>
                <td colspan="6" style="text-align: center; color: #999;">
                    Aucune filière enregistrée.
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>

