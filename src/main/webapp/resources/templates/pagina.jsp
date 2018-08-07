<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>AspConexões</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/index.css">
</head>
<body>
	<jsp:include page="/resources/templates/navbar.jsp" />

	<div class="container">
		<ol class="breadcrumb">
			<li><a href="">In�cio</a></li>
			<li><a href="">Ordens de Servi�o</a></li>
			<li class="active">Pesquisa</li>
		</ol>

		<div class="row cabecalho">
			<div class="col-xs-12 col-md-6">
				<h1>Conex�es</h1>
			</div>
			<div class="col-xs-12 col-md-4 col-md-offset-2 busca">
				<div class="input-group">
					<input type="text" name="busca" class="form-control" placeholder="Pesquisar por nome do cliente">
					<span class="input-group-btn">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
	
		<div class="table-responsive">
			<table class="dados-os table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Cod.</th>
						<th>Data</th>
						<th>Cliente</th>
						<th>Valor</th>
						<th>Funcionário</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>51523</td>
						<td>05/05/05</td>
						<td>Galdalf Cinzento</td>
						<td>800,00</td>
						<td>Jorge</td>
						<td><span class="label label-primary">Em Andamento</span></td>
						<td class="text-center">
							<a href="" data-toggle="tooltip" title="Finalizar"><span class="glyphicon glyphicon-ok text-success"></span></a>
							<a href="" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
					</tr>
					<tr>
						<td>51524</td>
						<td>06/05/05</td>
						<td></td>
						<td>800,00</td>
						<td>Jorge</td>
						<td><span class="label label-default">Em Andamento</span></td>
						<td class="text-center">
							<a href="" data-toggle="tooltip" title="Finalizar"><span class="glyphicon glyphicon-ok text-success"></span></a>
							<a href="" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
					</tr>
					<tr>
						<td>51523</td>
						<td>05/05/05</td>
						<td>Galdalf Cinzento</td>
						<td>800,00</td>
						<td>Jorge</td>
						<td><span class="label label-warning">Em Andamento</span></td>
						<td class="text-center">
							<a href="" data-toggle="tooltip" title="Finalizar"><span class="glyphicon glyphicon-ok text-success"></span></a>
							<a href="" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
					</tr>
					<tr>
						<td>51523</td>
						<td>05/05/05</td>
						<td>Galdalf Cinzento</td>
						<td>800,00</td>
						<td>Jorge</td>
						<td><span class="label label-danger">Em Andamento</span></td>
						<td class="text-center">
							<a href="" data-toggle="tooltip" title="Finalizar"><span class="glyphicon glyphicon-ok text-success"></span></a>
							<a href="" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
					</tr>
					<tr>
						<td>51523</td>
						<td>05/05/05</td>
						<td>Galdalf Cinzento</td>
						<td>800,00</td>
						<td>Jorge</td>
						<td><span class="label label-success">Em Andamento</span></td>
						<td class="text-center">
							<a href="" data-toggle="tooltip" title="Finalizar"><span class="glyphicon glyphicon-ok text-success"></span></a>
							<a href="" data-toggle="tooltip" title="Editar"><span class="glyphicon glyphicon-pencil text-warning"></span></a>
							<a href="" data-toggle="tooltip" title="Excluir"><span class="glyphicon glyphicon-trash text-danger"></span></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<footer class="row">
			<div class="col-sm-6">
				<button class="btn btn-primary" data-toggle="modal" data-target="#novaOS">Nova Ordem de Servi�o</button>
			</div>
			<div class="col-sm-6 paginacao text-right">
				<ul class="pagination">
					<li class="disabled"><a href=""><span><<</span></a></li>
					<li class="active"><a href=""><span>1</span></a></li>
					<li><a href=""><span>2</span></a></li>
					<li><a href=""><span>3</span></a></li>
					<li><a href=""><span>4</span></a></li>
					<li><a href=""><span>5</span></a></li>
					<li><a href=""><span>>></span></a></li>
				</ul>
			</div>
		</footer>
	</div>

	<div class="modal fade" id="novaOS">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" data-dismiss="modal" class="close">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Nova Ordem de Servi�o</h4>
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
								<label>C�digo da OS</label>
								<p class="form-control-static">6564</p>
							</div>
						</div>
						<div class="row">
							<div class="form-group has-error col-sm-5">
								<label class="control-label" for="Cliente">Cliente</label>
								<select id="Cliente" class="form-control"> <!-- form-control = fala para bootstrap que é dele -->
									<option value="">Selecione...</option>
									<option value="1">Frodo Bolseiro</option>
									<option value="2">Gandalf Cinzento</option>
									<option value="3">Sauron de Mordor</option>
								</select>
							</div>
							<div class="form-group has-error col-sm-7">
								<label class="control-label" for="Servicos">Servi�os</label>
								<select id="Servicos" class="form-control"> <!-- form-control = fala para bootstrap que é dele -->
									<option value="">Selecione...</option>
									<option value="1">Ajuste Data/Hora</option>
									<option value="2">Conserto de Engrenagens</option>
									<option value="3">Troca de Bateria</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group has-error col-xs-12">
								<label class="control-label" for="Observacao">Observa��o</label>
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
  

	<script src="<%=request.getContextPath()%>/resources/js/jquery-1.12.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>