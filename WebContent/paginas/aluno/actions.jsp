<%@ page import="br.com.evolucao.dao.*"%>
<%@ page import="br.com.evolucao.model.Aluno"%>
<%@ page import="java.util.Objects"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<% 
	AlunoDao alunoDao = new AlunoDao();
	if("MERGE".equals(request.getParameter("action"))){
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
		if (Objects.isNull(aluno.getId()) || id.isEmpty()) {
			if (alunoDao.salvar(aluno)){
				request.setAttribute("mensagem_sucesso", "Aluno cadastrado com sucesso.");
			} else{
				request.setAttribute("mensagem_erro", "Erro ao cadastrar aluno.");
			}
		} else {
			if (alunoDao.atualizar(aluno)){
				request.setAttribute("mensagem_sucesso", "Aluno editado com sucesso.");
			} else{
				request.setAttribute("mensagem_erro", "Erro ao editar aluno.");
			}
		}
		request.getRequestDispatcher("novo.jsp").forward(request, response);
	} else if("REMOVER".equals(request.getParameter("action"))){
		String id = request.getParameter("id");
		if (Objects.isNull(id) || id.isEmpty()) {
			throw new IllegalArgumentException("Id do aluno não informado.");
		}
		
		if (alunoDao.remover(Integer.parseInt(id))) {
			request.setAttribute("mensagem_sucesso", "Aluno removido com sucesso.");
		} else{
			request.setAttribute("mensagem_erro", "Erro ao remover aluno.");
		}
		
		request.getRequestDispatcher("/paginas/aluno/lista.jsp").forward(request, response);
	} 
%>