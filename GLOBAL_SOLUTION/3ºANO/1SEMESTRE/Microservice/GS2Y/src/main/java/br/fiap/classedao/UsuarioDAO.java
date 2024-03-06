package br.fiap.classedao;

import java.sql.SQLException;


import br.fiap.dao.conexao.Conexao;

import br.fiap.modelos.UsuarioModel;

public class UsuarioDAO extends DAO {
	
	public void inserir(UsuarioModel usuario) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "insert into USUARIO VALUES(?, ?, ?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, usuario.getId());
			ps.setString(2, usuario.getSenha());
			ps.setString(3, usuario.getCargo());
			
			ps.execute();
			ps.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir Usuario\n" + e);
		}
	}
	
	public UsuarioModel pesquisar(String id, String senha) {
		UsuarioModel u = null;
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "select * from USUARIO where idUsuario = ? and senha = ?";
		
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, senha);
			rs = ps.executeQuery();
			if(rs.next()) {
				u = new UsuarioModel(rs.getInt("idUsuario"),rs.getString("senha"),rs.getString("cargo"));
			}			
			ps.close();
			conexao.desconectar();
		}
		catch(SQLException e) {
			System.out.println("Erro ao pesquisar usuario\n" + e);
		}
		return u;
	}

	public boolean pesquisarId(int id) {
			boolean aux = false;
			connection = new Conexao().conectar();
			sql = "select * from Usuario where idUsuario = ?";
			try {
				ps = connection.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				aux = rs.next();
			} catch (SQLException e) {
				System.out.println("Erro ao pesquisar o id de usuario\n" + e);
			}
			return aux;
		}
	
	
}
