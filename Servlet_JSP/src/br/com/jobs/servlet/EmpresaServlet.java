package br.com.jobs.servlet;


import java.io.IOException;
import java.util.ArrayList;




import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jobs.bean.Empresa;
import br.com.jobs.bo.EmpresaBO;

/**
 * Servlet implementation class EmpresaServlet
 */
@WebServlet("/EmpresaServlet")
@SuppressWarnings("serial")
public class EmpresaServlet extends HttpServlet {
	
	private EmpresaBO empresaBO = new EmpresaBO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String retorno = "";
		String acao = request.getParameter("acao");
		
		switch (acao) {
		case "salvar":
			salvar(request);
			listar(request);
			retorno = "listaEmpresa.jsp";
			break;
		case "remover":
			remover(request);
			listar(request);
			retorno = "listaEmpresa.jsp";
			break;	
		case "exibir":
			editar(request);
			retorno = "formularioEmpresa.jsp";
			break;
		case "listar":
			listar(request);
			retorno = "listaEmpresa.jsp";
			break;
		}
		
		request.getRequestDispatcher(retorno).forward(request, response);
	}
	
	private void editar(HttpServletRequest request){
		if (request.getParameter("id")!=null){
			int id = Integer.parseInt(request.getParameter("id"));
			Empresa empresa = empresaBO.buscarPorId(id);
			request.setAttribute("empresa", empresa);
		}
	}
	
	private void remover(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		empresaBO.removerPorID(id);
		request.setAttribute("msg", "Empresa Removida com sucesso!");
	}
	
	private void listar(HttpServletRequest request){
		ArrayList<Empresa> lista = empresaBO.listarTodos();
		request.setAttribute("empresas", lista );
	}
	
	
	private void salvar(HttpServletRequest request){
		String nome = request.getParameter("nome");
		String local = request.getParameter("local");
		int nro = Integer.parseInt(request.getParameter("numeroFuncionario"));
		String porte = request.getParameter("porte");
		
		String id = request.getParameter("id");
		
		Empresa empresa = new Empresa();
		empresa.setNome(nome);
		empresa.setLocal(local);
		empresa.setNumeroFuncionarios(nro);
		empresa.setPorte(porte);
		
		if (id.equals("")){
			empresaBO.inserir(empresa);
			request.setAttribute("msg", "Empresa Cadastrado com sucesso!");
		}else{
			int codigo = Integer.parseInt(id);
			empresa.setId(codigo);
			empresaBO.alterar(empresa);
			request.setAttribute("msg", "Empresa Alterado com sucesso!");
		}
	}

}
