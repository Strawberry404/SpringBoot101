<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<html>
<head>
  <meta charset="UTF-8">
  <title>${cours != null ? 'Modifier' : 'Créer'} un Élève</title>
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
  <h1>${cours != null ? 'Modifier' : 'Créer'} un Cours</h1>

  <form th:action="@{/views/cours/update}" th:object="${cours}" method="post">
    <input type="hidden" name="action" value="${cours != null ? 'update' : 'create'}">
    <c:if test="${cours != null}">
      <input type="hidden" name="id" th:field="*{id}">
    </c:if>

    <div class="form-group">
      <label for="code">Code *</label>
      <input type="text" id="code" name="code"
             th:field="*{code}"
             required maxlength="50">
    </div>


    <div class="form-group">
      <label for="intitule">Intitulé *</label>
      <input type="text" id="intitule" name="intitule"
             th:field="*{intitule}"
             required maxlength="100">
    </div>

    <div class="form-group">
      <label>Filières (Select all that apply) *</label>

      <div style="border: 1px solid #ddd; padding: 10px; border-radius: 4px; max-height: 150px; overflow-y: auto;">

        <c:forEach var="filiere" items="${filieres}">
          <c:set var="isSelected" value="false" />
          <c:if test="${cours != null}">
            <c:forEach var="selectedFiliere" items="${cours.filieres}">
              <c:if test="${selectedFiliere.id == filiere.id}">
                <c:set var="isSelected" value="true" />
              </c:if>
            </c:forEach>
          </c:if>

          <div style="margin-bottom: 5px;">
            <input type="checkbox"
                   id="filiere_${filiere.id}"
                   name="filiereIds"
                   value="${filiere.id}"
                   style="width: auto;"
              ${isSelected ? 'checked' : ''}>
            <label for="filiere_${filiere.id}" style="display: inline; font-weight: normal;">
                ${filiere.nom} (${filiere.code})
            </label>
          </div>
        </c:forEach>

      </div>
    </div>

    <div>
      <button type="submit" class="btn btn-primary">
        ${cours != null ? 'Mettre à jour' : 'Créer'}
      </button>
      <a href="${pageContext.request.contextPath}/cours?action=list"
         class="btn btn-secondary">Annuler</a>
    </div>
  </form>
</div>
</body>
</html>