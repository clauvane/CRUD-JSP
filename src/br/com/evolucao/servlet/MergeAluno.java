package br.com.evolucao.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.evolucao.dao.AlunoDao;
import br.com.evolucao.model.Aluno;

@WebServlet("/aluno")
public class MergeAluno extends HttpServlet{

	private static final long serialVersionUID = 5094732240024350118L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Aluno aluno = new Aluno();
		String id = request.getParameter("id");
		aluno.setId(Objects.isNull(id) || id.isEmpty() ? null : Integer.parseInt(id));
		aluno.setNome(request.getParameter("nome"));
		aluno.setIdade(Integer.parseInt(request.getParameter("idade")));
		aluno.setEmail(request.getParameter("email"));
		try {
			String dataNascimento = request.getParameter("dataNascimento");
			aluno.setDataNascimento(new SimpleDateFormat("yyyy-MM-dd").parse(dataNascimento));
		} catch (ParseException e) {
			throw new IllegalArgumentException("A data de nascimento informada não é valida.");
		}
		
		AlunoDao dao = new AlunoDao();
		if (Objects.isNull(aluno.getId())) {
			if (dao.salvar(aluno)){
				request.setAttribute("mensagem_sucesso", "Aluno cadastrado com sucesso.");
			} else{
				request.setAttribute("mensagem_erro", "Erro ao cadastrar aluno.");
			}
		} else {
			if (dao.atualizar(aluno)){
				request.setAttribute("mensagem_sucesso", "Aluno editado com sucesso.");
			} else{
				request.setAttribute("mensagem_erro", "Erro ao editar aluno.");
			}
		}
		
		request.getRequestDispatcher("/paginas/aluno/novo.jsp").forward(request, response);
	}

}
