<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<nav class="navbar navbar-inverse navbar-static-top">
<!-- Variável -->
<c:url value="/" var="contextPath" />

	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="<%=request.getContextPath()%>/" class="navbar-brand logotipo">
				<img src="<%=request.getContextPath()%>/resources/img/aspconexao.png" alt="ASpConexões">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="menu">
			<security:authorize access="hasRole('ROLE_ADMINISTRADOR')"> <!-- isAuthenticated() -->
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}">Conexões</a></li>
					<li><a href="${contextPath}">Municípios</a></li>
					<li><a href="${contextPath}">Usuários</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">					 
						Cadastros 
						<span class="caret"></span> 						
						</a>
						<ul class="dropdown-menu"> 
							<li><a href="${s:mvcUrl('CC#form').build()}">Conexões</a></li> 
							<li><a href="${s:mvcUrl('MC#form').build()}">Municípios</a></li>  
							<li><a href="${s:mvcUrl('UC#cadastrar').build()}">Usuário</a></li> 
						</ul>
					</li>							
				</ul>
			</security:authorize>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Minha Conta
						<span class="caret"></span> <!-- Coloca uma setinha para baixo -->
					</a>
					<div class="dropdown-menu perfil">
						<div class="col-sm-4 hidden-xs">
							<img class="img-responsive img-rounded" src="https://api.adorable.io/avatars/100/watchguru.png">
						</div>
						<ul class="list-unstyled col-sm-8">
							<li>
								<security:authorize access="isAuthenticated()">
									<security:authentication property="principal" var="usuario" />${usuario.usuario.nome}
								</security:authorize>
							</li>
							<!-- <li><a href="#">Alterar Perfil</a></li> -->
							<li><a href="/aspconexoes/logout">Sair</a></li>
						</ul>							
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>