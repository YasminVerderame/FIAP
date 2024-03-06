package br.fiap.classedao;

import java.sql.Date;
import java.sql.SQLException;
import br.fiap.dao.conexao.Conexao;
import br.fiap.modelos.HistoricoVooModel;

public class HistoricoVooDAO extends DAO {

	public void inserir(HistoricoVooModel hist) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "insert into Historico_voo VALUES(historicoid_seq.nextval, ?, ?, ?, ?,?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, hist.getIdDrone());
			ps.setString(2, hist.getLatitudeInicioVoo());
			ps.setString(3, hist.getLongitudeInicioVoo());
			ps.setString(4, hist.getLatitudeFimVoo());
			ps.setString(5, hist.getLongitudeFimVoo());
			ps.setString(6, hist.getAltitudeMedia());
			ps.setString(7, hist.getVelocidadeMedia());
			ps.setDate(8,Date.valueOf(hist.getDataDecolagem()) );
			ps.setDate(9,Date.valueOf(hist.getDataAterrissagem()) );
			
			ps.execute();
			ps.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir historico\n" + e);
		}
	}
	
}
