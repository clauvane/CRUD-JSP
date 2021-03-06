<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt">
<head>
  <title>Evolução - Turma de Java</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
  <script src="${pageContext.request.contextPath}/jquery/jquery-3.2.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/paginas/menu.jsp" />
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 sidenav"></div>
    <div class="col-sm-10 text-left"> 
      <h1>Sejam Bem Vindos</h1>
      <hr>
      <h3>Sistema de Cadastro de Aluno</h3>
    </div>
    <div class="col-sm-1 sidenav" /></div>
  </div>
</div>

<c:import url="/paginas/rodape.html" />

</body>
</html>
