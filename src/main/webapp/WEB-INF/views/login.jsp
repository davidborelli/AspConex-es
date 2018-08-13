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
	
	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/resources/img" var="imgPath" />
	<c:url value="/resources/js" var="scriptPath" />

	<title>Login | AspConexões</title>

	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	<link rel="stylesheet" href="${cssPath}/style.css" />
</head>
<body>

	<div class="formulario-login col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
		<header>
			<h1><img src="${imgPath}/aspconexao.png" class="img-responsive"></h1>
			<h2 class="text-center">Entre com seu <b>usuário</b> e <b>senha</b></h2>
		</header>
	
		<form:form servletRelativeAction="/login" method="post">
		
			<div class="alert alert-danger  text-center"> <!--succes | warning | info-->
				<button type="button" class="close" data-dismiss="alert">
					<span>&times;</span>
				</button>
				<b>Usuário e/ou senha inválido!</b>
			</div>
		
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<span class="glyphicon glyphicon-user"></span>
					</div>
					<input type="email" name="username" class="form-control" placeholder="Usuário">
				</div>
			</div>

			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<span class="glyphicon glyphicon-option-horizontal"></span>
					</div>
					<input type="password" name="password" class="form-control" placeholder="Senha">
				</div>
			</div>

			<footer>
			 	<div class="checkbox pull-left">
					<label><input type="checkbox" name="remember-me">Lembrar de mim</label>
				</div> 
				<button type="submit" class="btn btn-primary pull-right">Entrar</button>
			</footer>
		</form:form>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-2.2.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>	
</body>
</html>