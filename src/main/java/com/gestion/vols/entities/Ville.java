package com.gestion.vols.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Ville {

	@Id
	@Column(name = "idVille")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="nom",nullable=false, columnDefinition = "VARCHAR(30)",unique=true)
	private String nom;
	
	@OneToMany(mappedBy="ville", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Aeroport> aeroports;
	
	@ManyToOne
	@JoinColumn(name = "idPays")
	private Pays pays;

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

	public Set<Aeroport> getAeroports() {
		return aeroports;
	}

	public void setAeroports(Set<Aeroport> aeroports) {
		this.aeroports = aeroports;
	}

	public Pays getPays() {
		return pays;
	}

	public void setPays(Pays pays) {
		this.pays = pays;
	}
	
	
	
}
