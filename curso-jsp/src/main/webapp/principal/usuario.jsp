<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbar-mainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
											<!-- task, page, download counter  start -->


											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">

													<div class="card-block">
														<h5 class="sub-title">Cad. Usuário</h5>
														<!-- Para upload multipart -->
														<form class="form-material" enctype="multipart/form-data" 
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="formUser">

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default form-static-label">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modelLogin.id}"> <span
																	class="form-bar"></span> <label class="float-label">ID</label>
															</div>
															<!-- CARREGAR FOTO IMAGEM -->
															<div class="form-group form-default input-group mb-4">
																<div class="input-group prepend">
																	<c:if test="${modelLogin.fotouser != '' && modelLogin.fotouser != null}">
																	  <a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
																	     <img class="img-80 mCs_img_loaded" height="70px" alt="Imagem User" id="fotoembase64" src="${modelLogin.fotouser}" >
																	  </a>
																																		
																	</c:if>
																	<c:if test="${modelLogin.fotouser == '' || modelLogin.fotouser == null}">
																		<img class="img-80 mCs_img_loaded" height="70px" alt="Imagem User" id="fotoembase64" src="assets/images/avatar-blank.jpg" >
																	</c:if>
																</div>
																<input type="file" id="fileFoto" name="fileFoto" accept="image/*" onchange="visualizarImg('fotoembase64', 'fileFoto');" class="form-control-file" style="margin-top: 15px; margin-left: 10px">
															</div>
															
															
															<div class="form-group form-default form-static-label">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modelLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="date" name="dataNascimento" id="dataNascimento" class="form-control" required="required" value="${modelLogin.dataNascimento}"> 
																<span class="form-bar"></span> <label class="float-label">Dat. Nascimento</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="rendamensal" id="rendamensal" class="form-control" required="required" value="${modelLogin.rendamensal}"> 
																<span class="form-bar"></span> <label class="float-label">Renda Mensal</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">E-mail</label>
															</div>
															
															<div class="form-group form-default form-static-label">
																<select class="form-control" aria-label="Default select example" name="perfil">
																	<option disabled="disabled">[Selecione o Perfil]</option>
																	<option value="ADMIN" <% 
																	
																	  ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																     	}	%>>Admin</option>
																	
																	<option value="SECRETARIA" <% 
																	
																	   modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																     	}	%>>Secretaria</option>
																	<option value="AUXILIAR" <% 
																	
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																	
																	if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
																		out.print(" ");
																		out.print("selected=\"selected\"");
																		out.print(" ");
																     	}	%>>Auxiliar</option>
																
																</select>
															</div>
															
															<div class="form-group form-default form-static-label">
																<input onblur="pesquisaCep();" type="text" name="cep" id="cep"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.cep}">
																<span class="form-bar"></span> <label
																	class="float-label">Cep</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="logradouro" id="logradouro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.logradouro}">
																<span class="form-bar"></span> <label
																	class="float-label">Logradouro</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="bairro" id="bairro"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.bairro}">
																<span class="form-bar"></span> <label
																	class="float-label">Bairro</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="localidade" id="localidade"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.localidade}">
																<span class="form-bar"></span> <label
																	class="float-label">Localidade</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="uf" id="uf"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.uf}">
																<span class="form-bar"></span> <label
																	class="float-label">UF</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="text" name="numero" id="numero"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.numero}">
																<span class="form-bar"></span> <label
																	class="float-label">Numero</label>
															</div>
															
															
															<div class="form-group form-default form-static-label">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.login}">
																<span class="form-bar"></span> <label
																	class="float-label">Login</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Password</label>
															</div>

															<div class="form-group form-default form-static-label">
															  <input type="radio" name="sexo" checked="checked" value="MASCULINO" <%
															  	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
															  	 
															  if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
																  out.print(" ");
																  out.print("checked=\"checked\"");
																  out.print(" ");
															  }
															  
															  
															  %>>Masculino</>
															  <input type="radio" name="sexo" value="FEMININO" <%
															  	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
															  	
															  if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
																  out.print(" ");
																  out.print("checked=\"checked\"");
																  out.print(" ");
															  }
															  
															  
															  %>>Feminino</>
															
															</div>

															<!-- BOTOES NOVO, SALVAR, EXCLUIR -->
															<button type="button"
																class="btn btn-primary waves-effect waves-light"
																onclick="limparForm();">Novo</button>

															<button type="submit"
																class="btn btn-success waves-effect waves-light">Salvar</button>

															<button type="button"
																class="btn btn-danger waves-effect waves-light"
																onclick="criarDeleteComAjax();">Excluir</button>

															<c:if test="${modelLogin.id > 0}">
															
															   <a href="<%= request.getContextPath() %>/ServletTelefone?iduser=${modelLogin.id}" class="btn btn-primary waves-effect waves-light">Telefone</a>
															
															</c:if>
															<button type="button" class="btn btn-secondary"
																data-toggle="modal" data-target="#ModalUsuario">Pesquisar</button>

														</form>
													</div>
												</div>
											</div>
											<!--  project and team member end -->
										</div>
										<span id="msg">${msg}</span>

										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaResultadosView">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">Nome</th>
														<th scope="col">Ver</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${modelLogins}" var="ml">
														<tr>
														 <td><c:out value="${ml.id}"></c:out> </td>
														 <td><c:out value="${ml.nome}"></c:out> </td>
														 <td><a class="btn btn-success" href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a> </td>
														</tr> 
													</c:forEach>
												</tbody>
											</table>
										</div>
										
										<nav aria-label="page navigation example">
											<ul class="pagination">
											
												<%
													int totalPagina = (int) request.getAttribute("totalPagina");
													
													for(int p = 0; p < totalPagina; p++){
														String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
														out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+ url +"\">"+(p + 1)+"</a></li>");
													}
												
												
												%>
																						
											</ul>									
										</nav>
										
										
										
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Required Jquery -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="ModalUsuario" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="Nome" id="nomeBusca" aria-describeby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success" type="button"
								onclick="buscarUsuario()">Buscar</button>
						</div>

					</div>
					<div style="height: 300px; overflow: scroll;">
						<table class="table" id="tabelaResultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Ver</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="ulPaginacaoUserAjax">
								
						
						</ul>
					</nav>
					
					<span id="totalResultados"></span>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	
	$("#rendamensal").maskMoney({prefix:'R$ ', allowNegative: false, thousands:'.', decimal:',', affixesStay: false});
	
	$("#rendamensal").focus();
	
	
	
	
	$(function() {
		$("#dataNascimento").datePicker({
			dateFormat: 'yyyy-mm-dd',
			dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sabado'],
			dayNamesMin: ['D','S','T','Q','Q','S','S'],
			dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
			monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			nextText: 'Proximo',
			prevText: 'Anterior'
		});
	});
	
	$("#numero").keypress(function (event) {
		return /\d/.test(String.fromCharCode(event.keyCode));
	});	
	
	$("#cep").keypress(function (event) {
		return /\d/.test(String.fromCharCode(event.keyCode));
	});	
	
	
		function pesquisaCep(){
			var cep = $("#cep").val();
			
			$.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
					
					 if (!("erro" in dados)) {
                         //Atualiza os campos com os valores da consulta.
                         $("#cep").val(dados.cep);
                         $("#logradouro").val(dados.logradouro);
                         $("#bairro").val(dados.bairro);
                         $("#localidade").val(dados.localidade);
                         $("#uf").val(dados.uf);
                        
                     } //end if.
			});
		}
	
	
		function visualizarImg(fotoembase64, fileFoto){
			
			var preview = document.getElementById(fotoembase64); //campo img do html
			var fileUser = document.getElementById(fileFoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function() {
				preview.src = reader.result; /*Carrega a foto na tela*/
			};
			
			if (fileUser) {
				reader.readAsDataURL(fileUser); /*Preview da imagem*/
			} else {
				preview.src = '';
			}
		}
	
	
		function verEditar(id) {

			var urlAction = document.getElementById('formUser').action;
			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;

		}

		
		function buscaUserPagAjax(url){
			
			var nomeBusca = document.getElementById('nomeBusca').value;
			var urlAction = document.getElementById('formUser').action;
			
			$.ajax(
					{

						method : "get",
						url : urlAction,
						data: url,
						success : function(response, textStatus, xhr) {

							var json = JSON.parse(response);

							$('#tabelaResultados > tbody > tr').remove();
							$("#ulPaginacaoUserAjax > li").remove();

							for (var p = 0; p < json.length; p++) {
								$('#tabelaResultados > tbody')
										.append(
												'<tr> <td>'
														+ json[p].id
														+ '</td> <td>'
														+ json[p].nome
														+ '</td> <td><button onclick="verEditar('
														+ json[p].id
														+ ')" type="button" class="btn btn-info">Ver</button> </td></tr>');
							}

							document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
							
							var totalPagina = xhr.getResponseHeader("totalPagina");
							
							for(var p = 0; p< totalPagina; p++){
								
								var url = urlAction + 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina=' + (p * 5);
								
								$("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" onclick="buscaUserPagAjax(\''+ url +'\')">'+ (p + 1) +'</a></li>');
								
							}
							
						}

					}).fail(
					function(xhr, status, errorThrown) {
						alert('Erro ao buscar usuario por nome: '
								+ xhr.responseText);
					});
			
		}
		
		
		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /* validando tem que ter valor para buscar no banco de dados*/

				var urlAction = document.getElementById('formUser').action;

				$.ajax(
								{

									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',
									success : function(response, textStatus, xhr) {

										var json = JSON.parse(response);

										$('#tabelaResultados > tbody > tr').remove();
										$("#ulPaginacaoUserAjax > li").remove();

										for (var p = 0; p < json.length; p++) {
											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td>'
																	+ json[p].nome
																	+ '</td> <td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn btn-info">Ver</button> </td></tr>');
										}

										document.getElementById('totalResultados').textContent = 'Resultados: ' + json.length;
										
										var totalPagina = xhr.getResponseHeader("totalPagina");
										
										for(var p = 0; p< totalPagina; p++){
											
											var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina=' + (p * 5);
											
											$("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" onclick="buscaUserPagAjax(\''+ url +'\')">'+ (p + 1) +'</a></li>');
											
										}
										
									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuario por nome: '
											+ xhr.responseText);
								});
			}

		}

		function criarDeleteComAjax() {

			if (confirm('Deseja realmente excluir os dados?')) {

				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletarajax',
					success : function(response) {
						limparForm();
						document.getElementById('msg').textContent = response;
					}

				}).fail(
						function(xhr, status, errorThrown) {
							alert('Erro ao deletar usuario por id: '
									+ xhr.responseText);
						});

			}

		}

		function criarDelete() {

			if (confirm('Deseja realmente excluir os dados?')) {

				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();

			}

		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements; /*retorna os elementos html dentro do form*/

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>
</body>

</html>
