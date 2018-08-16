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

	<title>AspConexões | Todos municípios</title>
	
	<!-- Criando uma variável -->
	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/municipios/buscaPorNome" var="buscaPorNome" />
	<c:url value="/resources/img" var="imgPath" />
	
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css">
	<link rel="stylesheet" href="${cssPath}/index.css">
	<link rel="stylesheet" href="${cssPath}/aspconexoes.css">
	
	<link rel="shortcut icon" href="${imgPath}/favicon.png" />
	
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Início</a></li>
			<li class="active">Municípios</li>
			<!-- <li class="active">Pesquisa</li> -->
		</ol>

		<div class="row cabecalho">
			<div class="col-xs-12 col-md-6">
				<h1>Lista de municípios</h1>
			</div>
			<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
				<form:form action="${s:mvcUrl('MC#buscaPorNome').build()}" method="GET" commandName="municipio">
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
	<c:if test="${pagina.isVazia()}"><div class="alert alert-warning  text-center" role="alert"><b>Nenhum município encontrado...</b></div></c:if>
		<!-- Opcao com colapse -->
		<div class="panel-group">
			<c:forEach items="${pagina.getConteudo()}" var="municipio" varStatus="status">
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
			
		<c:if test="${!pagina.isVazia()}">
			<div class="row">
				<div class="col-sm-12 paginacao text-right">
					<ul class="pagination">
						<li <c:if test="${pagina.isPrimeira()}"> class="disabled"</c:if>>
							<a <c:if test="${pagina.getAtual() != 0}">href="${pagina.urlParaPagina(pagina.getAtual() - 1)}" aria-label="Previous"</c:if>>
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="1" end="${pagina.getTotalPaginas()}">
							<li 
								<c:if test="${i-1 == pagina.getAtual()}">class="active"</c:if>>
									<a href="${pagina.urlParaPagina(i-1)}">${i}</a>
							</li>	
						</c:forEach>
						<li <c:if test="${pagina.isUltima()}">class="disabled"</c:if>>
							<a <c:if test="${!pagina.isUltima()}">href="${pagina.urlParaPagina(pagina.getAtual() + 1)}" aria-label="Next"</c:if>>
		        				<span aria-hidden="true">&raquo;</span>
		      				</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
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