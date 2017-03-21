package br.com.evolucao.servlet;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.evolucao.dao.AlunoDao;

@WebServlet("/aluno/remover")
public class RemocaoAlunoServlet extends HttpServlet{

	private static final long serialVersionUID = 5094732240024350118L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlunoDao dao = new AlunoDao();
		String id = request.getParameter("id");
		if (Objects.isNull(id) || id.isEmpty()) {
			throw new IllegalArgumentException("Id do aluno não informado.");
		}
		
		if (dao.remover(Integer.parseInt(id))) {
			request.setAttribute("mensagem_sucesso", "Aluno removido com sucesso.");
		} else{
			request.setAttribute("mensagem_erro", "Erro ao remover aluno.");
		}
		
		request.getRequestDispatcher("/paginas/aluno/lista.jsp").forward(request, response);
	}

}
