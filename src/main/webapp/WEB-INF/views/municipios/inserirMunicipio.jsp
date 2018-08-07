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

	<title>AspConexões | Inserir município</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<c:url value="/" var="contextPath" />
	
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/">Início</a></li>
			<li><a href="${contextPath}">Municípios</a></li>
			<li class="active">Inserir município</li>
		</ol>
		
		<div class="container">
			<div class="page-header">
				<h1>Inserir município</h1>
			</div>
			
			<form:form action="${s:mvcUrl('MC#gravar').build()}" method="post" commandName="municipio">
			
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
					<label class="col-sm-2 control-label" for="nome">Nome</label>
					<div class="col-sm-5">
						<form:input path="nome" cssClass="form-control" />	
					</div>	
				</div>
				<div class="radio">
					<label><input type="radio" name="ativo" id="ativo" value="true" checked="checked">Ativo</label>	
					<label><input type="radio" name="ativo" id="inativo" value="false">Inativo</label>
				</div>	
				
				<footer class="row  rodape">
					<div class="col-sm-6">
						<button class="btn btn-primary" type="submit">Salvar</button>
						<a href="${contextPath}" class="btn btn-default">Voltar</a>
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