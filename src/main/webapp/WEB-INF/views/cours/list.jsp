<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Cours</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #333; border-bottom: 2px solid #007bff; padding-bottom: 10px; }

        .btn { padding: 8px 15px; text-decoration: none; border-radius: 4px; display: inline-block; font-size: 0.9em; margin-right: 5px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-success { background-color: #28a745; color: white; }
        .btn-warning { background-color: #ffc107; color: black; }
        .btn-danger { background-color: #dc3545; color: white; }

        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #007bff; color: white; }
        tr:hover { background-color: #f5f5f5; }

        /* The badge style for majors */
        .badge {
            display: inline-block;
            padding: 4px 8px;
            margin: 2px;
            font-size: 0.85em;
            background-color: #e9ecef;
            color: #495057;
            border-radius: 12px;
            border: 1px solid #ced4da;
        }

        .nav { margin-bottom: 20px; }
        .nav a { margin-right: 15px; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="${pageContext.request.contextPath}/filieres?action=list" class="btn btn-primary">Filières</a>
        <a href="${pageContext.request.contextPath}/eleves?action=list" class="btn btn-primary">Élèves</a>
        <a href="${pageContext.request.contextPath}/cours?action=list" class="btn btn-primary" style="background-color: #0056b3;">Cours</a>
    </div>

    <h1>Liste des Cours</h1>

    <a href="${pageContext.request.contextPath}/cours?action=new" class="btn btn-success">
        + Nouveau Cours
    </a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Intitulé</th>
            <th>Filières Associées (Majors)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cours}">
            <tr>
                <td>${c.id}</td>
                <td><strong>${c.code}</strong></td>
                <td>${c.intitule}</td>

                <td>
                    <c:forEach var="f" items="${c.filieres}">
                        <span class="badge">${f.code}</span>
                    </c:forEach>
                    <c:if test="${empty c.filieres}">
                        <span style="color: #999; font-style: italic;">Aucune</span>
                    </c:if>
                </td>

                <td>
                    <a href="${pageContext.request.contextPath}/cours?action=edit&id=${c.id}" class="btn btn-warning">Modifier</a>
                    <a href="${pageContext.request.contextPath}/cours?action=delete&id=${c.id}" class="btn btn-danger" onclick="return confirm('Supprimer ?');">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty cours}">
            <tr><td colspan="5" style="text-align: center; color: #999;">Aucun cours.</td></tr>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>