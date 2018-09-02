var Aspconexoes = Aspconexoes || {};

Aspconexoes.MostrarConexoes = (function(){
	
	function MostrarConexoes(){
		this.panel = $('.tituloMunicipio');
		this.token = $("meta[name='_csrf']").attr("content");
		this.header = $("meta[name='_csrf_header']").attr("content");
	}
	
	MostrarConexoes.prototype.iniciar = function(){
		this.panel.on('click', enviarMunicipio.bind(this));
	}
	
	function enviarMunicipio(event){
		var painel = $('.panel-default');
		var expandido = painel.find('.in').length;
		var idMun = event.target.id; 
		
		console.log('Enviando id: ' + idMun + ' para busca!');		

		$.ajax({
			url: 'conexoes/pesquisa',
			method: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({ id: idMun }),
			success: onPesquisaFeita.bind(this),
			error: onError.bind(this)
		}); 
	}
	
	function onError(){
		console.log('Deu erro!');
	}
	
	function onPesquisaFeita(conexao){
		console.log("deu certo!");		
	}
	
	return MostrarConexoes;
	
}());

$(function(){
	
	var mostrarConexoes = new Aspconexoes.MostrarConexoes();
	mostrarConexoes.iniciar();
	
});