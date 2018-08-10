<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões | Listar usuários</title>
	
	<!-- Criando uma variável -->
	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/municipios/buscaPorNome" var="buscaPorNome" />
	
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/index.css">
	<link rel="stylesheet" href="${cssPath}/aspconexoes.css">
	
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Início</a></li>
			<li class="active">Usuários</li>
			<!-- <li class="active">Pesquisa</li> -->
		</ol>

		<div class="row cabecalho">
			<div class="col-xs-12 col-md-6">
				<h1>Lista de usuários</h1>
			</div>
			<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
				<form:form action="${s:mvcUrl('MC#buscaPorNome').build()}" method="POST" commandName="municipio">
					<div class="input-group">
						<form:input path="nome" cssClass="form-control" placeholder="Pesquisar por nome do município" />
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form:form>
			</div>
		</div>
	</div>
		
	<div class="container">
		<!-- Opcao com colapse -->
		<div class="panel-group">
			<c:forEach items="${municipios}" var="municipio" varStatus="status">
				<div <c:if test="${municipio.ativo == false}">class="panel panel-danger"</c:if>
					 <c:if test="${municipio.ativo == true}">class="panel panel-default"</c:if>>
					<div class="panel-heading">
						<div class="panel-title">
							<table>
							   <tr>
								   <td class="tituloMuni">${municipio.nome}</td>
								   <security:authorize access="hasRole('ROLE_ADMINISTRADOR')"> <!-- isAuthenticated() -->
										<td>
											<div class="text-right">
												<form:form action="${s:mvcUrl('MC#formEditar').arg(0,municipio.id).build()}" method="POST">
													<button type="submit" class="btn btn-default  btn-xs">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</form:form>
											</div>
										</td>		
										<td>
											<div class="text-left">
												<form:form action="${s:mvcUrl('MC#exclusao').arg(0,municipio.id).build()}" method="POST">
													<button type="submit" class="btn btn-default  btn-xs">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</form:form>
											</div>
										</td>
									</security:authorize>
								   <td class="tituloMuni  text-right">0/${municipio.conexoes.size()}</td>
							   </tr>
							</table>
						</div>
					</div>
  				</div>
			</c:forEach>
		</div>			
			
		<div class="row">
			<div class="col-sm-6 paginacao text-right">
				<ul class="pagination">
					<li class="disabled"><a href=""><span> << </span></a></li>
					<li class="active"><a href=""><span>1</span></a></li>
					<li><a href=""><span>2</span></a></li>
					<li><a href=""><span>3</span></a></li>
					<li><a href=""><span>4</span></a></li>
					<li><a href=""><span>5</span></a></li>
					<li><a href=""><span>>></span></a></li>
				</ul>
			</div>
		</div>
	</div>
  	
	<footer class="page-footer">	
		<div class="footer-copyright text-center">© 2018 Copyright:
	    	<a href="http://grupoassessor.com/fallow/davidborelli"> David Borelli</a>
	    </div>	
	</footer>
	
	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>