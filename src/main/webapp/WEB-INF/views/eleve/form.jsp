<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${eleve != null ? 'Modifier' : 'Créer'} un Élève</title>
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
    input, select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
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
  <h1>${eleve != null ? 'Modifier' : 'Créer'} un Élève</h1>

  <c:if test="${not empty error}">
    <div class="error">Erreur: ${error}</div>
  </c:if>

  <form method="post" action="${pageContext.request.contextPath}/eleves">
    <input type="hidden" name="action" value="${eleve != null ? 'update' : 'create'}">
    <c:if test="${eleve != null}">
      <input type="hidden" name="id" value="${eleve.id}">
    </c:if>

    <div class="form-group">
      <label for="matricule">Matricule *</label>
      <input type="text" id="matricule" name="matricule"
             value="${eleve != null ? eleve.matricule : ''}"
             required maxlength="50">
    </div>

    <div class="form-group">
      <label for="nom">Nom *</label>
      <input type="text" id="nom" name="nom"
             value="${eleve != null ? eleve.nom : ''}"
             required maxlength="100">
    </div>

    <div class="form-group">
      <label for="prenom">Prénom *</label>
      <input type="text" id="prenom" name="prenom"
             value="${eleve != null ? eleve.prenom : ''}"
             required maxlength="100">
    </div>

    <div class="form-group">
      <label for="email">Email *</label>
      <input type="email" id="email" name="email"
             value="${eleve != null ? eleve.email : ''}"
             required maxlength="100">
    </div>

    <div class="form-group">
      <label for="filiereId">Filière *</label>
      <select id="filiereId" name="filiereId" required>
        <option value="">-- Sélectionner une filière --</option>
        <c:forEach var="filiere" items="${filieres}">
          <option value="${filiere.id}"
            ${eleve != null && eleve.filiere.id == filiere.id ? 'selected' : ''}>
              ${filiere.nom} (${filiere.code})
          </option>
        </c:forEach>
      </select>
    </div>

    <div>
      <button type="submit" class="btn btn-primary">
        ${eleve != null ? 'Mettre à jour' : 'Créer'}
      </button>
      <a href="${pageContext.request.contextPath}/eleves?action=list"
         class="btn btn-secondary">Annuler</a>
    </div>
  </form>
</div>
</body>
</html>