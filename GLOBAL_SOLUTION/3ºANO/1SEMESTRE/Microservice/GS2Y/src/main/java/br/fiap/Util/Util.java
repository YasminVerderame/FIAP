package br.fiap.Util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Util {
	public LocalDate formatarData(String dataString) {
		String[] dataAux = dataString.split("-");
		dataString = "";
		dataString = dataAux[2] + "/" + dataAux[1] + "/" + dataAux[0];
		
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate data = LocalDate.parse(dataString, formato);
		return data;
	}
}
