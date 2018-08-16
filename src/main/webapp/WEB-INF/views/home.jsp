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

	<title>AspConexões</title>
	
	<!-- Criando uma variável -->
	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/resources/img" var="imgPath" />
	<c:url value="/municipios/buscaPorNome" var="buscaPorNome" />
	
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	<link rel="stylesheet" href="${cssPath}/index.css" />
	<link rel="stylesheet" href="${cssPath}/aspconexoes.css" />
	
	<link rel="shortcut icon" href="${imgPath}/favicon.png" />
	
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Início</a></li>
			<li class="active">Conexões</li>
		</ol>

		<div class="row cabecalho">
			<div class="col-xs-12 col-md-6">
				<h1>Conexões</h1>
			</div>
			<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
				<form:form action="${s:mvcUrl('MC#hbuscaPorNome').build()}" method="GET" commandName="municipio">
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="lblTitleNomeMuni" data-toggle="collapse" href="#collapse${status.index}">	
							<div class="panel-title">
							<table>
							   <tr>
								   <td class="tituloMuni">${municipio.nome}</td>
								   <td class="tituloMuni  text-right">0/${municipio.conexoes.size()}</td>
							   </tr>
							</table>
								<%-- <label class="control-label"> ${municipio.nome}</label>
								<label class="control-label">${municipio.conexoes.size()}</label> --%>
							</div>
						</a>
					</div>
					<div id="collapse${status.index}" class="panel-collapse collapse">
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">Tipo</th>
										<th class="text-center">ID | IP</th>
										<th class="text-center">Usuário</th>
										<th class="text-center">Porta</th>
										<th class="text-center">Senha</th>
										<security:authorize access="hasRole('ROLE_ADMIN')"> <!-- isAuthenticated() -->
											<th class="text-center"></th>
											<th class="text-center"></th>
										</security:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${municipio.conexoes}" var="conexao">
										<tr>
											<td class="text-center">${conexao.tipo.descricao}</td>
											<td class="text-center">${conexao.id_ip}</td>
											<td class="text-center">${conexao.usuario}</td>
											<td class="text-center">${conexao.porta}</td>
											<td class="text-center">${conexao.senha}</td>	
											<security:authorize access="hasRole('ROLE_ADMINISTRADOR')"> <!-- isAuthenticated() -->
												<td>
													<div class="text-right">
														<form:form action="${s:mvcUrl('CC#editarConexao').arg(0,conexao.id).build()}" method="POST">
															<button type="submit" class="btn btn-default  btn-xs">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
														</form:form>
													</div>
												</td>		
												<td>
													<div class="text-left">
														<form:form action="${s:mvcUrl('CC#exclusao').arg(0,conexao.id).build()}" method="POST">
															<button type="submit" class="btn btn-default  btn-xs">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</form:form>
													</div>
												</td>
											</security:authorize>										
										</tr>
									</c:forEach>
								</tbody>
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