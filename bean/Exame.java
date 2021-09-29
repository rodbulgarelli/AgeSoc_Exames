package com.crud_exames.bean;

public class Exame {
	
	private int id;
	private int idpaciente;
	private String exame;
	private String data;
	private String obs;
	private String pacienteexame;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdpaciente() {
		return idpaciente;
	}
	public void setIdpaciente(int idpaciente) {
		this.idpaciente = idpaciente;
	}
	public String getExame() {
		return exame;
	}
	public void setExame(String exame) {
		this.exame = exame;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public String getPacienteexame() {
		return pacienteexame;
	}
	public void setPacienteexame(String pacienteexame) {
		this.pacienteexame = pacienteexame;
	}

	
/////Getters & Setters	
	
}