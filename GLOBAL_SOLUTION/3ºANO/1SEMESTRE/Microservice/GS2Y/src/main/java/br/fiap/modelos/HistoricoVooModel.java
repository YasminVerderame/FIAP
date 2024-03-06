package br.fiap.modelos;
import java.time.LocalDate;

public class HistoricoVooModel {
	int id;
	int idDrone;
	String latitudeInicioVoo;
	String longitudeInicioVoo;
	String latitudeFimVoo;
	String longitudeFimVoo;
	String altitudeMedia;
	String velocidadeMedia;
	LocalDate dataDecolagem;
	LocalDate dataAterrissagem;
	
	public int  getId() {
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
	public String getLatitudeInicioVoo() {
		return latitudeInicioVoo;
	}
	public void setLatitudeInicioVoo(String latitudeInicioVoo) {
		this.latitudeInicioVoo = latitudeInicioVoo;
	}
	public String getLongitudeInicioVoo() {
		return longitudeInicioVoo;
	}
	public void setLongitudeInicioVoo(String llongitudeInicioVoo) {
		this.longitudeInicioVoo = llongitudeInicioVoo;
	}
	public String getLatitudeFimVoo() {
		return latitudeFimVoo;
	}
	public void setLatitudeFimVoo(String latitudeFimVoo) {
		this.latitudeFimVoo = latitudeFimVoo;
	}
	public String getLongitudeFimVoo() {
		return longitudeFimVoo;
	}
	public void setLongitudeFimVoo(String longitudeFimVoo) {
		this.longitudeFimVoo = longitudeFimVoo;
	}
	public String getAltitudeMedia() {
		return altitudeMedia;
	}
	public void setAltitudeMedia(String altitudeMedia) {
		this.altitudeMedia = altitudeMedia;
	}
	public String getVelocidadeMedia() {
		return velocidadeMedia;
	}
	public void setVelocidadeMedia(String velocidadeMedia) {
		this.velocidadeMedia = velocidadeMedia;
	}
	public LocalDate getDataDecolagem() {
		return dataDecolagem;
	}
	public void setDataDecolagem(LocalDate dataDecolagem) {
		this.dataDecolagem = dataDecolagem;
	}
	public LocalDate getDataAterrissagem() {
		return dataAterrissagem;
	}
	public void setDataAterrissagem(LocalDate dataAterrissagem) {
		this.dataAterrissagem = dataAterrissagem;
	}
}
