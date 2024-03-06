package br.fiap.classedao;

import java.sql.Date;
import java.sql.SQLException;

import br.fiap.dao.conexao.Conexao;
import br.fiap.modelos.TelemetriaModel;

public class TelemetriaDAO extends DAO{

	public void inserir(TelemetriaModel telemetria) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "insert into Telemetria VALUES(idTelemetria_seq.nextval, ?, ?, ?, ?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, telemetria.getIdDrone());
			ps.setString(2, telemetria.getLatitude());
			ps.setString(3, telemetria.getLongitude());
			ps.setString(4, telemetria.getVelocidade());
			ps.setString(5, telemetria.getDirecao());
			ps.setDate(6,Date.valueOf(telemetria.getDataHora()) );
			
			ps.execute();
			ps.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir Telemetria\n" + e);
		}
	}
	
}
