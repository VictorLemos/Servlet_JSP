<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Empresas</title>
<%@ include file="header.jsp" %>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="container">
	<h1>Empresa</h1>
	<form action="EmpresaServlet" method="post">
		<input type="hidden" name="acao" value="salvar"/>
		<input type="hidden" name="id" value="${empresa.id }"/>
		<div class="form-group">
			<label>Nome</label>
			<input type="text" name="nome" class="form-control" value="${empresa.nome }"/>
		</div>
		<div class="form-group">
			<label>Numero de Funcionarios</label>
			<input type="text" name="numeroFuncionario" class="form-control" value="${empresa.numeroFuncionarios }"/>
		</div>
		<div class="form-group">
			<label>Porte</label>
			<input type="text" name="porte" class="form-control" value="${empresa.porte }"/>
		</div>
		<div class="form-group">
			<label>Local</label>
			<input type="text" name="local" class="form-control" value="${empresa.local }"/>
		</div>
		<div class="form-group">
			<input type="submit" value="Salvar" class="btn btn-primary"/>
			<c:if test="${not empty empresa }">
				<a data-toggle="modal" href="#myModal" class="btn btn-danger">Excluir</a>
				<a href="EmpresaServlet?acao=listar" class="btn btn-default">Voltar</a>
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
				Deseja Excluir a empresa <c:out value="${empresa.nome }"/> ?
			</div>
			<div class="modal-footer">
				<form action="EmpresaServlet?acao=remover" method="post">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<input type="hidden" name="id" value="${empresa.id }"/>
	          		<input type="submit" class="btn btn-danger" value="Excluir"/>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>