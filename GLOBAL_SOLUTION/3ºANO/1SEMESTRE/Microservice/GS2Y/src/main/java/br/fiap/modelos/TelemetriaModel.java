package br.fiap.modelos;
import java.time.LocalDate;

public class TelemetriaModel {

	int id;
	int idDrone;
	String latitude ;
	String longitude;
	String velocidade;
	String direcao;
	LocalDate dataHora;
	
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getIdDrone() {
		return idDrone;
	}
	public void setIdDrone(int idDrone) {
		this.idDrone = idDrone;
	}
	

	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getVelocidade() {
		return velocidade;
	}
	public void setVelocidade(String velocidade) {
		this.velocidade = velocidade;
	}
	public String getDirecao() {
		return direcao;
	}
	public void setDirecao(String direcao) {
		this.direcao = direcao;
	}
	public LocalDate getDataHora() {
		return dataHora;
	}
	public void setDataHora(LocalDate dataHora) {
		this.dataHora = dataHora;
	}
	
}
