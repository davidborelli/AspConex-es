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
	
	<c:if test="${usuario.getCodigo() == null}"><title>AspConexões | Inserir usuário</title></c:if>
	<c:if test="${usuario.getCodigo() != null}"><title>AspConexões | Editar usuário</title></c:if>
	
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
			<c:if test="${usuario.getCodigo() == null}"><li class="active">Inserir</li></c:if>
			<c:if test="${usuario.getCodigo() != null}"><li class="active">Editar</li></c:if>
			<li class="active">Usuário</li>
		</ol>
		
		<c:if test="${usuario.getCodigo() == null}"><div class="page-header"><h1>Inserir usuário</h1></div></c:if>
		<c:if test="${usuario.getCodigo() != null}"><div class="page-header"><h1>Editar usuário</h1></div></c:if>
		
		<c:forEach items="${mensagem}" var="msg">
				<div class="alert alert-success"> <!--succes | warning | info-->
					<button type="button" class="close" data-dismiss="alert">
						<span>&times;</span>
					</button>
					<b>${msg}</b>
				</div>
			</c:forEach>
		
		<form:form action="${s:mvcUrl('UC#gravar').build()}" method="post" commandName="usuario" autocomplete="off">
			
			<div class="row  form-group">	
			
				<div class="col-sm-12">
					<label for="nome" class="control-label">Nome</label>
					<form:hidden path="codigo" value="${usuario.codigo}"/>
					<form:input path="nome" cssClass="form-control"></form:input>	
					<form:errors path="nome" cssClass="erro" />			
				</div>			
			</div>
			
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="email" class="control-label">E-mail</label>
					<form:input type="email" path="email" cssClass="form-control" autocomplete="off"/>
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
						<option value="">Selecione o setor...</option>
						<c:forEach items="${setores}" var="setor" >
							<form:option value="${setor}" >${setor.descricao}</form:option>
						</c:forEach>	
					</form:select>
					<form:errors path="setor" cssClass="erro" />
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