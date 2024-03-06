package br.fiap.modelos;

import java.util.Random;

import br.fiap.classedao.UsuarioDAO;

public class UsuarioModel {

	int id;
	String senha;
	String cargo;
	
	
	public UsuarioModel(String senha, String cargo) {
		super();
		this.id = geraId();
		this.senha = senha;
		this.cargo = cargo;
	}
	
	public UsuarioModel(int id, String senha, String cargo) {
		super();
		this.id = id;
		this.senha = senha;
		this.cargo = cargo;
	}



	private int geraId() {
		UsuarioDAO dao = new UsuarioDAO();
		Random r = new Random();
		int id;
		do{
			id = r.nextInt(0,1000);
		}while(dao.pesquisarId(id));
		return id;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha =senha;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	
	
	
	
	
	
	
	
	
	
}
