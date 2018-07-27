package com.gestion.vols.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Aeroport {

	@Id
	@Column(name = "idAeroport")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="nom",nullable=false, columnDefinition = "VARCHAR(30)",unique=true)
	private String nom;
	
	@ManyToOne
	@JoinColumn(name = "idVille")
	private Ville ville;

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

	public Ville getVille() {
		return ville;
	}

	public void setVille(Ville ville) {
		this.ville = ville;
	}
	
	
	
	
}
