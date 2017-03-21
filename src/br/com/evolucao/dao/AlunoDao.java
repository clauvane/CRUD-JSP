package br.com.evolucao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import br.com.evolucao.model.Aluno;

public class AlunoDao {
	
	public List<Aluno> getAlunos(){
		List<Aluno> alunos = new ArrayList<>();
		Connection con = ConnectionFactory.getConnection();
		try {
			String sql = "select * from evolucao.tb_aluno";
			ResultSet rs = con.prepareStatement(sql).executeQuery();
			while (rs.next()) {
				Integer id = rs.getInt("id");
				String nome = rs.getString("nome");
				Integer idade = rs.getInt("idade");
				String email = rs.getString("email");
				Date dataNascimento = rs.getDate("data_nascimento");
				Aluno aluno = new Aluno(id, nome, idade, email, dataNascimento);
				alunos.add(aluno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (Objects.nonNull(con)) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return alunos;
	}

	public boolean salvar(Aluno aluno) {
		Connection con = ConnectionFactory.getConnection();
		try {
			String sql = "insert into evolucao.tb_aluno values "
					+ "((select max(id) + 1 from evolucao.tb_aluno),?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, aluno.getNome());
			ps.setInt(2, aluno.getIdade());
			ps.setString(3, aluno.getEmail());
			ps.setDate(4, new java.sql.Date(aluno.getDataNascimento().getTime()));
			ps.execute();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (Objects.nonNull(con)) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	public boolean atualizar(Aluno aluno) {
		Connection con = ConnectionFactory.getConnection();
		try {
			String sql = "update evolucao.tb_aluno set "
					+ "nome=?, "
					+ "idade=?, "
					+ "email=?, "
					+ "data_nascimento=? "
					+ "where id=?"
					;
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, aluno.getNome());
			ps.setInt(2, aluno.getIdade());
			ps.setString(3, aluno.getEmail());
			ps.setDate(4, new java.sql.Date(aluno.getDataNascimento().getTime()));
			ps.setInt(5, aluno.getId());
			ps.execute();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (Objects.nonNull(con)) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	public boolean remover(Integer id) {
		Connection con = ConnectionFactory.getConnection();
		try {
			String sql = "delete from evolucao.tb_aluno where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (Objects.nonNull(con)) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}

}
