package br.com.jobs.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jobs.bean.Empresa;
import br.com.jobs.bean.Vaga;
import br.com.jobs.bo.EmpresaBO;
import br.com.jobs.bo.VagaBO;

/**
 * Servlet implementation class VagaServlet
 */
@WebServlet("/VagaServlet")
@SuppressWarnings("serial")
public class VagaServlet extends HttpServlet {
	
	private VagaBO vagaBO = new VagaBO();
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
			retorno = "listaVaga.jsp";
			break;
		case "remover":
			remover(request);
			listar(request);
			retorno = "listaVaga.jsp";
			break;
		case "exibir":
			editar(request);
			listarEmpresas(request);
			retorno = "formularioVaga.jsp";
			break;
		case "listar":
			listar(request);
			retorno = "listaVaga.jsp";
			break;
		case "exibirFormulario":
			listarEmpresas(request);
			retorno = "formularioVaga.jsp";
		}
		
		request.getRequestDispatcher(retorno).forward(request, response);
	}
	
	
	private void listarEmpresas(HttpServletRequest request) {
		ArrayList<Empresa> empresas = empresaBO.listarTodos();
		request.setAttribute("empresas", empresas);
	}

	private void editar(HttpServletRequest request){
		if (request.getParameter("id")!=null){
			int id = Integer.parseInt(request.getParameter("id"));
			Vaga vaga = vagaBO.buscarPorId(id);
			request.setAttribute("vaga", vaga);
		}
	}
	
	private void listar(HttpServletRequest request){
		ArrayList<Vaga> lista = vagaBO.listarTodos();
		request.setAttribute("vagas", lista );
	}
	
	private void remover(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		vagaBO.removerPorID(id);
		request.setAttribute("msg", "Vaga Removido com sucesso!");
	}
	
	private void salvar(HttpServletRequest request){
		String cargo = request.getParameter("cargo");
		String descricao = request.getParameter("descricao");
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		String titulo = request.getParameter("titulo");
		
		double salario = Double.parseDouble(request.getParameter("salario"));
		int idEmpresa = Integer.parseInt(request.getParameter("empresa"));
		
		Date data = null;
		String id = request.getParameter("id");
		
		try {
			data = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Empresa empresa = empresaBO.buscarPorId(idEmpresa);
		
		Vaga vaga = new Vaga();
		vaga.setCargo(cargo);
		vaga.setDataAnuncio(data);
		vaga.setDescricao(descricao);
		vaga.setQuantidade(quantidade);
		vaga.setSalario(salario);
		vaga.setTitulo(titulo);
		vaga.setEmpresa(empresa);
		
		if (id.equals("")){
			vagaBO.inserir(vaga);
			request.setAttribute("msg", "Vaga Cadastrado com sucesso!");
		}else{
			int codigo = Integer.parseInt(id);
			vaga.setId(codigo);
			vagaBO.alterar(vaga);
			request.setAttribute("msg", "Vaga Alterado com sucesso!");
		}
	}

}
