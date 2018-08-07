<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões | Editar município</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">Início</a></li>
			<li><a href="<%=request.getContextPath()%>/municipios/listar">Municípios</a></li>
			<li class="active">Editar município</li>
		</ol>
		
		<div class="container">
			<div class="page-header">
				<h1>Editar município</h1>
			</div>
			
			<form method="post" name="atualizarMunicipio" action="<%=request.getContextPath()%>/municipios/atualizar">
			
				<div class="form-group">
					<div class="col-sm-offset-2  com-sm-10">
						<ul>
							<c:forEach items="${erros}" var="msg">
								<li class="erro">${msg}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			
			
				<div class="form-group">
					<div class="row">
						<div class="col-sm-1 form-group">
							<label for="codigo" class="control-label">Código</label>
							<input type="number" readonly="readonly" name="id" id="id" value="${item.id}" class="form-control"/>	
						</div>
					</div>
				
					<div class="row">
						<div class="col-sm-6 form-group">	
							<label for="nome" class="control-label">Nome</label>
							<input type="text" name="nome" id="nome" value="${item.nome}" class="form-control"/>
						</div>	
					</div>
					
				</div>	
				
				<div class="row">
					<div class="col-lg-3  col-sm-6  form-group">
						<label for="origem" class="control-label">Status</label>
						<div>
							<div class="radio">
								<div>
									<label><input type="radio" name="ativo" id="ativo" value="true" <c:if test="${item.ativo == true}">checked="checked"</c:if>>Ativo</label>
								</div>
								<div> 								
									<label><input type="radio" name="ativo" id="inativo" value="false" <c:if test="${item.ativo == false}">checked="checked"</c:if>>Inativo</label>
								</div> 
							</div>
						</div>
					</div>
				</div>
				
				<footer class="row  rodape">
					<div class="col-sm-6">
						<button class="btn btn-primary" type="submit">Atualizar</button>
						<a href="<%=request.getContextPath()%>/municipios/listar" class="btn btn-default">Voltar</a>
					</div>
				</footer>		
			</form>			
		</div>		
	</div>

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>