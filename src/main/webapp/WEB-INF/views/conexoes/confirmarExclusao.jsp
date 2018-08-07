<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões | Confirmação exclusão de município</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">Início</a></li>
			<li><a href="<%=request.getContextPath()%>/municipios/listar">Municípios</a></li>
			<li class="active">Exclusão de município</li>
		</ol>
		
		<div class="container">
			<div class="page-header">
				<h1>Exclusão de município</h1>
			</div>
			
			<div>
				<ul class="list-group">
					<li class="list-group-item">Código: ${item.id}</li>
					<li class="list-group-item">Nome: ${item.nome}</li>
					<li class="list-group-item">Ativo: ${item.ativo}</li>
				</ul>
			</div>
				
			<footer class="row  rodape">
				<div class="col-sm-6">
					<a href="<%=request.getContextPath()%>/municipios/excluir?cod=${item.id}" class="btn btn-danger">Excluir</a> 
					<a href="<%=request.getContextPath()%>/municipios/listar" class="btn btn-default">Voltar</a>
				</div>
			</footer>					
		</div>		
	</div>

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>