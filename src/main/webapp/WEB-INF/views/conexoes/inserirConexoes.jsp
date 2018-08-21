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

	<c:if test="${conexao.getId() == null}"><title>AspConexões | Cadastrar conexão</title></c:if>
	<c:if test="${conexao.getId() != null}"><title>AspConexões | Editar conexão</title></c:if>
	
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
			<c:if test="${conexao.getId() == null}"><li class="active">Cadastros</li></c:if>
			<c:if test="${conexao.getId() != null}"><li class="active">Editar</li></c:if>
			<li class="active">Conexão</li>
		</ol>
		
		<div class="page-header">
			<c:if test="${conexao.getId() == null}"><h1>Cadastrar Conexão</h1></c:if>
			<c:if test="${conexao.getId() != null}"><h1>Editar Conexão</h1></c:if>
		</div>
		
		<c:forEach items="${mensagem}" var="msg">
				<div class="alert alert-success"> <!--succes | warning | info-->
					<button type="button" class="close" data-dismiss="alert">
						<span>&times;</span>
					</button>
					<b>${msg}</b>
				</div>
			</c:forEach>
		
		<form:form action="${s:mvcUrl('CC#gravar').build()}" method="post" commandName="conexao">
		
			<div class="form-group">
				<div class="col-sm-offset-2  com-sm-10">
					<ul>
						<c:forEach items="${erros}" var="msg">
							<li class="erro">${msg}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<form:hidden path="id" value="${municipio.id }"/>
			
			<div class="row  form-group">
				<div class="col-sm-3  form-group">
					<label for="municipio" class="control-label">Município</label>
					<form:select path="municipio.id" cssClass="form-control">
						<option value=" ">Selecione o Municipio...</option>
						<c:forEach items="${municipios}" var="municipio" >
							<form:option value="${municipio.id}" >${municipio.nome}</form:option>
						</c:forEach>	
					</form:select>
					<form:errors path="municipio.id" cssClass="erro"  />
				</div>	
			
				<div class="col-sm-2  form-group">
					<label for="tipoConexao" class="control-label">Tipo da Conexão</label>
					<form:select path="tipo" cssClass="form-control">
						<option value="">Selecione o Tipo...</option>
						<c:forEach items="${tipos}" var="tipo">
							<form:option value="${tipo}">${tipo.descricao}</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="tipo" cssClass="erro"  />
				</div>			
			</div>
		
		
			<div class="row  form-group">
				<div class="col-sm-5">
					<label for="id_ip" class="control-label">ID / IP</label>
					<form:input path="id_ip" cssClass="form-control" />
					<form:errors path="id_ip" cssClass="erro" />
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
					<label><input type="radio" name="ativo" id="ativo" value="true" checked="checked">Ativo</label>	
					<label><input type="radio" name="ativo" id="inativo" value="false">Inativo</label>
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