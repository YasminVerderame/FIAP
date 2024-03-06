package br.fiap.classedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.fiap.dao.conexao.Conexao;

public class DAO {
	protected static Connection connection;
	protected ResultSet rs;
	protected PreparedStatement ps;
	protected String sql;

	public DAO() {
		if (connection == null) {
			connection = new Conexao().conectar();
		}
	}

	protected PreparedStatement prepareStatement(String sql) throws SQLException {
		return connection.prepareStatement(sql);
	}
}
