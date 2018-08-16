<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões | Editar conexões</title>
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
			<li><a href="${contextPath}">Conexões</a></li>
			<li class="active">Editar conexão</li>
		</ol>
		
		<div class="page-header">
			<h1>Editar conexão</h1>
		</div>
		
		<form:form action="${s:mvcUrl('CC#editar').build()}" method="post" commandName="conexao">
			
			<div class="row  form-group">
				<div class="col-sm-3  form-group">
					<label for="municipio" class="control-label">Município</label>
					<form:select path="municipio.id" cssClass="form-control">
						<option value="${municipio.id}">${conexao.municipio.nome}</option>
						<c:forEach items="${municipios}" var="muni" varStatus="status">
							<form:option value="${muni.id}" >${muni.nome}</form:option>
						</c:forEach>	
					</form:select>
				</div>	
			
				<div class="col-sm-2  form-group">
					<label for="tipoConexao" class="control-label">Tipo da Conexão</label>
					<form:select path="tipo" cssClass="form-control">
						<option value="${conexao.tipo}">${conexao.tipo}</option>
						<c:forEach items="${tipos}" var="tipo">
							<form:option value="${tipo}">${tipo.descricao}</form:option>
						</c:forEach>
					</form:select>
				</div>			
			</div>
		
		
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="id_ip" class="control-label">ID / IP</label>
					<form:input path="id_ip" cssClass="form-control" />
					<form:hidden path="id" value="${conexao.id}" />
				</div>
				<div class="col-sm-2">	
					<label class="control-label" for="porta">Porta</label>
					<form:input path="porta" cssClass="form-control" />
				</div>
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="usuario" class="control-label">Usuário</label>
					<form:input path="usuario" cssClass="form-control "/>				
				</div>
				
				<div class="col-sm-5" >	
					<label class="control-label" for="senha">Senha</label>
					<form:input path="senha" cssClass="form-control" />	
				</div>
			</div>
			
			<div class="row  form-group">
				<div class="radio  col-sm-2">
					<label><input type="radio" name="ativo" id="ativo" value="true" <c:if test="${conexao.ativo == true}">checked="checked"</c:if>>Ativo</label>	
					<label><input type="radio" name="ativo" id="inativo" value="false" <c:if test="${conexao.ativo == false}">checked="checked"</c:if>>Inativo</label>
				</div>
			</div>			
			
			<footer class="row  rodape">
				<div class="col-sm-6">
					<button class="btn btn-primary" type="submit">Salvar</button>
					<a href="${contextPath}" class="btn btn-default">Voltar</a>
				</div>
			</footer>		
		</form:form>			
	</div>

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>