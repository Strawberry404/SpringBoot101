<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${filiere != null ? 'Modifier' : 'Créer'} une Filière</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
            min-height: 80px;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .error {
            color: red;
            padding: 10px;
            background-color: #ffeeee;
            border-radius: 4px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${filiere != null ? 'Modifier' : 'Créer'} une Filière</h1>

    <c:if test="${not empty error}">
        <div class="error">Erreur: ${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/filieres">
        <input type="hidden" name="action" value="${filiere != null ? 'update' : 'create'}">
        <c:if test="${filiere != null}">
            <input type="hidden" name="id" value="${filiere.id}">
        </c:if>

        <div class="form-group">
            <label for="code">Code *</label>
            <input type="text" id="code" name="code"
                   value="${filiere != null ? filiere.code : ''}"
                   required maxlength="50">
        </div>

        <div class="form-group">
            <label for="nom">Nom *</label>
            <input type="text" id="nom" name="nom"
                   value="${filiere != null ? filiere.nom : ''}"
                   required maxlength="100">
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description">${filiere != null ? filiere.description : ''}</textarea>
        </div>

        <div>
            <button type="submit" class="btn btn-primary">
                ${filiere != null ? 'Mettre à jour' : 'Créer'}
            </button>
            <a href="${pageContext.request.contextPath}/filieres?action=list"
               class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>
</body>
</html>
