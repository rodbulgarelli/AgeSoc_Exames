package com.crud_exames.bean;

public class Paciente {
	
	private int id;
	private String nome;
	private String cpf;
	private int idord;

	
/////Getters & Setters	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public int getIdOrd() {
		return idord;
	}
	public void setIdOrd(int idord) {
		this.idord = idord;
	
	}
	
}
