<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
										<div class="col-sm-12">
											<!-- Basic Form Inputs card start -->
											<div class="card">

												<div class="card-block">
													<h5 class="sub-title">Rel. Usuário</h5>
													<form class="form-material"
														action="<%=request.getContextPath()%>/ServletUsuarioController?acao=imprimirRelatorioUser"
														method="get" id="formUser">

														<input type="hidden" name="acao"
															value="imprimirRelatorioUser">

														<div class="form-row align-items-center">

															<div class="col-sm-3 my-1">
																<label class="sr-only" for="dataInicial">Data
																	Inicial</label> <input value="${dataInicial}" type="date"
																	class="form-control" name="dataInicial"
																	id="dataInicial">
															</div>

															<div class="col-sm-3 my-1">
																<label class="sr-only" for="dataFinal">Data
																	Final</label> <input value="${dataFinal}" type="date"
																	class="form-control" name="dataFinal" id="dataFinal">

															</div>
															<div class="col-auto my-1">
																<button type="submit" class="btn btn-primary">Imprimir
																	Relatorio</button>
															</div>
														</div>


													</form>
													<div style="height: 300px; overflow: scroll;">
														<table class="table" id="tabelaResultadosView">
															<thead>
																<tr>
																	<th scope="col">ID</th>
																	<th scope="col">Nome</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${listaUser}" var="ml">
																	<tr>
																		<td><c:out value="${ml.id}"></c:out></td>
																		<td><c:out value="${ml.nome}"></c:out></td>
																		
																	</tr>
																	
																	<c:forEach items="${ml.telefones}" var="fone">
																		<tr>
																			<td style="font-size: 10px;"><c:out value="${fone.numero}"></c:out></td>
																		</tr>
																	
																	</c:forEach>
																	
																	
																</c:forEach>
																
															</tbody>
														</table>
													</div>


												</div>
											</div>
										</div>

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

	<script type="text/javascript">
		$(function() {
			$("#dataInicial")
					.datePicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sabado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sab' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Proximo',
								prevText : 'Anterior'
							});
		});

		$(function() {
			$("#dataFinal")
					.datePicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sabado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sab' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Proximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>

</html>
