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

	<title>AspConexões</title>
	
	<!-- Criando uma variável -->
	<c:url value="/resources/css" var="cssPath" />
	<c:url value="/municipios/buscaPorNome" var="buscaPorNome" />
	
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	<link rel="stylesheet" href="${cssPath}/index.css" />
	<link rel="stylesheet" href="${cssPath}/aspconexoes.css" />
	
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">Início</a></li>
			<li class="active">Conexões</li>
		</ol>

		<div class="row cabecalho">
			<div class="col-xs-12 col-md-6">
				<h1>Conexões</h1>
			</div>
			<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
				<form:form action="${s:mvcUrl('MC#hbuscaPorNome').build()}" method="POST" commandName="municipio">
					<div class="input-group">
						<form:input path="nome" cssClass="form-control" placeholder="Pesquisar por nome do município" />
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form:form>
			</div>
		</div>
	</div>
		
	<div class="col-sm-12  text-center" <c:if test="${pagina.getSize() == 0}">Nenhum municipío encontrado</c:if>></div>
		
	<div class="container">
		<!-- Opcao com colapse -->
		<div class="panel-group">
			<c:out value="${pagina}"></c:out>
			<c:forEach items="${pagina.content}" var="municipio" varStatus="status">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="lblTitleNomeMuni" data-toggle="collapse" href="#collapse${status.index}">	
							<div class="panel-title">
							<table>
							   <tr>
								   <td class="tituloMuni">${municipio.nome}</td>
								   <td class="tituloMuni  text-right">0/${municipio.conexoes.size()}</td>
							   </tr>
							</table>
								<%-- <label class="control-label"> ${municipio.nome}</label>
								<label class="control-label">${municipio.conexoes.size()}</label> --%>
							</div>
						</a>
					</div>
					<div id="collapse${status.index}" class="panel-collapse collapse">
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center">Tipo</th>
										<th class="text-center">ID | IP</th>
										<th class="text-center">Usuário</th>
										<th class="text-center">Porta</th>
										<th class="text-center">Senha</th>
										<security:authorize access="hasRole('ROLE_ADMIN')"> <!-- isAuthenticated() -->
											<th class="text-center"></th>
											<th class="text-center"></th>
										</security:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${municipio.conexoes}" var="conexao">
										<tr>
											<td class="text-center">${conexao.tipo.descricao}</td>
											<td class="text-center">${conexao.id_ip}</td>
											<td class="text-center">${conexao.usuario}</td>
											<td class="text-center">${conexao.porta}</td>
											<td class="text-center">${conexao.senha}</td>	
											<security:authorize access="hasRole('ROLE_ADMINISTRADOR')"> <!-- isAuthenticated() -->
												<td>
													<div class="text-right">
														<form:form action="${s:mvcUrl('CC#editarConexao').arg(0,conexao.id).build()}" method="POST">
															<button type="submit" class="btn btn-default  btn-xs">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
														</form:form>
													</div>
												</td>		
												<td>
													<div class="text-left">
														<form:form action="${s:mvcUrl('CC#exclusao').arg(0,conexao.id).build()}" method="POST">
															<button type="submit" class="btn btn-default  btn-xs">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</form:form>
													</div>
												</td>
											</security:authorize>										
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
  				</div>
			</c:forEach>
		</div>			
		
		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-primary" data-toggle="modal" data-target="#novaOS">Nova Ordem de Serviço</button>
			</div>
			<div class="col-sm-6 paginacao text-right">
				<ul class="pagination">
					<li>
						<a href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach var="i" begin="1" end="${pagina.getTotalPages()}">
						<li 
							<c:if test="${i-1 == pagina.getNumber()}">class="active"</c:if>>
								<a href="?page=${i-1}">${i}</a>
						</li>	
					</c:forEach>
					<li>
						<a href="#" aria-label="Next">
	        				<span aria-hidden="true">&raquo;</span>
	      				</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="confirm" role="dialog">
		<div class="modal-dialog modal-md">
		
			<div class="modal-content">
				<div class="modal-body">
					<p class="text-center"> Confirma a exclusão da conexão?</p>
				</div>
				<div class="modal-footer">
					<a href="wfefwe" type="button" class="btn btn-danger" id="delete">Apagar Registo</a>
					<button type="button" data-dismiss="modal" class="btn btn-default">Cancelar</button>
				</div>
			</div>
		
		</div>
	</div>
	

	<div class="modal fade" id="novaOS">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" class="close">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Nova Ordem de Serviço</h4>
				</div>
				<form>
					<div class="modal-body">
						
						<!-- Alert que pode ser fechado -->
						<div class="alert alert-warning"> <!--succes | warning | info-->
						<button type="button" class="close" data-dismiss="alert">
							<span>&times;</span>
						</button>
							<b>Ocorreu um erro!</b> Verifique se preencheu todos os campos.
						</div>

						<div class="row">
							<div class="form-group col-xs-12">
								<label>Código da OS</label>
								<p class="form-control-static">6564</p>
							</div>
						</div>
						<div class="row">
							<div class="form-group has-error col-sm-5">
								<label class="control-label" for="Cliente">Cliente</label>
								<select id="Cliente" class="form-control"> <!-- form-control = fala para bootstrap que Ã© dele -->
									<option value="">Selecione...</option>
									<option value="1">Frodo Bolseiro</option>
									<option value="2">Gandalf Cinzento</option>
									<option value="3">Sauron de Mordor</option>
								</select>
							</div>
							<div class="form-group has-error col-sm-7">
								<label class="control-label" for="Servicos">Serviços</label>
								<select id="Servicos" class="form-control"> <!-- form-control = fala para bootstrap que Ã© dele -->
									<option value="">Selecione...</option>
									<option value="1">Ajuste Data/Hora</option>
									<option value="2">Conserto de Engrenagens</option>
									<option value="3">Troca de Bateria</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group has-error col-xs-12">
								<label class="control-label" for="Observacao">Observação</label>
								<textarea id="Observacao" class="form-control" rows="3">
									
								</textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group has-error col-sm-4">
								<label class="control-label" for="Valor">Valor</label>
								<div class="input-group">
									<div class="input-group-addon">R$</div>
									<input type="text" name="valor" id="Valor" class="form-control">
								</div>
							</div>						
						</div>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-danger">Limpar</button>
						<button type="submit" class="btn btn-primary">Salvar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
  	
	<footer class="page-footer">	
		<div class="footer-copyright text-center">© 2018 Copyright:
	    	<a href="http://grupoassessor.com/fallow/davidborelli"> David Borelli</a>
	    </div>	
	</footer>
	
	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>