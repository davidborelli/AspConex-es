<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

	<title>AspConexões | Editar usuário</title>
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
			<li><a href="${contextPath}">Início</a></li>
			<li class="active">Editar</li>
			<li class="active">Usuário</li>
		</ol>
		
		<div class="page-header">
			<h1>Editar usuário</h1>
		</div>
		
		<form:form action="${s:mvcUrl('UC#gravar').build()}" method="post" commandName="usuario" autocomplete="off">
			
			<div class="row  form-group">	
			
				<div class="col-sm-12">
					<label for="nome" class="control-label">Nome</label>
					<form:hidden path="codigo" value="${usuario.codigo}"/>
					<form:input path="nome" cssClass="form-control "/>	
					<form:errors path="nome" cssClass="erro" />			
				</div>			
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="email" class="control-label">E-mail</label>
					<form:input path="email" cssClass="form-control" autocomplete="off"/>
					<form:errors path="email" cssClass="erro" />
				</div>				
					
				<div class="col-sm-5" >	
					<label class="control-label" for="senha">Senha</label>
					<form:input type="password" path="senha" cssClass="form-control" autocomplete="off"/>	
					<form:errors path="senha" cssClass="erro" />
				</div>				
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-3">
					<label for="setor" class="control-label">Setor</label>
					<form:select path="setor" cssClass="form-control">
						<option value="${fn:toUpperCase(usuario.setor)}">${usuario.setor}</option>
						<c:forEach items="${setores}" var="setor" >
							<form:option value="${setor}">${setor.descricao}</form:option>
						</c:forEach>	
					</form:select>
					<form:errors path="setor" cssClass="erro" />
				</div>				
			</div>
			
			<div class="row  form-group">
				<div class="radio  col-sm-2">
					<label><input type="radio" name="ativo" id="ativo" value="true" <c:if test="${usuario.ativo == true}">checked="checked"</c:if>>Ativo</label>	
					<label><input type="radio" name="ativo" id="inativo" value="false" <c:if test="${usuario.ativo == false}">checked="checked"</c:if>>Inativo</label>
				</div>
			</div>	
			
			<div class="row">
				<div class="form-group  col-sm-6">
					<label class="control-label">Grupos</label> 
					<div>
						<c:forEach items="${pgrupos}" var="grupoFe" varStatus="status">
							<form:checkbox path="grupo" id="grupo_${status.index}" value="${grupoFe.codigo}"></form:checkbox>
							<label for="grupo_${status.index}">${grupoFe.nome}</label>
						</c:forEach>
					</div>
					<form:errors path="grupo" cssClass="erro" />
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