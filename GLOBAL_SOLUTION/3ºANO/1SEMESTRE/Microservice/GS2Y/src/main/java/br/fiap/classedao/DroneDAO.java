package br.fiap.classedao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.fiap.dao.conexao.Conexao;
import br.fiap.modelos.DroneModelo;

public class DroneDAO extends DAO {
	public void inserir(DroneModelo drone) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		sql = "insert into DRONE VALUES(idDrone_seq.nextval, ?, ?, ?, ?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, drone.getModelo());
			ps.setDate(2,Date.valueOf(drone.getDataCompra()) );
			ps.setString(3, drone.getCapacidadeBateria());
			ps.setString(4, drone.getNumeroSerie());
			ps.setString(5, drone.getCapacidadeCarga());
			
			ps.execute();
			ps.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro ao inserir drone\n" + e);
		}
	}
	
	
	
	public List<DroneModelo> listar() {
		List<DroneModelo> lista = new ArrayList<DroneModelo>();
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		DroneModelo drone;
		
		sql = "select idDrone, modelo, datacompra,capacidadebateria,numeroSerie "
				+ ",capacidadeCarga  from Drone  ";
		
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				drone = new DroneModelo();
				drone.setId(rs.getInt("idDrone"));
				drone.setModelo(rs.getString("modelo"));
				drone.setDataCompra(rs.getDate("datacompra").toLocalDate());
				drone.setCapacidadeBateria(rs.getString("capacidadebateria"));
				drone.setNumeroSerie(rs.getString("numeroSerie"));
				drone.setCapacidadeCarga(rs.getString("capacidadeCarga"));
				lista.add(drone);
			}
			ps.close();
			conexao.desconectar();
		}
		catch(SQLException e) {
			System.out.println("erro ao listar Drones\n " + e);
		}
		
		
		return lista;
	}
	
	public DroneModelo pesquisar(Integer idDrone) {
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		DroneModelo drone=null;

		sql = "SELECT * FROM drone WHERE idDrone = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, idDrone);
			rs = ps.executeQuery();
			while (rs.next()) {
				drone = new DroneModelo();
				drone.setId(rs.getInt("idDrone"));
				drone.setModelo(rs.getString("modelo"));
				drone.setDataCompra(rs.getDate("dataCompra").toLocalDate());
				drone.setCapacidadeBateria(rs.getString("capacidadeBateria"));
				drone.setNumeroSerie(rs.getString("numeroSerie"));
				drone.setCapacidadeCarga(rs.getString("capacidadeCarga"));
			}
			ps.close();
			rs.close();
			conexao.desconectar();
			connection.close();
		} catch (SQLException e) {
			System.out.println("Erro encontrar Drone " + e);
		}

		return drone;
	}
	
	
	
	
	
	
}
