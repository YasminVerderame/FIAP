package br.fiap.modelos;


import java.time.LocalDate;


public class DroneModelo {
	int id;
	String modelo;
	LocalDate dataCompra;
	String capacidadeBateria;
	String numeroSerie;
	String CapacidadeCarga;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public LocalDate getDataCompra() {
		return dataCompra;
	}
	public void setDataCompra(LocalDate dataCompra) {
		this.dataCompra = dataCompra;
	}
	public String getCapacidadeBateria() {
		return capacidadeBateria;
	}
	public void setCapacidadeBateria(String capacidadeBateria) {
		this.capacidadeBateria = capacidadeBateria;
	}
	public String getNumeroSerie() {
		return numeroSerie;
	}
	public void setNumeroSerie(String numeroSerie) {
		this.numeroSerie = numeroSerie;
	}

	public String getCapacidadeCarga() {
		return CapacidadeCarga;
	}
	public void setCapacidadeCarga(String capacidadeCarga) {
		CapacidadeCarga = capacidadeCarga;
	}
}
