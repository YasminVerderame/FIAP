package br.fiap.classedao;

import java.sql.Date;
import java.sql.SQLException;

import br.fiap.dao.conexao.Conexao;
import br.fiap.modelos.LicencaVooModel;

public class LicencaVooDAO extends DAO {
	public void inserir(LicencaVooModel licencaVoo) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "insert into licensa_VOO VALUES(idLicenca_voo_seq.nextval,?,?,?,? )";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, licencaVoo.getDrone().getId());
			ps.setString(2,licencaVoo.getLicencaVoo());
			ps.setDate(3,Date.valueOf(licencaVoo.getDataValidade()) );
			ps.setDate(4,Date.valueOf(licencaVoo.getDataEmissao()) );
			
			
			ps.execute();
			ps.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir licenca de voo\n" + e);
		}
	}
}
