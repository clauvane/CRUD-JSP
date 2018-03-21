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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
  <script src="${pageContext.request.contextPath}/jquery/jquery-3.2.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/paginas/menu.jsp" />
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-1 sidenav">
<!--       <p><a href="#">Link</a></p> -->
<!--       <p><a href="#">Link</a></p> -->
<!--       <p><a href="#">Link</a></p> -->
    </div>
    <div class="col-sm-10 text-left"> 
    <jsp:useBean id="dao" class="br.com.evolucao.dao.AlunoDao" />
    <c:if test="${mensagem_sucesso != null}">
    	<div class="row">
	    	<div class="alert alert-success alert-dismissible" role="alert">
	    		${mensagem_sucesso}
	    		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			</div>
    	</div>
    </c:if>
    <c:if test="${mensagem_erro != null}">
    	<div class="row">
    		<div class="alert alert-danger alert-dismissible" role="alert">
    			${mensagem_erro}
    			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				  <span aria-hidden="true">&times;</span>
				</button>
			</div>
   		</div>
    </c:if>
	<div class="row">
		<div class="col-md-12 form-group">
			<h1>Cadastro de Aluno</h1>
		</div>
	</div>
		<form action="actions.jsp" method="post">
			<input type="hidden" name="id" value="${param.id}">
			<input type="hidden" name="action" value="MERGE">
			<div class="row">
				<div class="col-md-12 form-group">
					<div class="col-md-4">
						Nome: <input class="form-control" maxlength="100" type="text" name="nome" value="${param.nome}" required>
					</div>
					<div class="col-md-2">
						Idade(Anos): <input class="form-control" max="150" min="18" maxlength="3" type="number" name="idade" value="${param.idade}" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<div class="col-md-4">
						E-mail: <input class="form-control" maxlength="100" type="email" name="email" value="${param.email}" required>
					</div>
					<div class="col-md-2">
						Data de Nascimento: <input class="form-control" type="date" pattern="dd/MM/yyyy" value="${param.dataNascimento}" name="dataNascimento" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<div class="col-md-3">
						<button type="submit" class="btn btn-primary">Salvar</button>
						<a href="${pageContext.request.contextPath}/paginas/aluno/lista.jsp">
							<button type="button" class="btn btn-default">Cancelar</button>
						</a>
					</div>
				</div>
			</div>
		</form>
	</div>	
    <div class="col-sm-1 sidenav">
<!--       <div class="well"> -->
<!--         <p>ADS</p> -->
<!--       </div> -->
<!--       <div class="well"> -->
<!--         <p>ADS</p> -->
<!--       </div> -->
    </div>
  </div>
</div>

<c:import url="/paginas/rodape.html" />

</body>
</html>
