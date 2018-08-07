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

	<title>AspConexões | Inserir usuário</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<c:url value="/" var="contextPath" />
	
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="${contextPath}">Início</a></li>
			<li><a href="${contextPath}">Cadastros</a></li>
			<li class="active">Inserir usuário</li>
		</ol>
		
		<div class="page-header">
			<h1>Inserir usuário</h1>
		</div>
		
		<form:form action="${s:mvcUrl('UC#gravar').build()}" method="post" commandName="usuario">
		
			<div class="form-group">
				<div class="col-sm-offset-2  com-sm-10">
					<ul>
						<c:forEach items="${erros}" var="msg">
							<li class="erro">${msg}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			
			<div class="row  form-group">	
			
				<div class="col-sm-12">
					<label for="nome" class="control-label">Nome</label>
					<form:input path="nome" cssClass="form-control "/>				
				</div>			
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="email" class="control-label">E-mail</label>
					<form:input path="email" cssClass="form-control" autocomplete="false"/>
				</div>				
					
				<div class="col-sm-5" >	
					<label class="control-label" for="senha">Senha</label>
					<form:input type="password" path="senha" cssClass="form-control" autocomplete="false"/>	
				</div>				
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-3">
					<label for="setor" class="control-label">Setor</label>
					<form:select path="setor" cssClass="form-control">
						<option value="">Selecione o setor...</option>
						<c:forEach items="${setores}" var="setor" >
							<form:option value="${setor}" >${setor.descricao}</form:option>
						</c:forEach>	
					</form:select>
				</div>				
			</div>
			
			<div class="row  form-group">
				<div class="radio  col-sm-2">
					<label><form:radiobutton path="ativo" name="ativo" id="ativo" value="true" checked="checked" />Ativo</label>	
					<label><form:radiobutton path="ativo" name="ativo" id="inativo" value="false" />Inativo</label>
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