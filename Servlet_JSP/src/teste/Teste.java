package teste;

import java.sql.SQLException;
import java.util.Calendar;

import br.com.jobs.bean.Empresa;
import br.com.jobs.bean.Vaga;
import br.com.jobs.bo.EmpresaBO;
import br.com.jobs.bo.VagaBO;

public class Teste {

	public static void main(String[] args) throws SQLException {
		
		EmpresaBO empresaBO = new EmpresaBO();
		
		Empresa empresa = new Empresa();
		empresa.setLocal("Sampa");
		empresa.setNome("Of Boa");
		empresa.setNumeroFuncionarios(400);
		empresa.setPorte("Grande");
		empresa.setId(2);
		
		empresaBO.inserir(empresa);
		
		
		VagaBO vagaBO = new VagaBO();
		
		Vaga vaga = new Vaga();
		vaga.setCargo("Analista");
		vaga.setDataAnuncio(Calendar.getInstance().getTime());
		vaga.setDescricao("Bom");
		vaga.setQuantidade(8);
		vaga.setTitulo("Analista Senior");
		vaga.setSalario(20020);
		vaga.setEmpresa(empresa);
		
		vagaBO.inserir(vaga);
		
	}
}
