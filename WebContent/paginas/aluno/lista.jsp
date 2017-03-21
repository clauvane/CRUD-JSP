<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt">
<head>
  <title>Evolução - Turma de Java</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/jquery/jquery-ui.css">
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
  <script src="${pageContext.request.contextPath}/jquery/jquery-3.2.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/jquery/jquery-ui.js"></script>
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
		<div class="col-md-11">
			<h1>Lista de Aluno</h1>
		</div>
		<div class="col-md-1 form-group">
			<br clear="all"/>
			<a href="${pageContext.request.contextPath}/paginas/aluno/novo.jsp"><button class="btn btn-primary">Novo</button></a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<td>NOME</td>
							<td>IDADE</td>	
							<td>E-MAIL</td>
							<td>DATA DE NASCIMENTO</td>	
							<td>AÇÕES</td>		
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dao.alunos}" var="aluno">
							<tr>
								<td>${aluno.nome}</td>
								<td>${aluno.idade}</td>
								<td>${aluno.email}</td>
								<td>
									<fmt:formatDate value="${aluno.dataNascimento}" pattern="dd/MM/yyyy"/>
								</td>
								<td>
									<button class="btn btn-danger btn-sm botao" onclick="confirmarRemocao(${aluno.id})">Excluir</button>
									<a href="${pageContext.request.contextPath}/paginas/aluno/novo.jsp?id=${aluno.id}&nome=${aluno.nome}&idade=${aluno.idade}&email=${aluno.email}&dataNascimento=${aluno.dataNascimento}">
										<button class="btn btn-warning btn-sm">Editar</button>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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

<script type="text/javascript">	
	var base = "${pageContext.request.contextPath}";
	function confirmarRemocao(idAluno){
		$('<div></div>').appendTo('body')
		  .html('<div><h6>Você realmente deseja remover este aluno?</h6></div>')
		  .dialog({
		      modal: true, title: 'Confirmação', zIndex: 12000, autoOpen: true,
		      width: 'auto', resizable: false,
		      buttons: {
		          Sim: function () {
		              window.location = base + "/aluno/remover?id="+idAluno;
		              $(this).dialog("close");
		          },
		          Não: function () {
		              $(this).dialog("close");
		          }
		      },
		      close: function (event, ui) {
		          $(this).remove();
		      }
		});
	}
</script>

</body>
</html>
