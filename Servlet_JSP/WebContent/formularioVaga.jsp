<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Vaga</title>
<%@ include file="header.jsp" %>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="container">
	<h1>Vaga</h1>
	<form action="VagaServlet" method="post">
		<input type="hidden" name="acao" value="salvar"/>
		<input type="hidden" name="id" value="${vaga.id }"/>
		<div class="form-group">
			<label>Titulo</label>
			<input type="text" name="titulo" class="form-control" value="${vaga.titulo }"/>
		</div>
		<div class="form-group">
			<label>Cargo</label>
			<input type="text" name="cargo" class="form-control" value="${vaga.cargo }"/>
		</div>
		<div class="form-group">
			<label>Descrição</label>
			<input type="text" name="descricao" class="form-control" value="${vaga.descricao }"/>
		</div>
		<div class="form-group">
			<label>Salario</label>
			<input type="text" name="salario" class="form-control" value="${vaga.salario }"/>
		</div>
		<div class="form-group">
			<label>Quantidade</label>
			<input type="text" name="quantidade" class="form-control" value="${vaga.quantidade }"/>
		</div>
		<div class="form-group">
			<label>Data Anuncio</label>
			<input type="text" name="data" id="data" class="form-control" value="<fmt:formatDate value="${vaga.dataAnuncio }" pattern="dd/MM/yyyy" />" />
		</div>
		<div class="form-group">
			<label>Empresa</label>
			<select name="empresa" class="form-control" >
				<option value="0">Selecione</option>
				<c:forEach items="${empresas }" var="t">
					<c:if test="${t.id == vaga.empresa.id }">
						<option selected="selected" value="${t.id }"> <c:out value="${t.nome }"/> </option>
					</c:if>
					<c:if test="${t.id != vaga.empresa.id }">
						<option value="${t.id }"> <c:out value="${t.nome }"/> </option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<input type="submit" value="Salvar" class="btn btn-primary"/>
			<c:if test="${not empty vaga }">
				<a data-toggle="modal" href="#myModal" class="btn btn-danger">Excluir</a>
				<a href="VagaServlet?acao=listar" class="btn btn-default">Voltar</a>
			</c:if>
		</div>
	</form>
</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Excluir</h4>
        </div>
        <div class="modal-body">
          	Deseja Excluir a vaga <c:out value="${vaga.titulo }"/> ?
        </div>
        <div class="modal-footer">
          <form action="VagaServlet?acao=remover" method="post">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          	  <input type="hidden" name="id" value="${vaga.id }"/>
	          <input type="submit" class="btn btn-danger" value="Excluir"/>
          </form>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<script type="text/javascript">
	$(function(){
		$("#data").datepicker();
	});
</script>

</body>
</html>