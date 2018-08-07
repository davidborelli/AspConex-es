<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html lang="pt-BR">

	<head>
	  <meta charset="UTF-8"/>
	  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	  <meta name="viewport" content="width=device-width, initial-scale=1"/>
	  
	  <c:url value="/resources/css" var="cssPath" />
	
	  <title>AspConexões | 403</title>
	  
	  <link rel="stylesheet" type="text/css" href="${cssPath}/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="${cssPath}/vendors.min.css"/>
	  <link rel="stylesheet" type="text/css" href="${cssPath}/403.min.css"/>
	
	</head>

	<body class="aw-layout-simple-page">
		<div class="aw-layout-simple-page__container">
		
			<div class="aw-error-panel">
				<h1 class="aw-error-panel__code">
					<span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
				</h1>
				
				<h2 class="aw-error-panel__title">Acesso negado</h2>
				
				<div class="aw-error-panel__description">
					Desculpe, você não está autorizado a acessar a página que solicitou.
					Se você acha que isso é um engano, entre em contato com a gente.
					<br/><br/>
					<a href="javascript:history.back()" class="btn  btn-primary">Voltar para onde estava</a>
				</div>
			</div>
		</div>
	</body>
</html>