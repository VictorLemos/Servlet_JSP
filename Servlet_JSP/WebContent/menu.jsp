<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-default">
	<div class="container">
		<a href="home.jsp" class="navbar-brand">Servlet & JSP/Bootstrap/JSTL</a>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">Vagas <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="VagaServlet?acao=exibir">Cadastrar Vaga </a></li>
					<li><a href="VagaServlet?acao=listar">Vagas </a></li>
				</ul>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">Empresas <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="formularioEmpresa.jsp">Cadastrar Empresa </a></li>
					<li><a href="EmpresaServlet?acao=listar">Empresas Cadastradas </a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>


