<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConex�es | Confirma��o exclus�o de munic�pio</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">In�cio</a></li>
			<li><a href="<%=request.getContextPath()%>/municipios/listar">Munic�pios</a></li>
			<li class="active">Exclus�o de munic�pio</li>
		</ol>
		
		<div class="container">
			<div class="page-header">
				<h1>Exclus�o de munic�pio</h1>
			</div>
			
			<div>
				<ul class="list-group">
					<li class="list-group-item">C�digo: ${item.id}</li>
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