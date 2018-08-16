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

	<title>AspConexões | Editar município</title>
	<c:url value="/resources/img" var="imgPath" />

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
	
	<link rel="shortcut icon" href="${imgPath}/favicon.png" />
</head>
<body>
	<c:url value="/" var="contextPath" />
	
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">Início</a></li>
			<li class="active">Editar</li>
			<li class="active">Município</li>
		</ol>
		
		<div class="container">
			<div class="page-header">
				<h1>Editar município</h1>
			</div>
			
			<form:form action="${s:mvcUrl('MC#gravar').build()}" method="post" commandName="municipio">
			
				<div class="row form-group">
					<label class="col-sm-1 control-label" for="nome">Nome</label>
					<div class="col-sm-5">
						<form:hidden path="id" value="${municipio.id}" />	
						<form:input path="nome" cssClass="form-control" />
						<form:errors path="nome" cssClass="erro"  />
					</div>	
					<div class="radio col-sm-5">
						<label><input type="radio" name="ativo" id="ativo" value="true" <c:if test="${municipio.ativo == true}">checked="checked"</c:if>>Ativo</label>	
						<label><input type="radio" name="ativo" id="inativo" value="false" <c:if test="${municipio.ativo == false}">checked="checked"</c:if>>Inativo</label>
					</div>	
				</div>
				
				<footer class="row  rodape">
					<div class="col-sm-6">
						<button class="btn btn-primary" type="submit">Salvar</button>
						<a href="${contextPath}municipios/" class="btn btn-default">Voltar</a>
					</div>
				</footer>		
			</form:form>			
		</div>		
	</div>

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>