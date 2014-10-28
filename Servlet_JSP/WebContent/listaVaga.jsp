<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Lista Vaga</title>
<%@ include file="header.jsp" %>
</head>
<body>
<%@ include file="menu.jsp" %>

<div class="container">
	<c:if test="${not empty msg }">
		<h4 class="alert alert-success">
			<c:out value="${msg }"/>
		</h4>
	</c:if>
	<h2>Lista de Vagas</h2>
	<table class="table">
		<tr>
			<th>Titulo</th>
			<th>Cargo</th>
			<th>Descrição</th>
			<th>Salário</th>
			<th>Data Anuncio</th>
			<th>Quantidade</th>
			<th>Empresa</th>
			<th></th>
		</tr>
		<c:forEach var="v" items="${vagas }">
			<tr>
				<td><c:out value="${v.titulo }"/> </td>
				<td><c:out value="${v.cargo }"/> </td>
				<td><c:out value="${v.descricao }"/> </td>
				<td><c:out value="${v.salario }"/> </td>
				<td><fmt:formatDate value="${v.dataAnuncio }" pattern="dd/MM/yyyy" /> </td>
				<td><c:out value="${v.quantidade }"/> </td>
				<td><c:out value="${v.empresa.nome }"/> </td>
				<td>
					<c:url value="VagaServlet" var="link">
						<c:param name="acao" value="exibir"/>
						<c:param name="id" value="${v.id }"/>
					</c:url>
					<a href="${link }" class="btn btn-info">Alterar</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>