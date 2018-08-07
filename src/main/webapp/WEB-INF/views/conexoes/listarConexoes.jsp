<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões | Municípios</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">Início</a></li>
			<li class="active">Municípios</li>
			<!-- <li class="active">Pesquisa</li> -->
		</ol>

		<div class="container">
			<h1>Municípios</h1>			
			<div class="col-xs-12 col-md-4 col-md-offset-8 busca">
				<form action="<%=request.getContextPath()%>/municipios/filtrar">
					<div class="input-group">
						<input type="text" name="busca" class="form-control" placeholder="Pesquisar por nome do município">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	
		<div class="table-responsive">
			<table class="dados-os table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Código</th>
						<th>Nome</th>
						<th>Ativo</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${itens}" var="x">
						<tr <c:if test="${x.ativo == false}">class="danger"</c:if>>
							<td>${x.id}</td>
							<td>${x.nome}</td>
							<td>
								<c:if test="${x.ativo == false}">Inativo</c:if>
								<c:if test="${x.ativo == true}">Ativo</c:if>
							</td>
							<td class="text-center">
							<a href="<%=request.getContextPath()%>/municipios/editar?cod=${x.id}" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="<%=request.getContextPath()%>/municipios/remover?cod=${x.id}" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
						</tr>					
					</c:forEach>
				</tbody>
			</table>
		</div>
		<footer class="row">
			<div class="col-sm-6">
				<form action="<%=request.getContextPath()%>/municipio/inserir">
					<button class="btn btn-primary" type="submit">Novo Município</button>
					<a href="<%=request.getContextPath()%>/" class="btn btn-default">Voltar</a>
				</form>
			</div>
			<div class="col-sm-6 paginacao text-right">
				<ul class="pagination">
					<li class="disabled"><a href=""><span><<</span></a></li>
					<li class="active"><a href=""><span>1</span></a></li>
					<li><a href=""><span>2</span></a></li>
					<li><a href=""><span>3</span></a></li>
					<li><a href=""><span>4</span></a></li>
					<li><a href=""><span>5</span></a></li>
					<li><a href=""><span>>></span></a></li>
				</ul>
			</div>
		</footer>
	</div>
  

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>