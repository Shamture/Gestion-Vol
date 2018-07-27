package com.gestion.vols.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class User {

	@Id
	@Column(name = "idUser")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "nom", nullable = false, columnDefinition = "VARCHAR(50)")
	private String nom;
	@Column(name = "email", unique = true, nullable = false, columnDefinition = "VARCHAR(50)")
	private String email;
	@Column(name = "tel", unique = true, nullable = false, columnDefinition = "VARCHAR(15)")
	private String tel;
	@Column(name = "type", nullable = false, columnDefinition = "VARCHAR(10)")
	private String type;
	@Column(name = "login", unique = true, nullable = false, columnDefinition = "VARCHAR(50)")
	private String login;
	@Column(name = "password", nullable = false, columnDefinition = "VARCHAR(255)")
	private String password;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
