package br.fiap.modelos;

import java.time.LocalDate;

public class LicencaVooModel {
	int  id;
	DroneModelo idDrone;
	String licencaVoo;
	LocalDate dataValidade;
	LocalDate dataEmissao;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public DroneModelo getDrone() {
		return idDrone;
	}
	public void setIdDrone(DroneModelo idDrone) {
		this.idDrone = idDrone;
	}

	public String getLicencaVoo() {
		return licencaVoo;
	}
	public void setLicencaVoo(String licencaVoo) {
		this.licencaVoo = licencaVoo;
	}
	public LocalDate getDataValidade() {
		return dataValidade;
	}
	public void setDataValidade(LocalDate dataValidade) {
		this.dataValidade = dataValidade;
	}
	public LocalDate getDataEmissao() {
		return dataEmissao;
	}
	public void setDataEmissao(LocalDate dataEmissao) {
		this.dataEmissao = dataEmissao;
	}
}
